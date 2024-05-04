import 'package:american_domino_calc/Cubit/add_status.dart';
import 'package:american_domino_calc/Cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../main.dart';

class PlayerName extends StatefulWidget {
  PlayerName({super.key, required this.player});

  var player = TextEditingController();

  @override
  State<PlayerName> createState() => _GridItemState();
}

class _GridItemState extends State<PlayerName> {
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AddStates>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.deepPurple.withOpacity(.2)),
          child: TextFormField(
            controller: widget.player,
            style: const TextStyle(color: Colors.black),
            validator: (value) {
              if (value!.isEmpty) {
                return "Player Name is required";
              } else if (value.length > 14) {
                return "Player Name must be Less than 14 Character";
              } else if (cubit.numberOfUsers==4) {
                if(((cubit.player2.text.toLowerCase() ==
                    cubit.player1.text.toLowerCase())) ||
                    ((cubit.player3.text.toLowerCase() ==
                        cubit.player1.text.toLowerCase())) ||
                    ((cubit.player4.text.toLowerCase() ==
                        cubit.player1.text.toLowerCase())) ||
                    ((cubit.player3.text.toLowerCase() ==
                        cubit.player2.text.toLowerCase())) ||
                    ((cubit.player4.text.toLowerCase() ==
                        cubit.player2.text.toLowerCase())) ||
                    ((cubit.player4.text.toLowerCase() ==
                        cubit.player3.text.toLowerCase()))) {
                  return "Player Name must be Different";
                }
              }
              else if(cubit.numberOfUsers==2){
                if(((cubit.player2.text.toLowerCase() ==
                    cubit.player1.text.toLowerCase()))) {
                  return "Player Name must be Different";
                }
              }
              return null;
            },
            decoration: InputDecoration(
              icon: Icon(
                Icons.person,
                color: theme.onPrimaryContainer,
              ),
              border: InputBorder.none,
              hintText: "Player Name",
            ),
          ),
        );
      },
    );
  }
}
