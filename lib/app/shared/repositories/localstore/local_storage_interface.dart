import 'package:api_games_with_slidy/app/modules/login/models/user_model.dart';

abstract class ILocalStorage {
  // Future<String> getToken();
  // Future<void> putToken(String value);

  Future<void> saveUser(UserModel userModel);
  Future<UserModel> getUser();
}
