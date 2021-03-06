import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweety/Services/Auth/AuthService.dart';
import 'package:sweety/Services/Auth/CloudStorage/Publisherstorage/filterpub.dart';
import 'package:sweety/Views/BooksUniverseView.dart';
import 'package:sweety/Views/Settingsview.dart';
import 'package:sweety/Views/publisherwithaccView.dart';
import 'package:sweety/routes.dart';

import '../Services/Auth/FirebaseAuthservice.dart';
import '../Services/Auth/blocservice/Blocservice.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    BlocProvider(create: ((context) => ServiceBloc(Firebaseauthprovider())));

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.grey[50],
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(
              Icons.explore,
              color: Color.fromARGB(255, 187, 96, 209),
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.publish,
              color: Color.fromARGB(255, 187, 96, 209),
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.settings,
              color: Color.fromARGB(255, 187, 96, 209),
            ),
            label: '',
          ),
        ],
      ),
      body: <Widget>[
        const BooksUniverseView(),
        const publisherview(),
        const settingsview(),
      ][currentPageIndex],
    );
  }
}
