import 'package:flutter/cupertino.dart';
import 'package:mvvvm_architecture/Data/response/api_response.dart';
import 'package:mvvvm_architecture/Model/PhotoModel.dart';
import 'package:mvvvm_architecture/Reposity/home_reposity.dart';

class HomeViewViewModel with ChangeNotifier{
  final _myRepo = HomeRepository();

  ApiResponse<PhotoModel> photoList = ApiResponse.loading();

  setPhotoList(ApiResponse<PhotoModel> response){
    photoList = response;
    notifyListeners();
  }

  Future<void> fetchPhotoListapi()async{
    setPhotoList(ApiResponse.loading());
    _myRepo.fetchPhotoListapi().then((value){
      setPhotoList(ApiResponse.complete(value));
    }).onError((error, stackTrace){
      setPhotoList(ApiResponse.error(error.toString()));
    });
  }
}