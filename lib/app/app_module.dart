import 'package:api_games_with_slidy/app/modules/login/login_module.dart';
import 'package:api_games_with_slidy/app/modules/login/repositories/auth_repository.dart';
import 'package:api_games_with_slidy/app/pages/splash/splash_page.dart';
import 'package:api_games_with_slidy/app/shared/guards/home_guard.dart';
import 'package:api_games_with_slidy/app/shared/mobx/user_mobx.dart';
import 'package:api_games_with_slidy/app/shared/repositories/localstore/local_storage_hive.dart';
import 'package:api_games_with_slidy/app/shared/utils/constants.dart';
import 'package:dio/dio.dart';

import 'pages/splash/splash_controller.dart';

import 'modules/login/login_controller.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:api_games_with_slidy/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $SplashController,
        $AppController,
        $UserMobx,
        // Isso eh otimo!
        Bind((i) => Dio(BaseOptions(baseUrl: BASE_URL))),
        Bind((i) => LocalStorageHive()),
        Bind((i) => AuthRepository(i.get<Dio>(), i.get<LocalStorageHive>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SplashPage()),
        ModularRouter(
          '/',
          module: LoginModule(),
          // guards: [AuthGuard()],
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
