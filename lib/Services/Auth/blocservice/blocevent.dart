import 'package:flutter/cupertino.dart';
import 'package:sweety/Services/Auth/blocservice/blocstate.dart';

class Serviceevent {
  const Serviceevent();
}

class loginevent extends Serviceevent {
  final String email;
  final String password;

  loginevent(this.email, this.password);
}

class ServInitevent extends Serviceevent {
  const ServInitevent();
}

class logoutevent extends Serviceevent {
  const logoutevent();
}

class inAuthregisterevent extends Serviceevent {
  final String email;
  final String password;

  inAuthregisterevent(this.email, this.password);
}

class createuserindbevent extends ServInitevent {
  final String email;
  final String firstname;
  final String lastname;

  final String occupation;

  createuserindbevent(
      this.email, this.firstname, this.lastname, this.occupation);
}

class movetoregisteevent extends ServInitevent {
  final BuildContext context;
  const movetoregisteevent(this.context);
}
