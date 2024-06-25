import 'package:practice_firebase/api_response.dart';
import 'package:practice_firebase/model/form_model.dart';

abstract class UserService{
Future<ApiResponse>saveStudent(Student student);
}
abstract class GetValueService{
  Future<ApiResponse>getStudentData();
}
abstract class DeleteId{
  Future<ApiResponse>deleteId(String id);
}