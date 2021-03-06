import 'package:mobx/mobx.dart';
import 'package:olx_mobx/models/ad.dart';
import 'package:olx_mobx/models/category.dart';
import 'package:olx_mobx/repositories/add_repository.dart';
import 'package:olx_mobx/stores/filter_stores.dart';
part 'home_stores.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  _HomeStoreBase() {
    autorun((_) async {
      try {
        setLoading(true);
        final newAds = await AdRepository().getHomeAdList(
            filter: filter, search: search, category: category, page: page);

        newAddAds(newAds);
        adList.addAll(newAds);
        setError(null);
        setLoading(false);
      } catch (e) {
        setError(e);
      }
    });
  }

  ObservableList<Ad> adList = ObservableList<Ad>();
  @observable
  String search = '';

  @action
  void setSearch(String value) {
    search = value;
    resetPage();
  }

  @observable
  Category category;

  @action
  void setCategory(Category value) {
    category = value;
    resetPage();
  }

  @observable
  FilterStores filter = FilterStores();

  FilterStores get clonedField => filter.clone();

  @action
  void setFilter(FilterStores value) {
    filter = value;
    resetPage();
  }

  @observable
  String error;

  @action
  void setError(String value) => error = value;

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  int page = 0;

  @observable
  bool lastPage = false;

  @action
  void loadNextPage() {
    page++;
  }

  @action
  void newAddAds(List<Ad> newAdds) {
    if (newAdds.length < 10) lastPage = true;
    adList.addAll(newAdds);
  }

  @computed
  int get itemCount => lastPage ? adList.length : adList.length + 1;

  void resetPage() {
    page = 0;
    adList.clear();
    lastPage = false;
  }

  @computed
  bool get showProgress => loading && adList.isEmpty;
}
