import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:practice_firebase/api_response.dart';
import 'package:practice_firebase/model/new_practise_model.dart';
import 'package:practice_firebase/status_util.dart';
import 'package:practice_firebase/user_service.dart';
import 'package:practice_firebase/user_service_impl.dart';
ShaktiService shaktiService= ShaktiServiceImpl();
Shakti shakti=Shakti();


List<Shakti>shaktiList=[];
class ShaktimanProvider extends ChangeNotifier{
String? userName, role, password,email,errorMessage;

 StatusUtil shaktiStatusUtil = StatusUtil.idle;

 setShaktiStatus(StatusUtil value){
  shaktiStatusUtil=value;
  notifyListeners();
 } 
 FirebaseMessaging messaging = FirebaseMessaging.instance;
Future<void> saveShakti() async {
    if (shaktiStatusUtil != StatusUtil.loading) {
      setShaktiStatus(StatusUtil.loading);
    }
    String? token = await messaging.getToken();
    Shakti shakti = Shakti(
        email: email,
        password: password,
        role: role,
        firebaseToken: token,
        username:userName);
ApiResponse response= await shaktiService.saveShakti(shakti);
if(response.status==StatusUtil.success){
  setShaktiStatus(StatusUtil.success);
}else if(response.status==StatusUtil.error){
    errorMessage=response.errorMessage;
    setShaktiStatus(StatusUtil.error, );
   }


}

}

