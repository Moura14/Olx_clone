import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:olx_mobx/models/ad.dart';
import 'package:olx_mobx/repositories/add_repository.dart';
import 'package:olx_mobx/stores/user_menage_stores.dart';
part 'myads_stores.g.dart';

class MyAdsStores = _MyAdsStoresBase with _$MyAdsStores;

abstract class _MyAdsStoresBase with Store {
  _MyAdsStoresBase() {
    _getMyAds();
  }

  @observable
  List<Ad> allAds = [];

  @computed
  List<Ad> get activesAds =>
      allAds.where((ad) => ad.status == AdStatus.ACTIVE).toList();

  List<Ad> get peddingAds =>
      allAds.where((ad) => ad.status == AdStatus.PENDING).toList();

  List<Ad> get soldAds =>
      allAds.where((ad) => ad.status == AdStatus.SOLD).toList();

  Future<void> _getMyAds() async {
    final user = GetIt.I<UserMenageStore>().user;

    try {
      allAds = await AdRepository().getMyAds(user);
    } catch (e) {}
  }
}
