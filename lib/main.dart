import 'package:flutter/material.dart';
import 'package:sweety/Services/Auth/AuthService.dart';
import 'package:sweety/Views/Addbookview.dart';
import 'package:sweety/Views/HomeView.dart';
import 'package:sweety/Views/LoginView.dart';
import 'package:sweety/Views/RegisterView.dart';
import 'package:sweety/Views/publisherwithaccView.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      routes: {
        '/publish_a_book': (context) => const Addbookbiew(),
        '/Loginview': (context) => const LoginView(),
        '/Registerview': (context) => const RegisterView(),
        '/HomeView': ((context) => const HomeView()),
      }));
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
            final user = Authservice.firebase().currentuser;
            if (user == null) {
              return const LoginView();
            } else {
              return const HomeView();
            }
          default:
            return const PublisherwithaccView();
        }
      }),
    );
  }
}
