import 'package:api_games_with_slidy/app/shared/mobx/user_mobx.dart';
import 'package:api_games_with_slidy/app/shared/repositories/localstore/local_storage_hive.dart';
import 'package:api_games_with_slidy/app/shared/repositories/localstore/local_storage_interface.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'splash_controller.g.dart';

@Injectable()
class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final UserMobx userMobx;
  final ILocalStorage localStorage = Modular.get<LocalStorageHive>();

  _SplashControllerBase(this.userMobx);

  Future loadUser() {
    return localStorage.getUser().then((value) => userMobx.userModel = value);
  }
}
