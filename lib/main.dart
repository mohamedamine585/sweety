import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweety/Services/Auth/AuthService.dart';
import 'package:sweety/Services/Auth/Authprovider.dart';
import 'package:sweety/Services/Auth/FirebaseAuthservice.dart';
import 'package:sweety/Services/Auth/blocservice/Blocservice.dart';
import 'package:sweety/Services/Auth/blocservice/blocevent.dart';
import 'package:sweety/Services/Auth/blocservice/blocstate.dart';
import 'package:sweety/Views/Addbookview.dart';
import 'package:sweety/Views/HomeView.dart';
import 'package:sweety/Views/LoginView.dart';
import 'package:sweety/Views/RegisterView.dart';
import 'package:sweety/Views/a_book_view.dart';
import 'package:sweety/Views/publisherwithaccView.dart';

void main() {
  runApp(BlocProvider(
      create: ((context) => ServiceBloc(Firebaseauthprovider())),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(),
          routes: {
            '/publish_a_book': (context) => const Addbookbiew(),
            '/Loginview': (context) => const LoginView(),
            '/Registerview': (context) => const RegisterView(),
            '/HomeView': ((context) => const HomeView()),
            '/abookview': ((context) => const a_bookview()),
          })));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    context.read<ServiceBloc>().add(ServInitevent());
    return BlocBuilder<ServiceBloc, ServiceState>(builder: ((context, state) {
      if (state is loggedinstate) return const HomeView();
      return const LoginView();
    }));
  }
}
    /*FutureBuilder(
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
*/