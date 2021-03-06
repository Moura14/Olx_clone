// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FilterStores on _FilterStoresBase, Store {
  Computed<String> _$priceErrorComputed;

  @override
  String get priceError =>
      (_$priceErrorComputed ??= Computed<String>(() => super.priceError,
              name: '_FilterStoresBase.priceError'))
          .value;
  Computed<bool> _$isTypeParticularComputed;

  @override
  bool get isTypeParticular => (_$isTypeParticularComputed ??= Computed<bool>(
          () => super.isTypeParticular,
          name: '_FilterStoresBase.isTypeParticular'))
      .value;
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_FilterStoresBase.isFormValid'))
          .value;

  final _$orderByAtom = Atom(name: '_FilterStoresBase.orderBy');

  @override
  OrderBy get orderBy {
    _$orderByAtom.reportRead();
    return super.orderBy;
  }

  @override
  set orderBy(OrderBy value) {
    _$orderByAtom.reportWrite(value, super.orderBy, () {
      super.orderBy = value;
    });
  }

  final _$minPriceAtom = Atom(name: '_FilterStoresBase.minPrice');

  @override
  int get minPrice {
    _$minPriceAtom.reportRead();
    return super.minPrice;
  }

  @override
  set minPrice(int value) {
    _$minPriceAtom.reportWrite(value, super.minPrice, () {
      super.minPrice = value;
    });
  }

  final _$maxPriceAtom = Atom(name: '_FilterStoresBase.maxPrice');

  @override
  int get maxPrice {
    _$maxPriceAtom.reportRead();
    return super.maxPrice;
  }

  @override
  set maxPrice(int value) {
    _$maxPriceAtom.reportWrite(value, super.maxPrice, () {
      super.maxPrice = value;
    });
  }

  final _$vendorTypeAtom = Atom(name: '_FilterStoresBase.vendorType');

  @override
  int get vendorType {
    _$vendorTypeAtom.reportRead();
    return super.vendorType;
  }

  @override
  set vendorType(int value) {
    _$vendorTypeAtom.reportWrite(value, super.vendorType, () {
      super.vendorType = value;
    });
  }

  final _$_FilterStoresBaseActionController =
      ActionController(name: '_FilterStoresBase');

  @override
  void setOrderBy(OrderBy value) {
    final _$actionInfo = _$_FilterStoresBaseActionController.startAction(
        name: '_FilterStoresBase.setOrderBy');
    try {
      return super.setOrderBy(value);
    } finally {
      _$_FilterStoresBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMinPrice(int value) {
    final _$actionInfo = _$_FilterStoresBaseActionController.startAction(
        name: '_FilterStoresBase.setMinPrice');
    try {
      return super.setMinPrice(value);
    } finally {
      _$_FilterStoresBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectVendorType(int value) {
    final _$actionInfo = _$_FilterStoresBaseActionController.startAction(
        name: '_FilterStoresBase.selectVendorType');
    try {
      return super.selectVendorType(value);
    } finally {
      _$_FilterStoresBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
orderBy: ${orderBy},
minPrice: ${minPrice},
maxPrice: ${maxPrice},
vendorType: ${vendorType},
priceError: ${priceError},
isTypeParticular: ${isTypeParticular},
isFormValid: ${isFormValid}
    ''';
  }
}
