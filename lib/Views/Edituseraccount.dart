import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Services/Auth/AuthService.dart';
import '../routes.dart';

class edituseracc extends StatelessWidget {
  const edituseracc({super.key});

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
            'User Account',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(children: [
          TextButton(
            onPressed: () async {
              await Authservice.firebase().Logout();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(loggingview, (route) => false);
            },
            child: Text(
              'change username',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.pink[300]),
            ),
          ),
          TextButton(
            onPressed: () async {
              await Authservice.firebase().Logout();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(loggingview, (route) => false);
            },
            child: Text(
              'change password',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.pink[300]),
            ),
          ),
        ]));
  }
}
