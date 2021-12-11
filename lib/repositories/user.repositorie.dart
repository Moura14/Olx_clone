import 'package:olx_mobx/models/user.dart';
import 'package:olx_mobx/repositories/parse_errors.dart';
import 'package:olx_mobx/repositories/table_keys.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class UserRepository {
  Future<void> signUp(User user) async {
    final parseUser = ParseUser(user.email, user.password, user.email);

    parseUser.set<String>(keyUserName, user.name);
    parseUser.set<String>(keyUserPhone, user.phone);
    parseUser.set(keyUserType, user.userType.index);

    final response = await parseUser.signUp();
    if (response.success) {
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  Future<User> loginWithEmail(String email, String password) async {
    final parseUser = ParseUser(email, password, null);

    final response = await parseUser.login();

    if (response.success) {
      return mapParseToUser(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  User mapParseToUser(ParseUser parseUser) {
    return User(parseUser.objectId, parseUser.get(keyUserName),
        parseUser.get(keyUserEmail), parseUser.get(keyUserPhone));
  }
}
