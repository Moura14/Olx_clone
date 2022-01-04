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
  Computed<bool> _$descriptionValidComputed;

  @override
  bool get descriptionValid => (_$descriptionValidComputed ??= Computed<bool>(
          () => super.descriptionValid,
          name: '_CreateStoresBase.descriptionValid'))
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
  String toString() {
    return '''
title: ${title},
description: ${description},
category: ${category},
hidePhone: ${hidePhone},
ImagesValid: ${ImagesValid},
titleValid: ${titleValid},
descriptionValid: ${descriptionValid}
    ''';
  }
}
