import 'package:flutter/material.dart';
import 'package:mvvvm_architecture/Utls/routes/route_name.dart';
import 'package:mvvvm_architecture/View/home_view.dart';
import 'package:mvvvm_architecture/View/login_view.dart';
import 'package:mvvvm_architecture/View/signup_screen.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.Home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());
      case RoutesName.Login:
        return MaterialPageRoute(builder: (BuildContext context) => LoginPage());
      case RoutesName.SignUp:
        return MaterialPageRoute(builder: (BuildContext context) => SignUpView());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text(
                  'No Routes Define'
              ),
            ),
          );
        });
    }
  }
}