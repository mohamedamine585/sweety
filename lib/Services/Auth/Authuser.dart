import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:sweety/Services/Auth/FirebaseAuthservice.dart';

@immutable
class Authuser {
  final String email;
  final bool isemailverified;
  final String Id;

  const Authuser({
    required this.email,
    required this.isemailverified,
    required this.Id,
  });
  factory Authuser.fromFirebase(User user) => Authuser(
      email: user.email.toString().toLowerCase(),
      isemailverified: user.emailVerified,
      Id: user.uid);
}
