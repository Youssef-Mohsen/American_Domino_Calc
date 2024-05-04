import 'package:american_domino_calc/screens/select_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Cubit/app_cubit.dart';


var theme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var theme2 = ThemeData(useMaterial3: true).copyWith(
  colorScheme: theme,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: theme.onPrimaryContainer,
          foregroundColor: Colors.white)),
);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme2,
        home: const MyHomePage(),
      ),
    );
  }
}