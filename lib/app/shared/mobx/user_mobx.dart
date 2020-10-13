import 'package:api_games_with_slidy/app/modules/login/models/user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'user_mobx.g.dart';

@Injectable()
class UserMobx = _UserMobxBase with _$UserMobx;

abstract class _UserMobxBase with Store {
  UserModel userModel;
}
