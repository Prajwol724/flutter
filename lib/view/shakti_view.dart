import 'package:flutter/material.dart';
import 'package:practice_firebase/providers/shakti_provider.dart';
import 'package:practice_firebase/status_util.dart';
import 'package:practice_firebase/string_const.dart';
import 'package:provider/provider.dart';

class ShaktiMan extends StatelessWidget {
 ShaktiMan({super.key});
final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Column(
  children: [
    Column(

children: [

  Form(key: _formKey,
  child: Consumer<ShaktimanProvider>(builder: (context, shaktimanProvider, child) => 
  
   Column(
    children: [
    
    TextFormField(
    onChanged: (value) {
      shaktimanProvider.email=value;
    },
    decoration: InputDecoration(
    hintText: emailStr,labelText: "Email"
    ),
     validator:(value) {
            
            if(value!.isEmpty){
              return emailStr;
            }
            return null;
          },
    
    ),
    TextFormField(
    onChanged: (value) {
      shaktimanProvider.role=value;
    },
    decoration: InputDecoration(
    hintText: roleStr,labelText: "Role"
    ),
     validator:(value) {
            
            if(value!.isEmpty){
              return roleStr;
            }
            return null;
          },
    
    ),
    TextFormField(
    onChanged: (value) {
      shaktimanProvider.userName=value;
    },
    decoration: InputDecoration(
    hintText: userNameStr,labelText: "username"
    ),
     validator:(value) {
            
            if(value!.isEmpty){
              return userNameStr;
            }
            return null;
          },
    
    ),
    TextFormField(
    onChanged: (value) {
      shaktimanProvider.password=value;
    },
    decoration: InputDecoration(
    hintText: passwordStr,labelText: "Password"
    ),
     validator:(value) {
            
            if(value!.isEmpty){
              return passwordStr;
            }
            return null;
          },
    
    ),
    ElevatedButton(onPressed: () async{
        if(_formKey.currentState!.validate()){
          
          await shaktimanProvider.saveShakti();
          if (shaktimanProvider.shaktiStatusUtil ==
                              StatusUtil.success) {
                            const snackBar = SnackBar(
                              content: Text(successStr),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else if (shaktimanProvider.shaktiStatusUtil ==
                              StatusUtil.error) {
                            var snackBar = SnackBar(
                              content: Text(shaktimanProvider.errorMessage!),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
        }

        
      }, child: shaktimanProvider.shaktiStatusUtil==StatusUtil.loading?CircularProgressIndicator(): Text("submit")),
     
    
    
    ],
    
    ),
  ),
  )
],

    )
  ],
),


    );
  }
}