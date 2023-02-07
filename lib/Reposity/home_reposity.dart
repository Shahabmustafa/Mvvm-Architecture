import '../Data/network/BaseApiService.dart';
import '../Data/network/NetworkApiServce.dart';
import '../Model/PhotoModel.dart';
import '../res/component/app_url.dart';

class HomeRepository{

  final BaseApiService _apiService = NetworkApiService();

  Future<PhotoModel> fetchPhotoListapi()async{
    try{
      dynamic  response = await _apiService.getGetApiResponce(AppUrl.photoUrlEndPoint);
      return response = PhotoModel.fromJson(response);
    }catch(e){
      throw e;
    }
  }
}