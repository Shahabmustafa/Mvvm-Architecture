import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvvm_architecture/Model/User_model.dart';
import 'package:mvvvm_architecture/Utls/routes/route_name.dart';
import 'package:mvvvm_architecture/View_Model/Services/user_view_model.dart';

class SplashService{
  Future<UserModel> getUserdata() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context)async{
    getUserdata().then((value)async{
      if(value.token == 'null' || value.token == ''){
        await Future.delayed(Duration(seconds: 4));
        Navigator.pushNamed(context, RoutesName.Login);
      }else{
        await Future.delayed(Duration(seconds: 4));
        Navigator.pushNamed(context, RoutesName.Home);
      }
      },
    ).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    },
    );
  }
}