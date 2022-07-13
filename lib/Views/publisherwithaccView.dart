import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweety/Services/Auth/AuthService.dart';
import 'package:sweety/Services/Auth/CloudStorage/books_storage/book_cloud_for_pubs.dart';

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
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/publish_a_book');
                },
                icon: Icon(Icons.add)),
            TextButton(onPressed: () {}, child: Icon(Icons.delete_sharp)),
          ],
        ),
        StreamBuilder(
            stream: books_forpubs?.getbooks_bypubs(email: pubemail!),
            builder: ((context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    final allbooks = snapshot.data as Iterable<book>;
                    return booklistview(books: allbooks.toList());
                  }
                  return Text('Loading ...');
                default:
                  return CircularProgressIndicator();
              }
            })),
      ],
    );
  }
}
