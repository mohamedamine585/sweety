import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Services/Auth/CloudStorage/books_storage/a_book.dart';

typedef bookscallback = void Function(book Book);

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
