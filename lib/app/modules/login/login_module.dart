import 'package:api_games_with_slidy/app/modules/home/home_module.dart';
import 'package:api_games_with_slidy/app/modules/home/home_page.dart';
import 'package:api_games_with_slidy/app/modules/login/login_controller.dart';
import 'package:api_games_with_slidy/app/modules/login/login_page.dart';
import 'package:api_games_with_slidy/app/modules/login/repositories/auth_repository.dart';
import 'package:api_games_with_slidy/app/shared/repositories/localstore/local_storage_hive.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthRepository(i.get<Dio>(), i.get<LocalStorageHive>())),
        $LoginController,
        // Bind((i)=>)
      ];

  @override
  List<ModularRouter> get routers => [
        // ModularRouter('/', child: (context, args) => LoginPage()),
        ModularRouter('/login', child: (context, args) => LoginPage()),
        // ModularRouter('/home', child: (context, args) => HomePage()),
        ModularRouter('/home', module: HomeModule()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
