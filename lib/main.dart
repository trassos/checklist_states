import 'package:flutter/material.dart';
import 'package:tasks_basic/login/view/login_view.dart';

void main() {
  runApp(const TaskBasic());
}

class TaskBasic extends StatelessWidget {
  const TaskBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Basics',
      theme: customTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const LoginView(),
        // '/home': (context) => const ChecklistView(),
      },
    );
  }
}

ThemeData customTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.dark,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 48.0,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
    ),
  ),
);
