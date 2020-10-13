import 'package:api_games_with_slidy/app/modules/home/models/game_model.dart';
import 'package:api_games_with_slidy/app/shared/mobx/user_mobx.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/*
O Repository Pattern permite que possamos encapsular a lógica de acesso a dados,
 através da injeção de dependência, os dados poderiam estar em uma API, 
 em um banco de dados ou até em um arquivo.
*/
class GameRepository {
  final Dio dio;
  final UserMobx userMobx;
  GameRepository({@required this.dio, @required this.userMobx}) {
    _configHeader();
  }

  Future<List<GameModel>> getAllGames() async {
    // nao precisa mos usar assim:
    //   dio.get("$BASE_URL/pokemon");
    // por que usamos a baseUrl do Dio na injecao de dependencia
    // dentro do arquivo AppModule
    final List<GameModel> games = [];

    try {
      final response = await dio.get("/games");

      for (var item in (response.data as List)) {
        // print(item);
        GameModel model = GameModel(title: item["title"]);
        games.add(model);
      }
    } catch (e) {
      print(e);
    }

    return games;
  }

  void _configHeader() {
    if (userMobx.userModel != null) {
      dio.options.headers = {
        "Authorization": "Bearer ${userMobx.userModel.token}"
      };
    }
  }
}
