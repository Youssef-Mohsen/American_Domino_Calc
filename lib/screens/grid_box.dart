import 'package:american_domino_calc/Cubit/add_status.dart';
import 'package:american_domino_calc/Cubit/app_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../main.dart';

class GridItem extends StatefulWidget {
  const GridItem({super.key, required this.number});

  final int number;

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AddStates>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: theme.onPrimaryContainer),
          child: Column(
            children: [
              if (widget.number == 0)
                Text(
                  cubit.player1.text.substring(0, 1).toUpperCase() +
                      cubit.player1.text.substring(1),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
                ),
              if (widget.number == 1)
                Text(
                  cubit.player2.text.substring(0, 1).toUpperCase() +
                      cubit.player2.text.substring(1),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
                ),
              if (widget.number == 2)
                Text(
                  cubit.player3.text.substring(0, 1).toUpperCase() +
                      cubit.player3.text.substring(1),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
                ),
              if (widget.number == 3)
                Text(
                  cubit.player4.text.substring(0, 1).toUpperCase() +
                      cubit.player4.text.substring(1),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 5,),
              if (widget.number == 0)
                Text(
                  cubit.score1.toString(),
                  style: const TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.bold),
                ),
              if (widget.number == 1)
                Text(
                  cubit.score2.toString(),
                  style: const TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.bold),
                ),
              if (widget.number == 2)
                Text(
                  cubit.score3.toString(),
                  style: const TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.bold),
                ),
              if (widget.number == 3)
                Text(
                  cubit.score4.toString(),
                  style: const TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                      backgroundColor: Colors.white,
                      shape:  const CircleBorder(side: BorderSide(width: 7)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.minus,size: 14,),
                          SizedBox(width: 3,),
                          Text("1")
                        ],
                      ),
                      onPressed: () {
                        cubit.minusScore1(widget.number);
                      }),
                  const SizedBox(width: 20.0,),
                  FloatingActionButton(
                      backgroundColor: Colors.white,
                      shape:  const CircleBorder(side: BorderSide(width: 7)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.add,size: 14,),
                          SizedBox(width: 3,),
                          Text("1")
                        ],
                      ),
                      onPressed: () {
                        cubit.addScore1(widget.number);
                      }),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                      backgroundColor: Colors.white,
                      shape:  const CircleBorder(side: BorderSide(width: 7)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.minus,size: 14,),
                          SizedBox(width: 3,),
                          Text("3")
                        ],
                      ),
                      onPressed: () {
                        cubit.minusScore3(widget.number);
                      }),
                  const SizedBox(width: 20.0,),
                  FloatingActionButton(
                      backgroundColor: Colors.white,
                      shape:  const CircleBorder(side: BorderSide(width: 7)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.add,size: 14,),
                          SizedBox(width: 3,),
                          Text("3")
                        ],
                      ),
                      onPressed: () {
                        cubit.addScore3(widget.number);
                      }),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                      backgroundColor: Colors.white,
                      shape:  const CircleBorder(side: BorderSide(width: 7)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.minus,size: 14,),
                          SizedBox(width: 3,),
                          Text("5")
                        ],
                      ),
                      onPressed: () {
                        cubit.minusScore5(widget.number);
                      }),
                  const SizedBox(width: 20.0,),
                  FloatingActionButton(
                      backgroundColor: Colors.white,
                      shape:  const CircleBorder(side: BorderSide(width: 7)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.add,size: 14,),
                          SizedBox(width: 3,),
                          Text("5")
                        ],
                      ),
                      onPressed: () {
                        cubit.addScore5(widget.number);
                      }),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
