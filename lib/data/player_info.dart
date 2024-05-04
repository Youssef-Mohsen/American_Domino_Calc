import 'package:american_domino_calc/Cubit/app_cubit.dart';
import 'package:american_domino_calc/model/player_model.dart';
AppCubit cubit=AppCubit();

var playersInfo=[
  PlayerData(player: cubit.player1, score: 0),
  PlayerData(player: cubit.player2, score: 0),
  if(cubit.numberOfUsers==4)
    {
      PlayerData(player: cubit.player3, score: 0),
      PlayerData(player: cubit.player4, score: 0),
    }
];