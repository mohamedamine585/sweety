import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweety/Services/Auth/AuthService.dart';

class Emailverification extends StatefulWidget {
  const Emailverification({super.key});

  @override
  State<Emailverification> createState() => _EmailverificationState();
}

class _EmailverificationState extends State<Emailverification> {
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
            'Verify Email',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Center(
              child: TextButton(
                onPressed: () async {
                  try {
                    final user = Authservice.firebase().currentuser;
                    await Authservice.firebase()
                        .Sendemailverification(email: user!.email);
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text(
                  'Send email verification ',
                  style: TextStyle(color: Color.fromARGB(255, 235, 56, 116)),
                ),
              ),
            ),
          ],
        ));
  }
}
