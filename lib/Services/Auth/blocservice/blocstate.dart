import 'package:flutter/gestures.dart';
import 'package:sweety/Services/Auth/Authuser.dart';
import 'package:sweety/Services/Auth/CloudStorage/Userstorage/new_user.dart';

class ServiceState {
  const ServiceState();
}

class Servicestateloading extends ServiceState {
  const Servicestateloading();
}

class loggedinstate extends ServiceState {
  final Authuser user;

  const loggedinstate(this.user);
}

class loggedoutstate extends ServiceState {
  const loggedoutstate();
}

class registeredstate extends ServiceState {
  const registeredstate();
}

class notregisteredstate extends ServiceState {
  const notregisteredstate();
}

class usercreateddbstate extends ServiceState {
  const usercreateddbstate();
}

class movetoregisterstate extends ServiceState {
  const movetoregisterstate();
}
