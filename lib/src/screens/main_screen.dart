import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/main_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        final NotchBottomBarController notchBottomBarController =
        NotchBottomBarController(index: state.switchIndex);

        return Scaffold(
          body: Center(child: bottomNavScreen.elementAt(state.switchIndex)),
          bottomNavigationBar: AnimatedNotchBottomBar(
            notchBottomBarController: notchBottomBarController,
            bottomBarItems: bottomBarItems,
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
    inActiveItem: Icon(Icons.home_outlined, color: Colors.grey),
    activeItem: Icon(Icons.home_rounded, color: Colors.blue),
    itemLabel: 'Home',
  ),
  BottomBarItem(
    inActiveItem: Icon(Icons.menu, color: Colors.grey),
    activeItem: Icon(Icons.menu_rounded, color: Colors.blue),
    itemLabel: 'Library',
  ),
  BottomBarItem(
    inActiveItem: Icon(Icons.settings, color: Colors.grey),
    activeItem: Icon(Icons.settings, color: Colors.blue),
    itemLabel: 'Settings',
  ),
];

const List<Widget> bottomNavScreen = <Widget>[
  Text('Index 0: Home', style: TextStyle(fontSize: 24)),
  Text('Index 1: Library', style: TextStyle(fontSize: 24)),
  Text('Index 2: Setting', style: TextStyle(fontSize: 24)),
];
