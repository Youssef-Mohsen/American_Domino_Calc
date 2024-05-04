import 'package:american_domino_calc/Cubit/add_status.dart';
import 'package:american_domino_calc/Cubit/app_cubit.dart';
import 'package:american_domino_calc/screens/main_page.dart';
import 'package:american_domino_calc/screens/names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AddStates>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(title: const Text("Domino Calculator",style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor: theme.onPrimaryContainer,foregroundColor: Colors.white,),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Users: ",style: TextStyle(color: theme.onPrimaryContainer,fontWeight: FontWeight.bold,fontSize: 18),),
                              const SizedBox(width: 10,),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: DropdownButton(
                                  hint: const Padding(
                                    padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Number of Users",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: theme.onPrimaryContainer,
                                  ),
                                  value: cubit.numberOfUsers,
                                  onChanged: (newValue) {
                                    cubit.changeNumber(newValue);
                                  },
                                  items: cubit.numbers.map((valueItem) {
                                    return DropdownMenuItem(
                                      value: valueItem,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(valueItem.toString()),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Score: ",style: TextStyle(color: theme.onPrimaryContainer,fontWeight: FontWeight.bold,fontSize: 18),),
                              const SizedBox(width: 10,),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: DropdownButton(
                                  hint: const Padding(
                                    padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Score",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: theme.onPrimaryContainer,
                                  ),
                                  value: cubit.gameScore,
                                  onChanged: (newValue) {
                                    cubit.changeScore(newValue);
                                  },
                                  items: cubit.numbersGame.map((valueItem) {
                                    return DropdownMenuItem(
                                      value: valueItem,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(valueItem.toString()),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PlayerName(player: cubit.player1),
                  PlayerName(player: cubit.player2),
                  if (cubit.numberOfUsers == 4) PlayerName(player: cubit.player3),
                  if (cubit.numberOfUsers == 4) PlayerName(player: cubit.player4),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        cubit.gameRestart();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const MainPage()));
                      }
                    },
                    child: const Text(
                      "Start",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
