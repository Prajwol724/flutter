import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_firebase/providers/get_value_provider.dart';
import 'package:practice_firebase/status_util.dart';
import 'package:practice_firebase/view/view.dart';
import 'package:provider/provider.dart';

class GetValue extends StatefulWidget {
  const GetValue({super.key});

  @override
  State<GetValue> createState() => _GetValueState();
}

class _GetValueState extends State<GetValue> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

  getValue() async {
    Future.delayed(
      Duration.zero,
      () async {
        var provider = Provider.of<GetValueProvider>(context, listen: false);
        await provider.getStudent();
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GetValueProvider>(
        builder: (context, getValueProvider, child) => Column(
          children: [
            getValueProvider.saveGetUserStatus == StatusUtil.loading
                ? CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                        itemCount: getValueProvider.studentList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(getValueProvider
                                        .studentList[index].fname!),
                                    Text(getValueProvider
                                        .studentList[index].lname!),
                                  ],
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Delete File'),
                                            content: Text(
                                                'Are you sure you want to delete this file?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () async {
                                                  await getValueProvider
                                                      .deletebyId(
                                                          getValueProvider
                                                                  .studentList[
                                                                      index]
                                                                  .id ??
                                                              "");
                                                  if (getValueProvider
                                                          .deleteUserStatus ==
                                                      StatusUtil.success) {
                                                    const snackBar = SnackBar(
                                                      content: Text(
                                                          "deleted successfully"),
                                                    );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(snackBar);
                                                  }
                                                  ;
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              GetValue()));
                                                },
                                                child: Text('Yes'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  // Close the dialog
                                                },
                                                child: Text('No'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                                    SizedBox(
                                      width: 10,
                                    ),

                                    IconButton(onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FormBase(student: getValueProvider.studentList[index],)));
                                    }, icon: Icon(Icons.edit),color: Colors.green,),
                              ],
                            ),
                          );
                        }),
                  ),
          ],
        ),
      ),
    );
  }
}
