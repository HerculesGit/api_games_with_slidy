import 'package:api_games_with_slidy/app/modules/login/repositories/auth_repository.dart';
import 'package:api_games_with_slidy/app/shared/mobx/user_mobx.dart';
import 'package:api_games_with_slidy/app/shared/repositories/localstore/local_storage_hive.dart';
import 'package:api_games_with_slidy/app/shared/repositories/localstore/local_storage_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeGuard implements RouteGuard {
  @override
  bool canActivate(String url) {
    if (url != "/home") {
      return true;
    } else {
      return true;
    }
  }

  @override
  List<GuardExecutor> get executors => [AuthExecutor()];
}

class AuthExecutor extends GuardExecutor {
  final LocalStorageHive localStorage = Modular.get<ILocalStorage>();
  final AuthRepository authRepository = Modular.get<AuthRepository>();
  final UserMobx userMobx = Modular.get<UserMobx>();

  @override
  Future<void> onGuarded(String path, {bool isActive}) async {
    if (isActive) {
      return;
    }

    userMobx.userModel = await localStorage.getUser();
    if (userMobx.userModel == null) {
      Modular.to.pushReplacementNamed("/login");
    } else {
      Modular.to.pushReplacementNamed("/home");
    }
  }
}
