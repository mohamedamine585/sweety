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
        return ListTile(
          title: Text(
            thebook.name + ' by ' + thebook.authorname,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.info),
          ),
        );
      },
    );
  }
}
