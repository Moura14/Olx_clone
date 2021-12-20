import 'package:dio/dio.dart';
import 'package:olx_mobx/models/adress.dart';
import 'package:olx_mobx/models/city.dart';
import 'package:olx_mobx/repositories/ibge_repository.dart';

class CepRepository {
  Future<Adress> getAdressFromApi(String cep) async {
    if (cep == null || cep.isEmpty) return Future.error("Cep Inválido");

    final cleanCep = cep.replaceAll(RegExp('[^0-9]'), '');
    if (cleanCep.length != 8) return Future.error("CEP inválido");

    final endpoint = 'http://viacep.com.br/ws/$cleanCep/json';

    try {
      final response = await Dio().get<Map>(endpoint);

      if (response.data.containsKey('error') && response.data['error'])
        return Future.error("CEP inválido");

      final ufList = await IBGERepository().getUFList();

      return Adress(
          cep: response.data['cep'],
          district: response.data['bairro'],
          city: City(name: response.data['localidade']),
          uf: ufList.firstWhere((uf) => uf.initials == response.data['uf']));
    } catch (e) {
      return Future.error("Falha ao buscar CEP");
    }
  }
}
