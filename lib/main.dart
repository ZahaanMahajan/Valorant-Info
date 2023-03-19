import 'package:flutter/material.dart';
import 'package:valorant/screens/dashboard_screen/dashboard_screen.dart';
import 'package:valorant/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const DashBoardScreen(),
    );
  }
}
