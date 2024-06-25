import 'package:flutter/material.dart';
import 'package:practice_firebase/providers/form_provider.dart';
import 'package:practice_firebase/status_util.dart';
import 'package:practice_firebase/string_const.dart';
import 'package:provider/provider.dart';

class FormBase extends StatelessWidget {
   FormBase({super.key});
final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 body: SafeArea(
   child: Consumer<FormProvider>(builder: (context, formProvider, child) => 
    Column(
      children: [
     Form(key: _formKey,
     child: Column(
      children: [
     TextFormField(
        onChanged: (value) {
          formProvider.firstname=value;
        },
        decoration: InputDecoration(
      
      
      hintText:fnameStr,labelText:"First Name", 
      
      
        ),
        validator:(value) {
          if(value!.isEmpty){
            return fnameStr;
          }
          return null;
        },
      ),
      TextFormField(
        onChanged: (value) {
          formProvider.lastname=value;
        },
        decoration: InputDecoration(
      hintText: lnameStr,labelText: "Last Name",
        ),
        validator: (value) {
          if(value!.isEmpty){
            return lnameStr;
          }
          return null;
        },
      ),
      TextFormField(
        onChanged: (value) {
          formProvider.age=value;
        },
        decoration: InputDecoration(
      hintText: ageStr,labelText: "Age",
        ),
        validator: (value) {
          if(value!.isEmpty){
            return ageStr;
          }
          return null;
        },
      ),
      TextFormField(
        onChanged: (value) {
          formProvider.faculty=value;
        },
        decoration: InputDecoration(
      hintText: facultyStr,labelText: "Faculty",
      
        ),
        validator: (value) {
          if(value!.isEmpty){
            return facultyStr;
          }
          return null;
        },
      ),
      TextFormField(
        onChanged: (value) {
          formProvider.gender=value;
        },
        decoration: InputDecoration(
      hintText: genderStr,labelText: "gender"
        ),
        validator: (value) {
          if(value!.isEmpty)
          return genderStr;
          return null;
        },
      ),
      TextFormField(
        onChanged: (value) {
        formProvider.email=value;
        },
        decoration: InputDecoration(
      hintText: emailStr,labelText: "Email"
        ),
        validator: (value) {
          if(value!.isEmpty){
            return emailStr;
          }
          return null;
        },
      ),
      TextFormField(
        onChanged: (value) {
          formProvider.password=value;
        },
        decoration: InputDecoration(
      hintText: passwordStr,labelText: "password"
        ),
        validator: (value) {
          if(value!.isEmpty){
            return passwordStr;
          }
          return null;
        },
      ),
      
      
      ElevatedButton(onPressed: () async{
        if(_formKey.currentState!.validate()){
          await formProvider.saveStudent();
          if (formProvider.saveUserStatus ==
                              StatusUtil.success) {
                            const snackBar = SnackBar(
                              content: Text(successStr),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else if (formProvider.saveUserStatus ==
                              StatusUtil.error) {
                            var snackBar = SnackBar(
                              content: Text(formProvider.errorMessage!),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
        }

        
      }, child: formProvider.setUserStatus==StatusUtil.loading?CircularProgressIndicator(): Text("submit")),
     
        
      ],
     ),
     
     
     
     )
     
      
      ],
     ),
   ),
 ),


    );
  }
}