import 'dart:async';

import 'package:api_games_with_slidy/app/modules/login/models/user_model.dart';
import 'package:api_games_with_slidy/app/shared/repositories/localstore/local_storage_interface.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorageHive implements ILocalStorage {
  // O futuer so vai ser executado quando chamado _instance.complete
  Completer<Box> _instance = Completer<Box>();

  _init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    final box = await Hive.openBox("db");
    _instance.complete(box);
  }

  LocalStorageHive() {
    _init();
  }

  // @override
  // Future<String> getToken() async {
  //   final box = await _instance.future; // só chama quando termina o complete
  //   return box.get("token");
  // }

  // @override
  // Future<void> putToken(String value) async {
  //   final box = await _instance.future; // a instancia pronta
  //   return box.put("token", value);
  // }

  @override
  Future<UserModel> getUser() async {
    final box = await _instance.future;
    final mapUser = box.get("user");

    return UserModel(
        email: mapUser['email'],
        password: mapUser['password'],
        token: mapUser['token']);
  }

  @override
  Future<void> saveUser(UserModel userModel) async {
    final box = await _instance.future;
    final Map<String, dynamic> user = {
      "email": userModel.email,
      "password": userModel.password,
      "token": userModel.token,
    };
    return box.put("user", user);
  }
}
