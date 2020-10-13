import 'package:api_games_with_slidy/app/modules/login/models/user_model.dart';
import 'package:api_games_with_slidy/app/modules/login/repositories/auth_repository.dart';
import 'package:api_games_with_slidy/app/shared/mobx/user_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final AuthRepository authRepository;
  final UserMobx userMobx;

  _LoginControllerBase(this.authRepository, this.userMobx);

  @observable
  String email;

  @observable
  String password;

  @observable
  bool loading;

  @action
  Future login() async {
    loading = true;
    try {
      userMobx.userModel = await authRepository.login(email, password);
      Modular.to.pushReplacementNamed('/home');
    } catch (e) {
      print(e);
    }
    // print(userModel);
    loading = false;
  }
}
