import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      backgroundColor: Color(0xff0c1020),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Text(
                    'HOME',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(color: Colors.white),
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
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(color: Colors.white)),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      ProjectsScreen.id,
                    );
                  },
                ),
                InkWell(
                  child: Text('STATISTICS',
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(color: Colors.white)),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      StatisticsScreen.id,
                    );
                  },
                ),
                InkWell(
                  child: Text('SPRINT',
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(color: Colors.white)),
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
          SvgPicture.asset('assets/illustrations/trees.svg',
              semanticsLabel: 'Wave', width: MediaQuery.of(context).size.width),
        ],
      ),
    );
  }
}
