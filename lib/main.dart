import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:momentum/providers/profile_provider.dart';
import 'package:momentum/providers/projects_provider.dart';
import 'package:momentum/providers/sprints_provider.dart';
import 'package:momentum/providers/tasks_provider.dart';
import 'package:momentum/screens/add_project_screen.dart';
import 'package:momentum/screens/add_sprint_screen.dart';
import 'package:momentum/screens/add_task_screen.dart';
import 'package:momentum/screens/home_screen.dart';
import 'package:momentum/screens/nav_screen.dart';
import 'package:momentum/screens/project_screen.dart';
import 'package:momentum/screens/projects_screen.dart';
import 'package:momentum/screens/sprint_screen.dart';
import 'package:momentum/screens/statistics_screen.dart';
import 'package:momentum/screens/task_screen.dart';
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
  final profileProvider = ProfileProvider();
  final projectsProvider = ProjectsProvider();
  final tasksProvider = TasksProvider();
  final sprintsProvider = SprintsProvider();

  @override
  void initState() {
    profileProvider.initProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => profileProvider),
        ChangeNotifierProvider(create: (context) => projectsProvider),
        ChangeNotifierProvider(create: (context) => tasksProvider),
        ChangeNotifierProvider(create: (context) => sprintsProvider),
      ],
      child: Consumer<ProfileProvider>(builder: (ctx, provider, child) {
        return MaterialApp(
          title: 'Momentum',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          routes: {
            HomeScreen.id: (context) => HomeScreen(),
            ProjectsScreen.id: (context) => ProjectsScreen(),
            ProjectScreen.id: (context) => ProjectScreen(),
            AddProjectScreen.id: (context) => AddProjectScreen(),
            AddTaskScreen.id: (context) => AddTaskScreen(),
            TaskScreen.id: (context) => TaskScreen(),
            SprintScreen.id: (context) => SprintScreen(),
            AddSprintScreen.id: (context) => AddSprintScreen(),
            StatisticsScreen.id: (context) => StatisticsScreen(),
            NavScreen.id: (context) => NavScreen(),
          },
          initialRoute: HomeScreen.id,
        );
      }),
    );
  }
}
