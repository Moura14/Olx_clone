import 'package:mobx/mobx.dart';
import 'package:olx_mobx/models/user.dart';
import 'package:olx_mobx/repositories/user.repositorie.dart';
part 'user_menage_stores.g.dart';

class UserMenageStore = _UserMenageStoreBase with _$UserMenageStore;

abstract class _UserMenageStoreBase with Store {
  _UserMenageStore() {
    _getCurrentUser();
  }

  @observable
  User user;

  @action
  void setUser(User value) => user = value;

  @computed
  bool get isLoggedIn => user != null;

  Future<void> _getCurrentUser() async {
    final user = await UserRepository().currentUser();
    setUser(user);
  }
}
