import 'package:flutter/cupertino.dart';
import 'package:practice_firebase/api_response.dart';
import 'package:practice_firebase/model/form_model.dart';
import 'package:practice_firebase/status_util.dart';
import 'package:practice_firebase/user_service.dart';
import 'package:practice_firebase/user_service_impl.dart';


class GetValueProvider extends ChangeNotifier{
  GetValueService getValueService= GetValueServiceImpl();
List<Student> studentList=[];
UserService userService=UserServiceImpl();
DeleteId deleteId=DeleteIdImpl();
String ? errorMessage;
StatusUtil saveGetUserStatus= StatusUtil.idle;
StatusUtil deleteUserStatus= StatusUtil.idle;

setGetUserStatus(StatusUtil status){
saveGetUserStatus=status;
notifyListeners();
}

setDeleteUserStatus(StatusUtil status){
deleteUserStatus=status;
notifyListeners();
}

Future<void>getStudent()async{
if(saveGetUserStatus!= StatusUtil.loading){
  setGetUserStatus(StatusUtil.loading);
}
ApiResponse response= await getValueService.getStudentData();
if(response.status==StatusUtil.success){
  studentList=  response.data;
  setGetUserStatus(StatusUtil.success);
}
else if(response.status==StatusUtil.error){
  errorMessage= response.errorMessage;
  setGetUserStatus(StatusUtil.error);
}
}

Future<void>deletebyId(String id)async{
  if(saveGetUserStatus!= StatusUtil.loading){
  setDeleteUserStatus(StatusUtil.loading);
}
ApiResponse response=await deleteId.deleteId(id);
if(response.status==StatusUtil.success){
  setDeleteUserStatus(StatusUtil.success);
}
else if(response.status==StatusUtil.error){
  errorMessage=response.errorMessage;
  setDeleteUserStatus(StatusUtil.error);
}
}




}