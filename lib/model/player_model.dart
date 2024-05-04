import 'package:flutter/cupertino.dart';

class PlayerData{
  PlayerData(
      {required this.player, required this.score});
  var player = TextEditingController();
  int score;
}