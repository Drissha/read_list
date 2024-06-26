import 'package:flutter/material.dart';
import 'package:flutter_ui/add/add_list.dart';
import 'package:flutter_ui/auth/login/login.dart';
import 'package:flutter_ui/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(
      //   title: "Read list",
      // ),
      home: LoginPage(),
    );
  }
}
