import 'package:api_games_with_slidy/app/modules/home/home_page.dart';
import 'package:api_games_with_slidy/app/modules/home/repositories/game_respository.dart';
import 'package:api_games_with_slidy/app/shared/mobx/user_mobx.dart';
import 'package:api_games_with_slidy/app/shared/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

// Tudo que pertence ao module HOME
class HomeModule extends ChildModule {
  //
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(gameRepository: i.get<GameRepository>())),
        Bind((i) =>
            GameRepository(dio: i.get<Dio>(), userMobx: i.get<UserMobx>())),
      ];

  // Aqui temos as rotas referentes a /home
  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (context, args) => HomePage(),
        ),
        ModularRouter(
          '/home',
          child: (context, args) => HomePage(),
        ),
      ];
}
