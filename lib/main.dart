import 'package:flutter/material.dart';
import 'package:momentum/screens/home_screen.dart';
import 'package:momentum/screens/nav_screen.dart';
import 'package:momentum/screens/projects_screen.dart';
import 'package:momentum/screens/statistics_screen.dart';

void main() {
  runApp(const MomentumApp());
}

class MomentumApp extends StatelessWidget {
  const MomentumApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Momentum',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        ProjectsScreen.id: (context) => ProjectsScreen(),
        StatisticsScreen.id: (context) => StatisticsScreen(),
        NavScreen.id: (context) => NavScreen(),
      },
      initialRoute: HomeScreen.id,
    );
  }
}
