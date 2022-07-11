import 'package:sweety/Services/Auth/Authuser.dart';

abstract class Authprovider {
  Future<void> Initialize();
  Future<Authuser?> Loginwithaccount(
      {required String email, required String password});
  Future<Authuser?> Register({required String email, required String password});
  Authuser? get currentuser;
  Future<void> Logout();
  Future<void> Sendemailverification({required String email});
  Future<void> changepassword({required String password});
  Future<void> loginanonymously();
}
