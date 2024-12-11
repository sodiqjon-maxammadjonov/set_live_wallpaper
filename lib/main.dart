import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:set_live_wallpaper/src/screens/bloc/main_bloc.dart';
import 'package:set_live_wallpaper/src/screens/main_screen.dart';
import 'package:set_live_wallpaper/src/util/theme/dark_theme.dart';
import 'package:set_live_wallpaper/src/util/theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        home: BlocProvider(
          create: (context) => MainBloc(),
          child: MainScreen(),
        ));
  }
}
