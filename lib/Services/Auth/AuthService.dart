import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sweety/Services/Auth/Authexceptions.dart';
import 'package:sweety/Services/Auth/Authprovider.dart';
import 'package:sweety/Services/Auth/Authuser.dart';
import 'package:sweety/Services/Auth/FirebaseAuthservice.dart';

class Authservice implements Authprovider {
  final Authprovider provider;

  Authservice(this.provider);
  factory Authservice.firebase() => Authservice(Firebaseauthprovider());

  @override
  Future<void> Initialize() async {
    try {
      await provider.Initialize();
    } catch (e) {
      throw couldnotinit;
    }
  }

  @override
  Future<Authuser?> Loginwithaccount(
      {required String email, required String password}) async {
    try {
      await provider.Loginwithaccount(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password')
        throw wrogpasswordex;
      else if (e.code == 'invalid-email') throw invalidemail;
    }
  }

  @override
  Future<void> Logout() async {
    try {
      await provider.Logout();
    } catch (e) {}
  }

  @override
  Future<Authuser?> Register(
      {required String email, required String password}) async {
    try {
      await provider.Register(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> Sendemailverification({required String email}) async {
    try {
      await provider.Sendemailverification(email: email);
    } catch (e) {}
  }

  @override
  Future<void> changepassword({required String password}) async {
    try {
      await provider.changepassword(password: password);
    } catch (e) {}
  }

  @override
  Authuser? get currentuser => provider.currentuser;

  @override
  Future<void> loginanonymously() async {
    await provider.loginanonymously();
  }
}
