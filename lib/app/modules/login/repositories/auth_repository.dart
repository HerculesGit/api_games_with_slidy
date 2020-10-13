import 'package:api_games_with_slidy/app/modules/login/models/user_model.dart';
import 'package:api_games_with_slidy/app/shared/repositories/localstore/local_storage_interface.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  final Dio dio;
  final ILocalStorage localStorage;

  AuthRepository(
    this.dio,
    this.localStorage,
  );

  Future<UserModel> login(String email, String password) async {
    UserModel userModel;

    try {
      Map<String, dynamic> data = {"email": email, "password": password};
      final response = await dio.post('/auth', data: data);

      userModel = UserModel(
          email: email, password: password, token: response.data['token']);
      localStorage.saveUser(userModel);
    } catch (e) {
      print(e);
    }

    return userModel;
  }
}
