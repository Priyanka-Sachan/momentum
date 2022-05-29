import 'package:flutter/material.dart';
import 'package:momentum/screens/home_screen.dart';
import 'package:momentum/screens/projects_screen.dart';
import 'package:momentum/screens/sprint_screen.dart';
import 'package:momentum/screens/statistics_screen.dart';

class NavScreen extends StatefulWidget {
  static const id = '/nav-screen';
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close_rounded,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Text(
                'HOME',
                style: Theme.of(context).textTheme.headline1,
              ),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  HomeScreen.id,
                );
              },
            ),
            InkWell(
              child: Text('PROJECTS',
                  style: Theme.of(context).textTheme.headline1),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  ProjectsScreen.id,
                );
              },
            ),
            InkWell(
              child: Text('STATISTICS',
                  style: Theme.of(context).textTheme.headline1),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  StatisticsScreen.id,
                );
              },
            ),
            InkWell(
              child: Text('SPRINT',
                  style: Theme.of(context).textTheme.headline1),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  SprintScreen.id,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
