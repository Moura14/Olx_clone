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

  //retorna um anúncio se for igual a ativo
  List<Ad> get activesAds =>
      allAds.where((ad) => ad.status == AdStatus.ACTIVE).toList();

  //retorna um anuncio se for igual a pedente
  List<Ad> get peddingAds =>
      allAds.where((ad) => ad.status == AdStatus.PENDING).toList();

  //retorna se um anúncio for igual a sold
  List<Ad> get soldAds =>
      allAds.where((ad) => ad.status == AdStatus.SOLD).toList();

  Future<void> _getMyAds() async {
    final user = GetIt.I<UserMenageStore>().user;

    try {
      loading = true;
      allAds = await AdRepository().getMyAds(user);
      loading = false;
    } catch (e) {}
  }

  @observable
  bool loading = false;

  void refresh() => _getMyAds();

  @action
  Future<void> soldAd(Ad ad) async {
    loading = true;
    await AdRepository().sold(ad);
    refresh();
  }

  @action
  Future<void> deletAd(Ad ad) async {
    loading = true;
    await AdRepository().delete(ad);
    refresh();
  }
}
