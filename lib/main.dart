import 'package:flutter/material.dart';
import 'package:sweety/Services/Auth/AuthService.dart';
import 'package:sweety/Views/RegisterView.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Authservice.firebase().Initialize(),
      builder: ((context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Scaffold(
              body: CircularProgressIndicator(),
            );

          case ConnectionState.done:
            return const RegisterView();
          default:
            return const CircularProgressIndicator();
        }
      }),
    );
  }
}
