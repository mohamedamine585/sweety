import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweety/Services/Auth/CloudStorage/Publisherstorage/a_publisher.dart';
import 'package:sweety/Services/Auth/CloudStorage/Publisherstorage/publisher_cloud.dart';
import 'package:sweety/Views/publisherwithaccView.dart';
import 'package:sweety/Views/publisherwithoutanaccount.dart';

class publisherview extends StatefulWidget {
  const publisherview({super.key});

  @override
  State<publisherview> createState() => _publisherviewState();
}

class _publisherviewState extends State<publisherview> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseCloudStorageforpublisher().get_publisher(
            email: FirebaseAuth.instance.currentUser!.email.toString()),
        builder: ((context, snapshot) {
          if (snapshot.data != null) return const publisherwithoutacc();
          return const publisherwithoutacc();
        }));
  }
}
