import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoUpdate extends StatefulWidget {
  PhotoUpdate({super.key});

  @override
  State<PhotoUpdate> createState() => _PhotoUpdateState();
}

class _PhotoUpdateState extends State<PhotoUpdate> {
  File file = File("");
bool loader=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                file.path.isEmpty
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/commons/9/9a/Cristiano_Ronaldo_Portugal.jpg"),
                      )
                    : CircleAvatar(backgroundImage: FileImage(file)),
                ElevatedButton(
                    onPressed: () {
                      pickImage();
                    },
                    child:loader==true?CircularProgressIndicator(): Text("Upload")),
              ],
            )
          ],
        ),
      ),
    );
  }

  pickImage() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    file = File(image!.path);

    setState(() {
      loader=true;

      file;

    });
try{
      String fileName = file.path.split('/').last;

    var storageReference= FirebaseStorage.instance.ref();
    var uploadReference= storageReference.child(fileName);
    await uploadReference.putFile(file);

    String? downloadUrl= await uploadReference.child(fileName).getDownloadURL();

setState(() {
  loader=false;
});
    print("downloadURL$downloadUrl");
}catch(e){
  setState(() {
    loader=false;
  });
}
  }

}
