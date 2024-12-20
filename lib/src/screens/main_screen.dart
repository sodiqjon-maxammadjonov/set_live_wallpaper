import 'dart:io';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:set_live_wallpaper/src/screens/test_screen/test.dart';
import 'bloc/main_bloc.dart';
import 'main_screens/library/library_screen.dart';

class MainScreen extends StatelessWidget {
   MainScreen({super.key});
  List<File> videoFiles = [];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<MainBloc, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        final NotchBottomBarController notchBottomBarController =
        NotchBottomBarController(index: state.switchIndex);
        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: Center(
            child: bottomNavScreen.elementAt(state.switchIndex),
          ),
          bottomNavigationBar: AnimatedNotchBottomBar(
            notchBottomBarController: notchBottomBarController,
            bottomBarItems: bottomBarItems.map((item) {
              return BottomBarItem(
                inActiveItem: Icon(
                  (item.inActiveItem as Icon).icon,
                  color: theme.iconTheme.color?.withOpacity(0.5),
                ),
                activeItem: Icon(
                  (item.activeItem as Icon).icon,
                  color: theme.colorScheme.primary,
                ),
                itemLabel: item.itemLabel,
              );
            }).toList(),
            onTap: (int value) {
              BlocProvider.of<MainBloc>(context).add(
                SwitchChangeEvent(switchIndex: value),
              );
            },
            kIconSize: 20,
            kBottomRadius: 10,
          ),
        );
      },
    );
  }
}

List<BottomBarItem> bottomBarItems = const <BottomBarItem>[
  BottomBarItem(
    inActiveItem: Icon(Icons.home_rounded),
    activeItem: Icon(Icons.home_rounded),
    itemLabel: 'Home',
  ),
  BottomBarItem(
    inActiveItem: Icon(Icons.menu),
    activeItem: Icon(Icons.menu_rounded),
    itemLabel: 'Library',
  ),
  BottomBarItem(
    inActiveItem: Icon(Icons.settings),
    activeItem: Icon(Icons.settings),
    itemLabel: 'Settings',
  ),
];

List<Widget> bottomNavScreen = <Widget>[
  const Text('Index 0: Home', style: TextStyle(fontSize: 24)),
  LibraryScreen(),
  TestScreen(),
];
