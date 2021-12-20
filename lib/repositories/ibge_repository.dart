import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:olx_mobx/models/city.dart';
import 'package:olx_mobx/models/uf.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IBGERepository {
  Future<List<UF>> getUFList() async {
    final preference = await SharedPreferences.getInstance();

    if (preference.containsKey('UF_LIST')) {
      print("FOUND CACHE");
      final j = json.decode(preference.get('UF_LIST'));

      return j.map<UF>((j) => UF.fromJson(j)).toList()
        ..sort((UF a, UF b) =>
            a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    }

    print("NOT FOUND ON CACHE");
    const endpoint =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados';

    try {
      final response = await Dio().get<List>(endpoint);

      preference.setString('UF_LIST', json.encode(response.data));

      final ufList = response.data.map<UF>((j) => UF.fromJson(j)).toList()
        ..sort((UF a, UF b) =>
            a.name.toLowerCase().compareTo(b.name.toLowerCase()));

      return ufList;
    } on DioError {
      return Future.error("Falha ao obter lista de estados");
    }
  }

  Future<List<City>> getcityListFromApi(UF uf) async {
    String endpoint =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/${uf.id}/municipios';

    try {
      final response = await Dio().get<List>(endpoint);

      final cityList = response.data.map<City>((j) => City.fromJson(j)).toList()
        ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      return cityList;
    } on DioError {
      return Future.error("Falha ao obter lista de Cidades");
    }
  }
}
