import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:practice_firebase/api_response.dart';
import 'package:practice_firebase/model/form_model.dart';
import 'package:practice_firebase/status_util.dart';
import 'package:practice_firebase/string_const.dart';
import 'package:practice_firebase/user_service.dart';
import 'package:practice_firebase/user_service_impl.dart';

class FormProvider extends ChangeNotifier{

UserService userService =UserServiceImpl();
UpdateStudent updateStudentt=UpdateStudentImpl();
// EmailValidation emailValidation=EmailValidationImpl();

String ? errorMessage;
String firstname="", lastname="", faculty="",gender="",email="",password="", age="",id="";


setFirstName(value){
  firstname=value; 
  notifyListeners();
}
setLastName(value){
  lastname=value;
  notifyListeners();
}
setAge(value){
age=value;
notifyListeners();
}
setEmail(value){
  email=value;
  notifyListeners();
}
setGender(value){
  gender=value;
  notifyListeners();
}
setPassword(value){
  password=value;
  notifyListeners();
}
setFaculty(value){
  faculty=value;
  notifyListeners();
}
setId(value){
  id=value;
  notifyListeners();
}





StatusUtil saveUserStatus= StatusUtil.idle;
setUserStatus(StatusUtil status){
saveUserStatus=status;
notifyListeners();
}
Future<void>saveStudent()async{
if(saveUserStatus!=StatusUtil.loading){
setUserStatus(StatusUtil.loading);
}
 late ApiResponse response;
Student student=Student(
id: id,
fname: firstname,
lname: lastname,
age: int.parse(age),
gender: gender,
faculty: faculty,
password: password,
email: email,


);
if(id.isNotEmpty){
  response=await  updateStudentt.updateStudent(student); 
}
 else{
  response=await userService.saveStudent(student);
} 


  if(response.status==StatusUtil.success){
    setUserStatus(StatusUtil.success);
  }
   else if(response.status==StatusUtil.error){
    errorMessage=response.errorMessage;
    setUserStatus(StatusUtil.error, );
   }


}

}