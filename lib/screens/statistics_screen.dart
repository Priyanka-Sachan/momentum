import 'package:flutter/material.dart';
import 'package:momentum/widgets/nav_button.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);
  static const id = '/statistics-screen';

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actionsIconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          NavButton(),
        ],
      ),
      body: Container(
        child: Center(
          child: Text('STATISTICS'),
        ),
      ),
    );
  }
}
