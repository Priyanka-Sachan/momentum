import 'package:flutter/material.dart';
import 'package:momentum/screens/home_screen.dart';
import 'package:momentum/screens/projects_screen.dart';
import 'package:momentum/screens/sprint_screen.dart';
import 'package:momentum/screens/statistics_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);
  static const id = '/nav-screen';

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close_rounded,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            InkWell(
              child: Text('HOME'),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  HomeScreen.id,
                );
              },
            ),
            InkWell(
              child: Text('PROJECTS'),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  ProjectsScreen.id,
                );
              },
            ),
            InkWell(
              child: Text('STATISTICS'),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  StatisticsScreen.id,
                );
              },
            ),
            InkWell(
              child: Text('SPRINT'),
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
