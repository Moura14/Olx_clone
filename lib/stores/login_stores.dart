import 'package:mobx/mobx.dart';
import 'package:olx_mobx/helpers/extensions.dart';
import 'package:olx_mobx/repositories/user.repositorie.dart';
part 'login_stores.g.dart';

class LoginStores = _LoginStoresBase with _$LoginStores;

abstract class _LoginStoresBase with Store {
  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError =>
      email == null || emailValid ? null : "Email inválido";

  @observable
  String password;

  @action
  void setPassoword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password.length >= 4;
  String get passwordError =>
      password == null || passwordValid ? null : "Senha inválida";

  @computed
  Function get loginPressed =>
      emailValid && passwordValid && !loading ? _login : null;

  @observable
  bool loading = false;

  @observable
  String error;

  @action
  Future<void> _login() async {
    loading = true;

    try {
      final user = await UserRepository().loginWithEmail(email, password);
      print(user);
    } catch (e) {
      error = e;
    }
    loading = false;
  }
}
