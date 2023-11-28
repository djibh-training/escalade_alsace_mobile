import 'package:flutter/material.dart';

import 'screens/tabbar_navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Escalade Alsace',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      ),
      home: const MyHomePage(title: 'Escalade Alsace'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TabbarNavigationScreen(),
      // appBar: AppBar(
      //   backgroundColor: const Color.fromRGBO(255, 112, 67, 1),
      //   title: const Text("Escalade Alsace"),
      // ),
    );
  }
}
