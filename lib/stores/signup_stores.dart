import 'package:mobx/mobx.dart';
import 'package:olx_mobx/helpers/extensions.dart';
import 'package:olx_mobx/models/user.dart';
import 'package:olx_mobx/repositories/user.repositorie.dart';
part 'signup_stores.g.dart';

class SignUpStore = _SignUpStoreBase with _$SignUpStore;

abstract class _SignUpStoreBase with Store {
  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name.length > 6;
  String get nameError {
    if (name == null || nameValid)
      return null;
    else if (name.isEmpty)
      return "Campo obrigarório";
    else
      return "Nome muito curto";
  }

  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError {
    if (email == null || emailValid)
      return null;
    else if (email.isEmpty)
      return "Campo obrigatório";
    else
      return "E-mail inválido";
  }

  @observable
  String phone;

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone != null && phone.length >= 14;
  String get phoneError {
    if (phone == null || phoneValid)
      return null;
    else if (phone.isEmpty)
      return "Campo obrigatório";
    else
      return "Celular inválido";
  }

  @observable
  String password;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passowordValid => password != null && password.length >= 6;
  String get passError {
    if (password == null || passowordValid)
      return null;
    else if (password.isEmpty)
      return "Campo obrigatório";
    else
      return "Senha muito curta";
  }

  @observable
  String password2;

  @action
  void setPassword2(String value) => password2 = value;

  @computed
  bool get passwordValid2 => password2 != null && password2 == password;
  String get passwordError2 {
    if (password2 == null || passwordValid2)
      return null;
    else
      return "Senhas não coincidem";
  }

  @computed
  bool get isFormValid =>
      nameValid && emailValid && phoneValid && passowordValid && passwordValid2;

  @computed
  Function get signUpPressed => isFormValid ? _signUp : null;

  @observable
  bool loading = false;

  @observable
  String error;

  @action
  Future<void> _signUp() async {
    loading = true;

    final user = User(
      name,
      email,
      phone,
      password,
    );
    try {
      await UserRepository().signUp(user);
    } catch (e) {
      error = e;
    }
    loading = false;
  }
}
