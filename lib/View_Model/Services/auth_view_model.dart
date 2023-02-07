import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvvm_architecture/Reposity/auth_repositry.dart';
import 'package:mvvvm_architecture/Utls/routes/route_name.dart';
import 'package:mvvvm_architecture/Utls/utls.dart';
import 'package:mvvvm_architecture/View_Model/Services/user_view_model.dart';
import 'package:provider/provider.dart';

import '../../Model/User_model.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepositry();

  bool _loading = false;
  bool get loading => _loading;

  bool _signuploading = false;
  bool get signuploading => _signuploading;

  setSignUpLoading(bool value){
    _signuploading = value;
    notifyListeners();
  }

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data , BuildContext context)async{
    setLoading(true);
    _myRepo.loginApi(data).then((value){
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context,listen: false);
      userPreference.saveUser(
        UserModel(
          token: value['token'].toString(),
        ),
      );
      Utils.flushBarErrorMessage('Login Sucessfully', context);
      Navigator.pushNamed(context, RoutesName.Home);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace){
      setLoading(false);
      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
  Future<void> SignUpApi(dynamic data , BuildContext context)async{
    setSignUpLoading(true);
    _myRepo.loginApi(data).then((value){
      setSignUpLoading(false);
      Utils.flushBarErrorMessage('Sign Up Sucessfully', context);
      Navigator.pushNamed(context, RoutesName.Home);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace){
      setSignUpLoading(false);
      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

}