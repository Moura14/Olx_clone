import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:olx_mobx/models/user.dart';
import 'package:olx_mobx/stores/user_menage_stores.dart';
part 'edit_account_stores.g.dart';

class EditAccountStore = _EditAccountStoreBase with _$EditAccountStore;

abstract class _EditAccountStoreBase with Store {
  _EditAccountStoreBase() {
    final user = userMenageStore.user;

    userType = user.userType;
    name = user.name;
    phone = user.phone;
  }
  final UserMenageStore userMenageStore = GetIt.I<UserMenageStore>();

  @observable
  UserType userType;

  @action
  void setUserType(int value) => userType = UserType.values[value];

  @observable
  String name;

  @computed
  bool get nameValid => name != null && name.length >= 6;
  String get nameError =>
      nameValid || name == null ? null : "Campo obrigatório";

  @action
  void setName(String value) => name = value;

  @observable
  String phone;

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone != null && phone.length >= 14;
  String get phoneError =>
      phoneValid || phone == null ? null : "Campo obrigatório";

  @observable
  String pass1 = '';

  @action
  void setPass1(String value) => pass1 = value;

  @observable
  String pass2 = '';

  @action
  void setPass2(String value) => pass2 = value;

  @computed
  bool get passValid => pass1 == pass2 && (pass1.length >= 6 || pass1.isEmpty);
  String get passError {
    if (pass1.isNotEmpty && pass1.length < 6)
      return "Senha muita curta";
    else if (pass1 != pass2) return "Senhas não coincidem";
    return null;
  }

  @computed
  bool get isFormValid => nameValid && phoneValid && passValid;

  @observable
  bool loading = false;

  @computed
  VoidCallback get savePressed => (isFormValid && !loading) ? _save : null;

  @action
  Future<void> _save() async {
    loading = true;

    await Future.delayed(Duration(seconds: 3));

    loading = false;
  }
}
