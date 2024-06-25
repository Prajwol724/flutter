import 'package:flutter/foundation.dart';
import 'package:practice_firebase/api_response.dart';
import 'package:practice_firebase/model/form_model.dart';
import 'package:practice_firebase/status_util.dart';
import 'package:practice_firebase/user_service.dart';
import 'package:practice_firebase/user_service_impl.dart';

class FormProvider extends ChangeNotifier{

UserService userService =UserServiceImpl();

String ? errorMessage;
String? firstname, lastname, faculty,gender,email,password, age;

StatusUtil saveUserStatus= StatusUtil.idle;
setUserStatus(StatusUtil status){
saveUserStatus=status;
notifyListeners();
}
Future<void>saveStudent()async{
if(saveUserStatus!=StatusUtil.loading){
setUserStatus(StatusUtil.loading);
}
Student student=Student(fname: firstname,lname:lastname,age: int.parse(age??"0"),gender: gender,faculty:faculty,email: email,password: password );
  ApiResponse response=await userService.saveStudent(student);
  if(response.status==StatusUtil.success){
    setUserStatus(StatusUtil.success);
  }
   else if(response.status==StatusUtil.error){
    errorMessage=response.errorMessage;
    setUserStatus(StatusUtil.error, );
   }


}

}