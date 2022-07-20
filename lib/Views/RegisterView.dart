import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweety/Services/Auth/AuthService.dart';
import 'package:sweety/Services/Auth/CloudStorage/Userstorage/user_cloud.dart';
import 'package:sweety/Services/Auth/CloudStorage/Userstorage/new_user.dart';
import 'package:sweety/Services/Auth/FirebaseAuthservice.dart';
import 'package:sweety/Services/Auth/blocservice/Blocservice.dart';
import 'package:sweety/Services/Auth/blocservice/blocevent.dart';
import 'package:sweety/routes.dart';

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
                context
                    .read<ServiceBloc>()
                    .add(inAuthregisterevent(email.text, password.text));

                final user = await FirebaseCloudStorageforusers().create_user(
                    email: email.text,
                    firstname: firstname.text,
                    lastname: lastname.text,
                    occupation: occupation.text);
                if (user != null) {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(homeview, (route) => false);
                }
              },
              child: Text(
                'Register',
                style: TextStyle(color: Color.fromARGB(255, 195, 17, 106)),
              )),
          TextButton(
              onPressed: () async {
                try {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(loggingview, (route) => false);
                } catch (e) {
                  print(e);
                }
              },
              child: const Text(
                "You already  have  an account ",
                style: TextStyle(color: Color.fromARGB(255, 110, 189, 235)),
              )),
        ]));
  }
}
