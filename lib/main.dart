import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:momentum/screens/home_screen.dart';
import 'package:momentum/screens/nav_screen.dart';
import 'package:momentum/screens/projects_screen.dart';
import 'package:momentum/screens/statistics_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
