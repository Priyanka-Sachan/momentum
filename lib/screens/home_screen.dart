import 'package:flutter/material.dart';
import 'package:momentum/widgets/nav_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const id = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actionsIconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          NavButton(),
        ],
      ),
      body: Container(
        child: Center(
          child: Text('HOME'),
        ),
      ),
    );
  }
}
