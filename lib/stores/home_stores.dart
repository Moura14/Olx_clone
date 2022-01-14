import 'package:mobx/mobx.dart';
import 'package:olx_mobx/models/category.dart';
import 'package:olx_mobx/stores/filter_stores.dart';
part 'home_stores.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  String search = '';

  @action
  void setSearch(String value) => search = value;

  @observable
  Category category;

  @action
  void setCategory(Category value) => category = value;

  @observable
  FilterStores filter = FilterStores();

  FilterStores get clonedField => filter.clone();

  @action
  void setFilter(FilterStores value) => filter = value;
}
