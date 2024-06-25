import 'package:dio/dio.dart';
import 'package:practice_firebase/api_response.dart';
import 'package:practice_firebase/status_util.dart';

class Api{
Dio dio= Dio();

get (String url) async{
  try{
  Response response= await dio.get(url);
if(response.statusCode==200||response.statusCode==201){
  ApiResponse apiResponse=ApiResponse(status: StatusUtil.success,data: response.data);
  return apiResponse;
}
  }catch(e){
    return ApiResponse();
  }
}
 post(String url,var data)async{
try{
Response response=await dio.post(url,data: data);
if(response.statusCode==200||response.statusCode==201){
  ApiResponse apiResponse=ApiResponse(status: StatusUtil.success,data: response.data);
return apiResponse;
}
}catch(e){
ApiResponse apiResponse=ApiResponse(status: StatusUtil.error,errorMessage: e.toString());
return apiResponse;
}
  }
}