import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweety/Services/Auth/CloudStorage/Publisherstorage/publisher_cloud.dart';
import 'package:sweety/Services/Auth/CloudStorage/Userstorage/new_user.dart';
import 'package:sweety/Services/Auth/CloudStorage/Userstorage/user_cloud.dart';
import 'package:sweety/Services/Auth/FirebaseAuthservice.dart';
import 'package:sweety/Views/HomeView.dart';
import 'package:sweety/routes.dart';

class publisherwithoutacc extends StatefulWidget {
  const publisherwithoutacc({super.key});

  @override
  State<publisherwithoutacc> createState() => _publisherwithoutaccState();
}

class _publisherwithoutaccState extends State<publisherwithoutacc> {
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
            'Start Publishing',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const Text('Start publishing an gain money'),
            TextButton(
                onPressed: () async {
                  final user = await FirebaseCloudStorageforusers().get_user(
                      email: FirebaseAuth.instance.currentUser!.email);

                  final pub = await FirebaseCloudStorageforpublisher()
                      .create_publisher(
                          Email: user!.first!.email,
                          Firstname: user.first!.firstname,
                          Lastname: user.first!.lastname);
                  if (pub != null) {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(homeview, (route) => false);
                  }
                },
                child: const Text('start publishing'))
          ],
        ));
  }
}
