import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:momentum/providers/projects_provider.dart';
import 'package:momentum/screens/home_screen.dart';
import 'package:momentum/screens/nav_screen.dart';
import 'package:momentum/screens/projects_screen.dart';
import 'package:momentum/screens/statistics_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MomentumApp());
}

class MomentumApp extends StatefulWidget {
  const MomentumApp({Key? key}) : super(key: key);

  @override
  State<MomentumApp> createState() => _MomentumAppState();
}

class _MomentumAppState extends State<MomentumApp> {
  final projectsProvider = ProjectsProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => projectsProvider),
      ],
      child: Consumer<ProjectsProvider>(builder: (ctx, provider, child) {
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
      }),
    );
  }
}
