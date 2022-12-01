import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mvvvm_architecture/Data/network/BaseApiService.dart';
import 'package:mvvvm_architecture/Data/response/app_exception.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService{
  @override
  Future getGetApiResponce(String url)async{
    dynamic responseJson;
   try{
     final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
     responseJson = returnResponse(response);
   }on SocketException{
     throw FatchDataException('No Internet Connection');
   }
   return responseJson;
  }

  @override
  Future getPostApiResponse(String url,dynamic data)async{
    dynamic responseJson;
    try{
      Response response = await post(
        Uri.parse(url),
        body: data
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FatchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FatchDataException(
            'Error accour while communicating with server'
            +'with status code'+
            response.statusCode.toString());

    }
  }
  
}