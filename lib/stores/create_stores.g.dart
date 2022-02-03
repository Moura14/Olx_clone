// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateStores on _CreateStoresBase, Store {
  Computed<bool> _$ImagesValidComputed;

  @override
  bool get ImagesValid =>
      (_$ImagesValidComputed ??= Computed<bool>(() => super.ImagesValid,
              name: '_CreateStoresBase.ImagesValid'))
          .value;
  Computed<bool> _$titleValidComputed;

  @override
  bool get titleValid =>
      (_$titleValidComputed ??= Computed<bool>(() => super.titleValid,
              name: '_CreateStoresBase.titleValid'))
          .value;
  Computed<bool> _$categoryValidComputed;

  @override
  bool get categoryValid =>
      (_$categoryValidComputed ??= Computed<bool>(() => super.categoryValid,
              name: '_CreateStoresBase.categoryValid'))
          .value;
  Computed<Adress> _$adressComputed;

  @override
  Adress get adress =>
      (_$adressComputed ??= Computed<Adress>(() => super.adress,
              name: '_CreateStoresBase.adress'))
          .value;
  Computed<num> _$priceComputed;

  @override
  num get price => (_$priceComputed ??=
          Computed<num>(() => super.price, name: '_CreateStoresBase.price'))
      .value;
  Computed<bool> _$descriptionValidComputed;

  @override
  bool get descriptionValid => (_$descriptionValidComputed ??= Computed<bool>(
          () => super.descriptionValid,
          name: '_CreateStoresBase.descriptionValid'))
      .value;
  Computed<bool> _$formValidComputed;

  @override
  bool get formValid =>
      (_$formValidComputed ??= Computed<bool>(() => super.formValid,
              name: '_CreateStoresBase.formValid'))
          .value;
  Computed<Function> _$sendPressedComputed;

  @override
  Function get sendPressed =>
      (_$sendPressedComputed ??= Computed<Function>(() => super.sendPressed,
              name: '_CreateStoresBase.sendPressed'))
          .value;

  final _$titleAtom = Atom(name: '_CreateStoresBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_CreateStoresBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$priceTextAtom = Atom(name: '_CreateStoresBase.priceText');

  @override
  String get priceText {
    _$priceTextAtom.reportRead();
    return super.priceText;
  }

  @override
  set priceText(String value) {
    _$priceTextAtom.reportWrite(value, super.priceText, () {
      super.priceText = value;
    });
  }

  final _$categoryAtom = Atom(name: '_CreateStoresBase.category');

  @override
  Category get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(Category value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$hidePhoneAtom = Atom(name: '_CreateStoresBase.hidePhone');

  @override
  bool get hidePhone {
    _$hidePhoneAtom.reportRead();
    return super.hidePhone;
  }

  @override
  set hidePhone(bool value) {
    _$hidePhoneAtom.reportWrite(value, super.hidePhone, () {
      super.hidePhone = value;
    });
  }

  final _$showErrorsAtom = Atom(name: '_CreateStoresBase.showErrors');

  @override
  bool get showErrors {
    _$showErrorsAtom.reportRead();
    return super.showErrors;
  }

  @override
  set showErrors(bool value) {
    _$showErrorsAtom.reportWrite(value, super.showErrors, () {
      super.showErrors = value;
    });
  }

  final _$loadingAtom = Atom(name: '_CreateStoresBase.loading');

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

  final _$errorAtom = Atom(name: '_CreateStoresBase.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$savedAdAtom = Atom(name: '_CreateStoresBase.savedAd');

  @override
  bool get savedAd {
    _$savedAdAtom.reportRead();
    return super.savedAd;
  }

  @override
  set savedAd(bool value) {
    _$savedAdAtom.reportWrite(value, super.savedAd, () {
      super.savedAd = value;
    });
  }

  final _$_sendAsyncAction = AsyncAction('_CreateStoresBase._send');

  @override
  Future<void> _send() {
    return _$_sendAsyncAction.run(() => super._send());
  }

  final _$_CreateStoresBaseActionController =
      ActionController(name: '_CreateStoresBase');

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_CreateStoresBaseActionController.startAction(
        name: '_CreateStoresBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_CreateStoresBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_CreateStoresBaseActionController.startAction(
        name: '_CreateStoresBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_CreateStoresBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(String value) {
    final _$actionInfo = _$_CreateStoresBaseActionController.startAction(
        name: '_CreateStoresBase.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_CreateStoresBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(Category value) {
    final _$actionInfo = _$_CreateStoresBaseActionController.startAction(
        name: '_CreateStoresBase.setCategory');
    try {
      return super.setCategory(value);
    } finally {
      _$_CreateStoresBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHidePhone(bool value) {
    final _$actionInfo = _$_CreateStoresBaseActionController.startAction(
        name: '_CreateStoresBase.setHidePhone');
    try {
      return super.setHidePhone(value);
    } finally {
      _$_CreateStoresBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$_CreateStoresBaseActionController.startAction(
        name: '_CreateStoresBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$_CreateStoresBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
description: ${description},
priceText: ${priceText},
category: ${category},
hidePhone: ${hidePhone},
showErrors: ${showErrors},
loading: ${loading},
error: ${error},
savedAd: ${savedAd},
ImagesValid: ${ImagesValid},
titleValid: ${titleValid},
categoryValid: ${categoryValid},
adress: ${adress},
price: ${price},
descriptionValid: ${descriptionValid},
formValid: ${formValid},
sendPressed: ${sendPressed}
    ''';
  }
}
