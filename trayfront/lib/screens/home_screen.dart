import 'package:flutter/material.dart';
import '../widgets/tray_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.green[400], //appbar
      ),
      body: Center(
        child: TrayWidget(
          title: 'Welcome!',
          content: 'This is the home screen.',
        ),
      ),
    );
  }
}
