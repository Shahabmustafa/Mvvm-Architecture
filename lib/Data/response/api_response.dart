import 'package:mvvvm_architecture/Data/response/status.dart';

class ApiResponse<T>{
  Status? status;
  T? data;
  String? message;
  ApiResponse([this.status,this.data,this.message]);

  ApiResponse.loading() : status = Status.Loading;

  ApiResponse.complete(this.data) : status = Status.Complete;

  ApiResponse.error(this.message) : status = Status.Error;

  @override
  String toString(){
    return 'Status: $status \n Message: $message \n Data: $data';
  }
}