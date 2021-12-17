import 'package:mobx/mobx.dart';
import 'package:olx_mobx/models/category.dart';
part 'create_stores.g.dart';

class CreateStores = _CreateStoresBase with _$CreateStores;

abstract class _CreateStoresBase with Store {
  ObservableList images = ObservableList();

  @observable
  Category category;

  @action
  void setCategory(Category value) => category = value;
}
