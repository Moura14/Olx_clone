import 'package:olx_mobx/models/adress.dart';
import 'package:olx_mobx/models/category.dart';
import 'package:olx_mobx/models/city.dart';
import 'package:olx_mobx/models/uf.dart';
import 'package:olx_mobx/models/user.dart';
import 'package:olx_mobx/repositories/table_keys.dart';
import 'package:olx_mobx/repositories/user.repositorie.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

enum AdStatus { PENDING, ACTIVE, SOLD, DELETED }

class Ad {
  Ad.fromParse(ParseObject object) {
    id = object.objectId;
    title = object.get<String>(keyAdTitle);
    description = object.get<String>(keyAdDescription);
    images = object.get<List>(keyAdImages).map((e) => e.url).toList();
    hidePhone = object.get<bool>(keyAdHidePhone);
    price = object.get<num>(keyAdPrice);
    created = object.createdAt;
    adress = Adress(
        district: object.get<String>(keyAdDistrict),
        city: City(name: object.get<String>(keyAdCity)),
        cep: object.get<String>(keyAdPostalCode),
        uf: UF(initials: object.get<String>(keyAdFederativeUnit)));
    view = object.get<int>(keyAdViews, defaultValue: 0);
    category = Category.fromParse(object.get<ParseObject>(keyAdCategory));
    status = AdStatus.values[object.get<int>(keyAdStatus)];
    user = UserRepository().mapParseToUser(object.get<ParseUser>(keyAdOwner));
  }

  Ad();

  String id;
  List images = [];
  String title;
  String description;

  Category category;
  Adress adress;
  num price;
  bool hidePhone = false;

  AdStatus status = AdStatus.PENDING;

  DateTime created;

  User user;

  int view;
}
