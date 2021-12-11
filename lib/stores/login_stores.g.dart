// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStores on _LoginStoresBase, Store {
  Computed<bool> _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_LoginStoresBase.emailValid'))
          .value;
  Computed<bool> _$passwordValidComputed;

  @override
  bool get passwordValid =>
      (_$passwordValidComputed ??= Computed<bool>(() => super.passwordValid,
              name: '_LoginStoresBase.passwordValid'))
          .value;
  Computed<Function> _$loginPressedComputed;

  @override
  Function get loginPressed =>
      (_$loginPressedComputed ??= Computed<Function>(() => super.loginPressed,
              name: '_LoginStoresBase.loginPressed'))
          .value;

  final _$emailAtom = Atom(name: '_LoginStoresBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginStoresBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$loadingAtom = Atom(name: '_LoginStoresBase.loading');

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

  final _$errorAtom = Atom(name: '_LoginStoresBase.error');

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

  final _$_loginAsyncAction = AsyncAction('_LoginStoresBase._login');

  @override
  Future<void> _login() {
    return _$_loginAsyncAction.run(() => super._login());
  }

  final _$_LoginStoresBaseActionController =
      ActionController(name: '_LoginStoresBase');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_LoginStoresBaseActionController.startAction(
        name: '_LoginStoresBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginStoresBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassoword(String value) {
    final _$actionInfo = _$_LoginStoresBaseActionController.startAction(
        name: '_LoginStoresBase.setPassoword');
    try {
      return super.setPassoword(value);
    } finally {
      _$_LoginStoresBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
loading: ${loading},
error: ${error},
emailValid: ${emailValid},
passwordValid: ${passwordValid},
loginPressed: ${loginPressed}
    ''';
  }
}
