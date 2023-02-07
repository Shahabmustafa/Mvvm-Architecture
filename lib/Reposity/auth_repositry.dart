import 'package:mvvvm_architecture/Data/network/BaseApiService.dart';
import 'package:mvvvm_architecture/Data/network/NetworkApiServce.dart';
import 'package:mvvvm_architecture/res/component/app_url.dart';

class AuthRepositry{
  BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data)async{
    try{
      dynamic  response = await _apiService.getPostApiResponse(AppUrl.LoginUrl, data);
      return response;
    }catch(e){
      throw e;
    }
  }
  Future<dynamic> RegisterApi(dynamic data)async{
    try{
      dynamic  response = await _apiService.getPostApiResponse(AppUrl.RegisterUrl, data);
      return response;
    }catch(e){
      throw e;
    }
  }
}