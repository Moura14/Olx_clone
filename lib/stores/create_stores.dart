import 'package:mobx/mobx.dart';
part 'create_stores.g.dart';

class CreateStores = _CreateStoresBase with _$CreateStores;

abstract class _CreateStoresBase with Store {
  ObservableList images = ObservableList();
}
