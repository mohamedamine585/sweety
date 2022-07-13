import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweety/routes.dart';

import '../Services/Auth/AuthService.dart';
import '../Services/Auth/CloudStorage/Userstorage/user_cloud.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController email;
  late final TextEditingController password;
  @override
  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

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
            'Log In',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(children: [
          TextField(
            controller: email,
            decoration: const InputDecoration(
              hintText: 'Email',
            ),
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            controller: password,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
            autocorrect: false,
          ),
          TextButton(
              onPressed: () async {
                try {
                  final user = await Authservice.firebase().Loginwithaccount(
                      email: email.text, password: password.text);
                  print(user);
                  if (user != null) {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(homeview, (route) => false);
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: const Text(
                'Log in',
                style: TextStyle(color: Color.fromARGB(255, 195, 26, 111)),
              )),
          TextButton(
              onPressed: () async {
                try {
                  await Authservice.firebase().loginanonymously();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(homeview, (route) => false);
                } catch (e) {
                  print(e);
                }
              },
              child: const Text(
                'Continue anonymously',
                style: TextStyle(color: Color.fromARGB(255, 110, 189, 235)),
              )),
          TextButton(
              onPressed: () async {
                try {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      registringview, (route) => false);
                } catch (e) {
                  print(e);
                }
              },
              child: const Text(
                "You  haven't an account ",
                style: TextStyle(color: Color.fromARGB(255, 110, 189, 235)),
              ))
        ]));
  }
}
