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

  @override
  String toString() {
    return '''
allAds: ${allAds},
activesAds: ${activesAds}
    ''';
  }
}
