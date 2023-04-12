import 'package:exam_2/utiles/dataModal.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'homeScreen.dart';

class NewAdd extends StatefulWidget {
  const NewAdd({Key? key}) : super(key: key);

  @override
  State<NewAdd> createState() => _NewAddState();
}

class _NewAddState extends State<NewAdd> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtnum = TextEditingController();
  String? path;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue.shade50,
          body: Container(
            height: 500,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          constraints: BoxConstraints.expand(height: 200),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25))),
                          builder: (context) => Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Select Profile",
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                    SizedBox(height: 20),
                                    InkWell(
                                        onTap: () async {
                                          ImagePicker imagepicker = ImagePicker();
                                          XFile? xfile =
                                              await imagepicker.pickImage(
                                                  source: ImageSource.gallery);
                                          setState(() {
                                            path = xfile!.path;
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Gallery",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1),
                                        )),
                                    SizedBox(height: 20),
                                    InkWell(
                                      onTap: () async {
                                        ImagePicker imagepicker = ImagePicker();
                                        XFile? xfile = await imagepicker.pickImage(
                                            source: ImageSource.camera);
                                        setState(() {
                                          path = xfile!.path;
                                        });
                                      },
                                      child: Text(
                                        "Take Photo",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    )
                                  ])));
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/tom&jerry.jpg"),
                      radius: 50,
                    ),
                  ),
                  SizedBox(height: 25),
                  TextField(
                    controller: txtname,
                    decoration: InputDecoration(
                      label: Text(
                        "Name",
                        style: TextStyle(fontSize: 15),
                      ),
                      disabledBorder: InputBorder.none,
                      fillColor: Colors.blue,
                      focusColor: Colors.black38,
                    ),
                  ),
                  SizedBox(height: 25),
                  TextField(
                    controller: txtnum,
                    decoration: InputDecoration(
                      label: Text(
                        "Number",
                        style: TextStyle(fontSize: 15),
                      ),
                      disabledBorder: InputBorder.none,
                      fillColor: Colors.blue,
                      focusColor: Colors.black38,
                    ),
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              var name = txtname.text;
              var num = txtnum.text;
              ContactClass c1 = ContactClass(name: name, num: num);
              contactList.add(c1);
              Navigator.pop(context);
            },
            child: Icon(Icons.done, color: Colors.white),
          ),
        ));
  }
}
