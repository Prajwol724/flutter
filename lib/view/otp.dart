import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_firebase/view/otp1.dart';

class OtpTest extends StatefulWidget {
  const OtpTest({super.key});

  @override
  State<OtpTest> createState() => _OtpTestState();
}

class _OtpTestState extends State<OtpTest> {

  String? phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("forget password",style: TextStyle(fontWeight: FontWeight.bold),),
          Text("recover your password"),
          TextFormField(onChanged: (value) {
            phoneNumber=value;
          },
            decoration: InputDecoration(
              hintText: "Phone Number",
              
            ),
          ),
          ElevatedButton(onPressed: ()async{
await FirebaseAuth.instance.verifyPhoneNumber(
  phoneNumber: '+977$phoneNumber',
  verificationCompleted: (PhoneAuthCredential credential) {},
  verificationFailed: (FirebaseAuthException e) {},
  codeSent: (String verificationId, int? resendToken) {
     Navigator.push(context, MaterialPageRoute(builder: (context)=>Otp1()));
  },
  codeAutoRetrievalTimeout: (String verificationId) {},
);
           
          }, child: Text("Recover"))
        ],
      ),
    );
  }
}