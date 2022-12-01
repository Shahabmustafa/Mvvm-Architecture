import 'package:mvvvm_architecture/Data/response/status.dart';

class ApiResponse<T>{
  Status? status;
  T? data;
  String? message;
  ApiResponse([this.status,this.data,this.message]);

  ApiResponse.loading() : status = Status.Loading;

  ApiResponse.complete() : status = Status.Complete;

  ApiResponse.error() : status = Status.Error;

  @override
  String toString(){
    return 'Status: $status \n Message: $message \n Data: $data';
  }
}