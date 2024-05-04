import 'package:american_domino_calc/Cubit/add_status.dart';
import 'package:american_domino_calc/screens/grid_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/app_cubit.dart';
import '../main.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AddStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: InkWell(
              onLongPress: () {
                cubit.gameRestart();
              },
              child: FloatingActionButton(
                backgroundColor: theme.onPrimaryContainer,
                onPressed: () {},
                child: const Icon(
                  Icons.restart_alt,
                  color: Colors.white,
                ),
              )),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: GridView(
                    padding: const EdgeInsets.all(24),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.5,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    children: [
                      for (int i = 0; i < cubit.numberOfUsers; i++)
                        GridItem(
                          number: i,
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onLongPress: (){
                      cubit.gameEnd(context);
                    },
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      child: const Text(
                        "End Game",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
