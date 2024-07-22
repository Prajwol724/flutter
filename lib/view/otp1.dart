import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Otp1 extends StatelessWidget {
   Otp1({super.key,this.verificationId});
String? verificationId,smsCode="";

FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Column(

  children: [

Text("OTP VERIFICATION"),
Text("enter your code here"),


OtpTextField(
          numberOfFields: 6,
        borderColor: Color(0xFF512DA8),
        //set to true to show as box or false to show as dash
        showFieldAsBox: true, 
        //runs when a code is typed in
        onCodeChanged: (String code) {
        smsCode=code;
            //handle validation or checks here           
        },
        //runs when every textfield is filled
        onSubmit: (String verificationCode){
            showDialog(
                context: context,
                builder: (context){
                return AlertDialog(
                    title: Text("Verification Code"),
                    content: Text('Code entered is $verificationCode'),
                );
                }
            );
        }, // end onSubmit


),
ElevatedButton(onPressed: ()async{
try{
   PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId!, smsCode: smsCode!);

    // Sign the user in (or link) with the credential
    await auth.signInWithCredential(credential);
}catch(e){
  Text("OTP code invalid");
}

}, child: Text("proceed"))


  ],
),


    );
  }
}