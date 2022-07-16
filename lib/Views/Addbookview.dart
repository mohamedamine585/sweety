import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweety/Services/Auth/AuthService.dart';
import 'package:sweety/Services/Auth/CloudStorage/Publisherstorage/publisher_cloud.dart';
import 'package:sweety/Services/Auth/CloudStorage/Userstorage/user_cloud.dart';
import 'package:sweety/Services/Auth/CloudStorage/Userstorage/userconsts.dart';
import 'package:sweety/Services/Auth/CloudStorage/books_storage/book_cloud_for_pubs.dart';
import 'package:sweety/Services/Auth/CloudStorage/books_storage/bookconst.dart';

class Addbookbiew extends StatefulWidget {
  const Addbookbiew({super.key});

  @override
  State<Addbookbiew> createState() => _AddbookbiewState();
}

class _AddbookbiewState extends State<Addbookbiew> {
  late final Firebasecloudstorageforbooks$pubs? books_forpubs;
  late final TextEditingController bname;
  late final TextEditingController autname;
  late final TextEditingController desc;
  late final TextEditingController ed;
  late final TextEditingController dateofed;
  late final TextEditingController type;

  @override
  void initState() {
    bname = TextEditingController();
    autname = TextEditingController();
    desc = TextEditingController();
    ed = TextEditingController();
    dateofed = TextEditingController();
    type = TextEditingController();
    books_forpubs = Firebasecloudstorageforbooks$pubs();
    super.initState();
  }

  @override
  void dispose() {
    bname.dispose();
    autname.dispose();
    desc.dispose();
    ed.dispose();
    dateofed.dispose();
    type.dispose();

    super.dispose();
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
              gradient: LinearGradient(colors: [
                Colors.pink,
                Color.fromARGB(255, 87, 146, 205),
                Color.fromARGB(255, 222, 62, 155)
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
            ),
          ),
          title: const Text(
            'Publish a book',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TextField(
                controller: bname,
                decoration: const InputDecoration(
                  hintText: 'Book name',
                )),
            TextField(
              controller: autname,
              decoration: const InputDecoration(
                hintText: 'author name',
              ),
            ),
            TextField(
                controller: type,
                decoration: const InputDecoration(
                  hintText: 'type',
                )),
            TextField(
                controller: desc,
                decoration: const InputDecoration(
                  hintText: 'Book description',
                )),
            TextField(
                controller: ed,
                decoration: const InputDecoration(
                  hintText: 'edition',
                )),
            TextField(
                controller: dateofed,
                decoration: const InputDecoration(
                  hintText: 'Date of edition',
                )),
            TextButton(
              onPressed: () async {
                final useremail = FirebaseAuth.instance.currentUser!.email;

                final user = await FirebaseCloudStorageforusers().get_user(
                  email: useremail,
                );
                final email = user?.first!.email;
                final name = user?.first!.firstname;
                final lname = user?.first!.lastname;

                await books_forpubs?.create_book(
                    pubfname: name!,
                    publnam: lname!,
                    pubemail: email!,
                    name: bname.text,
                    authorname: autname.text,
                    description: desc.text,
                    Edition: ed.text,
                    dateofeddition: dateofed.text,
                    type: type.text,
                    price: 0);
              },
              child: Text('Publish'),
            )
          ],
        ));
  }
}
