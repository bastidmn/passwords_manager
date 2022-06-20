import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passwords_manager/visual/home_screen.dart';
import 'package:passwords_manager/visual/settings_screen.dart';

void main() {
  runApp(PasswordsApp());
}

class PasswordsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Passwords Manager',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        'settings': (context) => const SettingsScreen(),
      },
    );
  }
}
