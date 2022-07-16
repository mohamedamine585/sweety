import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sweety/Services/Auth/CloudStorage/books_storage/cloud_books_for_users.dart';
import 'package:sweety/Services/Auth/CloudStorage/books_storage/a_book.dart';

import '../Services/Auth/CloudStorage/Userstorage/user_cloud.dart';
import 'booksListView.dart';

class BooksUniverseView extends StatefulWidget {
  const BooksUniverseView({super.key});

  @override
  State<BooksUniverseView> createState() => _BooksUniverseViewState();
}

class _BooksUniverseViewState extends State<BooksUniverseView> {
  late final FirebaseFirestoreforbooks$users? books_forusers;

  @override
  void initState() {
    books_forusers = FirebaseFirestoreforbooks$users();
    super.initState();
  }

  @override
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
      body: StreamBuilder(
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
    );
  }
}
