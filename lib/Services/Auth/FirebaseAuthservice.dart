import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sweety/Services/Auth/Authprovider.dart';
import 'package:sweety/Services/Auth/Authuser.dart';
import 'package:sweety/firebase_options.dart';

class Firebaseauthprovider implements Authprovider {
  @override
  Future<void> Initialize() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  @override
  Future<void> Logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<Authuser?> Register(
      {required String email, required String password}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> Sendemailverification({required String email}) async {
    await FirebaseAuth.instance.currentUser?.sendEmailVerification();
  }

  @override
  // TODO: implement currentuser
  Authuser? get currentuser {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null)
      return Authuser.fromFirebase(user);
    else
      return null;
  }

  @override
  Future<Authuser?> Loginwithaccount(
      {required String email, required String password}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return currentuser;
  }

  @override
  Future<void> loginanonymously() async {
    await FirebaseAuth.instance.signInAnonymously();
  }

  @override
  Future<void> changepassword({required String password}) async {
    await FirebaseAuth.instance.currentUser?.updatePassword(password);
  }
}
