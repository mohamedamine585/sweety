import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sweety/Services/Auth/AuthService.dart';
import 'package:sweety/Services/Auth/CloudStorage/Userstorage/user_cloud.dart';
import 'package:sweety/Services/Auth/CloudStorage/new_user.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController email;
  late final TextEditingController password;
  late final TextEditingController firstname;
  late final TextEditingController lastname;
  late final TextEditingController occupation;

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    firstname = TextEditingController();
    lastname = TextEditingController();
    occupation = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    firstname.dispose();
    lastname.dispose();
    occupation.dispose();
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
              gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 87, 146, 205), Colors.pink],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter),
            ),
          ),
          title: Text(
            'Register',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(children: [
          TextField(
            controller: firstname,
            decoration: InputDecoration(
              hintText: 'Firstname',
            ),
            autocorrect: false,
          ),
          TextField(
            controller: lastname,
            decoration: InputDecoration(
              hintText: 'Lastname',
            ),
            autocorrect: false,
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(
              hintText: 'Email',
            ),
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
            autocorrect: false,
          ),
          TextField(
            controller: occupation,
            decoration: InputDecoration(
              hintText: 'ocuupation',
            ),
            autocorrect: false,
          ),
          TextButton(
              onPressed: () async {
                try {
                  final user = await Authservice.firebase()
                      .Register(email: email.text, password: password.text);
                  if (user != null) {
                    await FirebaseCloudStorage().create_user(
                        email: email.text,
                        firstname: firstname.text,
                        lastname: lastname.text,
                        occupation: occupation.text);
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Text(
                'Register',
                style: TextStyle(color: Color.fromARGB(255, 195, 17, 106)),
              ))
        ]));
  }
}
