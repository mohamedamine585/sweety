import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweety/routes.dart';

import '../Services/Auth/CloudStorage/books_storage/a_book.dart';

class booklistview extends StatelessWidget {
  final List<book> books;
  const booklistview({super.key, required this.books});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (BuildContext context, int index) {
        final thebook = books.elementAt(index);
        final fname = thebook.publisherfirstname ?? '';
        final lname = thebook.publisherlastname ?? '';
        print(thebook.publisheremail);
        return ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(abook_view, arguments: thebook);
          },
          title: SizedBox(
            height: 70,
            child: Column(
              children: [
                Text(
                  thebook.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(fname + ' ' + lname),
                Text('Price :${thebook.price} dollars'),
              ],
            ),
          ),
        );
      },
    );
  }
}

class booklistviewforpubs extends StatelessWidget {
  final List<book> books;
  const booklistviewforpubs({super.key, required this.books});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (BuildContext context, int index) {
        final thebook = books.elementAt(index);
        final fname = thebook.publisherfirstname ?? '';
        final lname = thebook.publisherlastname ?? '';
        print(thebook.publisheremail);
        return ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(abook_view, arguments: thebook);
          },
          title: SizedBox(
            height: 100,
            child: SizedBox(
              child: Column(
                children: [
                  Row(children: [
                    Center(
                      child: Text(
                        thebook.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ]),
                  Text('$fname $lname'),
                  Text('Price :${thebook.price} dollars'),
                ],
              ),
            ),
          ),
          trailing:
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
        );
      },
    );
  }
}
