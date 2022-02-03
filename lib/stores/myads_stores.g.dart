// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myads_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyAdsStores on _MyAdsStoresBase, Store {
  Computed<List<Ad>> _$activesAdsComputed;

  @override
  List<Ad> get activesAds =>
      (_$activesAdsComputed ??= Computed<List<Ad>>(() => super.activesAds,
              name: '_MyAdsStoresBase.activesAds'))
          .value;

  final _$allAdsAtom = Atom(name: '_MyAdsStoresBase.allAds');

  @override
  List<Ad> get allAds {
    _$allAdsAtom.reportRead();
    return super.allAds;
  }

  @override
  set allAds(List<Ad> value) {
    _$allAdsAtom.reportWrite(value, super.allAds, () {
      super.allAds = value;
    });
  }

  final _$loadingAtom = Atom(name: '_MyAdsStoresBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$soldAdAsyncAction = AsyncAction('_MyAdsStoresBase.soldAd');

  @override
  Future<void> soldAd(Ad ad) {
    return _$soldAdAsyncAction.run(() => super.soldAd(ad));
  }

  final _$deletAdAsyncAction = AsyncAction('_MyAdsStoresBase.deletAd');

  @override
  Future<void> deletAd(Ad ad) {
    return _$deletAdAsyncAction.run(() => super.deletAd(ad));
  }

  @override
  String toString() {
    return '''
allAds: ${allAds},
loading: ${loading},
activesAds: ${activesAds}
    ''';
  }
}
