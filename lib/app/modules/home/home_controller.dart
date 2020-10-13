import 'package:api_games_with_slidy/app/modules/home/repositories/game_respository.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GameRepository gameRepository;
  _HomeControllerBase({@required this.gameRepository}) {
    fetchGames();
  }

  String text = '';

  @observable
  ObservableFuture games;

  @action
  fetchGames() {
    games = gameRepository.getAllGames().asObservable();
  }
}
