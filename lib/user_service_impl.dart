import 'dart:js_interop_unsafe';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practice_firebase/api_response.dart';
import 'package:practice_firebase/model/form_model.dart';
import 'package:practice_firebase/status_util.dart';
import 'package:practice_firebase/user_service.dart';

class UserServiceImpl extends UserService {

  List<Student>studentList=[];
  @override
  Future<ApiResponse> saveStudent(Student student) async {
    try {
      bool isSuccess = false;
      await FirebaseFirestore.instance
          .collection("student")
          .add(student.toJson());

      return ApiResponse(status: StatusUtil.success, data: isSuccess);
    } catch (e) {
      return ApiResponse(status: StatusUtil.error, errorMessage: e.toString());
    }
  }
}

class GetValueServiceImpl extends GetValueService{
  List<Student>studentList=[];
 @override
Future<ApiResponse> getStudentData() async {
  try {
    var value = await FirebaseFirestore.instance.collection("student").get();
    var studentList = value.docs.map((e) => Student.fromJson(e.data())).toList();
    for(int i=0;i<studentList.length;i++){
studentList[i].id=value.docs[i].id;

    }
    print(studentList);
    return ApiResponse(status: StatusUtil.success, data: studentList);
  } catch (e) {
    return ApiResponse(status: StatusUtil.error, errorMessage: e.toString());
  }
}

  }
   class DeleteIdImpl extends DeleteId{
     @override
     Future<ApiResponse> deleteId(String id) async{
   try{
    await FirebaseFirestore.instance
          .collection("student").doc(id).delete();
         
         return ApiResponse(status: StatusUtil.success);
   }catch(e){
    return ApiResponse(status: StatusUtil.error,errorMessage: e.toString());

   }
     }
    
   }
