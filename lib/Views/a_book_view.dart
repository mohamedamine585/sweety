import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweety/Services/Auth/CloudStorage/books_storage/a_book.dart';

class a_bookview extends StatefulWidget {
  const a_bookview({super.key});

  @override
  State<a_bookview> createState() => _a_bookviewState();
}

class _a_bookviewState extends State<a_bookview> {
  @override
  Widget build(BuildContext context) {
    final thebook = ModalRoute.of(context)!.settings.arguments as book;

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
          title: Text(
            thebook.name,
            softWrap: true,
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(children: [
          SizedBox(
            height: 100,
            child: Column(
              children: [
                Text(
                  'Author :   ' + thebook.authorname,
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  'Publisher name  :' + thebook.publisherfirstname!,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  ' type   :' + thebook.type,
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  ' description    :' + thebook.description,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Row(
            children: [
              TextButton(onPressed: () {}, child: Text('Buy ')),
              TextButton(onPressed: () {}, child: Text('comment')),
            ],
          )
        ]));
  }
}
