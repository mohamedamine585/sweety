import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweety/Services/Auth/AuthService.dart';
import 'package:sweety/Services/Auth/CloudStorage/Publisherstorage/pubs_const.dart';
import 'package:sweety/Services/Auth/CloudStorage/books_storage/book_cloud_for_pubs.dart';
import 'package:sweety/Views/Addbookview.dart';

import '../Services/Auth/CloudStorage/Userstorage/user_cloud.dart';
import '../Services/Auth/CloudStorage/books_storage/a_book.dart';
import 'booksListView.dart';

class PublisherwithaccView extends StatefulWidget {
  const PublisherwithaccView({super.key});

  @override
  State<PublisherwithaccView> createState() => _PublisherwithaccViewState();
}

class _PublisherwithaccViewState extends State<PublisherwithaccView> {
  late final Firebasecloudstorageforbooks$pubs? books_forpubs;
  bool haspublishaccount = false;
  final pubemail = Authservice.firebase().currentuser?.email;
  @override
  void initState() {
    books_forpubs = Firebasecloudstorageforbooks$pubs();
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
              'Publish',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () async {
                  final user = await FirebaseCloudStorageforusers().get_user(
                      email:
                          FirebaseAuth.instance.currentUser?.email.toString());
                  Navigator.of(context).pushNamed('/publish_a_book');
                },
                icon: const Icon(Icons.add),
              ),
            ]),
        body: StreamBuilder(
            stream: books_forpubs?.getbooks_bypubs(email: pubemail!),
            builder: ((context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  if (snapshot.hasData) {
                    final allbooks = snapshot.data as Iterable<book>;
                    return booklistview(books: allbooks.toList());
                  }
                  return const Text('Loading ...');
                default:
                  return const CircularProgressIndicator();
              }
            })));
  }
}
