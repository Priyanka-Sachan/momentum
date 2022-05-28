import 'package:flutter/material.dart';
import 'package:momentum/screens/nav_screen.dart';

class NavButton extends StatelessWidget {
  const NavButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        //  Navigate to table of contents
        Navigator.pushNamed(
          context,
          NavScreen.id,
        );
      },
      icon: Icon(
        Icons.apps_rounded,
        color: Colors.black,
      ),
    );
  }
}
