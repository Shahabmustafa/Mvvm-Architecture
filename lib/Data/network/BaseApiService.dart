abstract class BaseApiService{
  Future<dynamic> getGetApiResponce(String url);
  Future<dynamic> getPostApiResponse(String url,dynamic data);
}