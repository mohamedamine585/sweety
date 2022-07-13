import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweety/Services/Auth/AuthService.dart';
import 'package:sweety/Services/Auth/CloudStorage/books_storage/a_book.dart';
import 'package:sweety/Services/Auth/CloudStorage/books_storage/cloud_books_for_users.dart';
import 'package:sweety/Views/booksListView.dart';
import 'package:sweety/Views/publisherwithaccView.dart';
import 'package:sweety/routes.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final FirebaseFirestoreforbooks$users? books_forusers;
  int currentPageIndex = 0;
  @override
  void initState() {
    books_forusers = FirebaseFirestoreforbooks$users();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)),
            gradient: LinearGradient(
                colors: [Colors.pink, Color.fromARGB(255, 87, 146, 205)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
          ),
        ),
        title: const Text(
          'Library',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Color.fromARGB(200, 301, 15, 88),
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
              color: Colors.white,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.publish,
              color: Colors.white,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            label: '',
          ),
        ],
      ),
      body: <Widget>[
        StreamBuilder(
            stream: books_forusers?.getallbooks(),
            builder: ((context, snapshot) {
              final test = books_forusers?.getallbooks();
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  if (snapshot.hasData) {
                    final allbooks = snapshot.data as Iterable<book>;
                    return booklistview(books: allbooks.toList());
                  }
                  return Text('Loading ...');
                default:
                  return CircularProgressIndicator();
              }
            })),
        PublisherwithaccView(),
        Scaffold(
          body: TextButton(
            onPressed: () async {
              await Authservice.firebase().Logout();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(loggingview, (route) => false);
            },
            child: Text('Logout'),
          ),
        ),
      ][currentPageIndex],
    );
  }
}
