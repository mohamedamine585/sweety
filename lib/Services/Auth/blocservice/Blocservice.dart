import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sweety/Services/Auth/AuthService.dart';
import 'package:sweety/Services/Auth/Authprovider.dart';
import 'package:sweety/Services/Auth/CloudStorage/Userstorage/user_cloud.dart';
import 'package:sweety/Services/Auth/FirebaseAuthservice.dart';
import 'package:sweety/Services/Auth/blocservice/blocevent.dart';
import 'package:sweety/Services/Auth/blocservice/blocstate.dart';
import 'package:sweety/Views/LoginView.dart';
import 'package:sweety/Views/RegisterView.dart';
import 'package:sweety/routes.dart';

class ServiceBloc extends Bloc<Serviceevent, ServiceState> {
  ServiceBloc(Authprovider provider) : super(const Servicestateloading()) {
    on<ServInitevent>((event, emit) async {
      try {
        await Authservice.firebase().Initialize();
        final user = Authservice.firebase().currentuser;
        if (user == null) {
          emit(const loggedoutstate());
        } else {
          emit(loggedinstate(user));
        }
      } catch (e) {
        print(e);
      }
    });
    on<loginevent>(
      (event, emit) async {
        try {
          final user = await Authservice.firebase()
              .Loginwithaccount(email: event.email, password: event.password);
          if (user != null) emit(loggedinstate(user));
        } catch (e) {
          print(e);
        }
      },
    );
    on<logoutevent>(
      (event, emit) async {
        try {
          final user = await Authservice.firebase().Logout();
          emit(loggedoutstate());
        } catch (e) {
          print(e);
        }
      },
    );
    on<inAuthregisterevent>(
      (event, emit) async {
        try {
          final user = await Authservice.firebase()
              .Register(email: event.email, password: event.password);
          if (user != null) {
            emit(const registeredstate());
          } else {
            emit(const notregisteredstate());
          }
        } catch (e) {
          print(e);
        }
      },
    );
    on<createuserindbevent>(((event, emit) async {
      try {
        final user = await FirebaseCloudStorageforusers().create_user(
            email: event.email,
            firstname: event.firstname,
            lastname: event.lastname,
            occupation: event.occupation);
        if (user != null) emit(usercreateddbstate());
      } catch (e) {
        print(e);
      }
    }));
    on<movetoregisteevent>(((event, emit) {
      try {
        Navigator.push(event.context,
            MaterialPageRoute(builder: ((context) => const RegisterView())));
      } catch (e) {}
    }));
  }
}
