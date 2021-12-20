import 'package:olx_mobx/models/city.dart';
import 'package:olx_mobx/models/uf.dart';

class Adress {
  Adress({this.uf, this.city, this.cep, this.district});
  UF uf;
  City city;

  String cep;
  String district;

  @override
  String toString() {
    // TODO: implement toString
    return 'Address{uf: $uf, city: $city, cep: $cep, district: $district}';
  }
}
