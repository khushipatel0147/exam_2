import 'dart:io';
import 'package:exam_2/utiles/dataModal.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'homeScreen.dart';

List<ContactClass> contactList = [
  ContactClass(name: 'Radhi', num: '8866002097'),
  ContactClass(name: 'Pinky', num: '9866002097'),
  ContactClass(name: 'Gadhvi', num: '8868802097'),
  ContactClass(name: 'Mital', num: '8866632497'),
  ContactClass(name: 'Mamta', num: '8865054397'),
  ContactClass(name: 'Ravina', num: '8632156942'),
  ContactClass(name: 'Rucha', num: '7521463985'),
  ContactClass(name: 'Lily', num: '8697594632'),
  ContactClass(name: 'Champa', num: '987456358'),
  ContactClass(name: 'Gulab', num: '978648975'),
];

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController txtnewname = TextEditingController();

  TextEditingController txtnewnum = TextEditingController();

  @override
  Widget build(BuildContext context) {
   ContactClass c1 = ModalRoute.of(context)!.settings.arguments as ContactClass;
 //   String ContactClass = ModalRoute.of(context)!.settings.arguments as String;



    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(0, -0.40),
                  child: Container(
                    height: 350,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.lightBlue.shade100,
                              spreadRadius: 2,
                              blurRadius: 10)
                        ]),
                  ),
                ),
                Align(
                    alignment: Alignment(0, -0.85),
                    child: c1.path == null
                        ? CircleAvatar(
                      radius: 80,
                      backgroundImage:
                      AssetImage("assets/images/tom&jerry.jpg"),
                    )
                        : CircleAvatar(
                      radius: 80,
                      backgroundImage:
                      FileImage(File("${c1.path}")),
                    )),
                Align(
                  alignment: Alignment(0, -0.15),
                  child: Container(
                    height: 250,
                    width: 350,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Text(
                          "${c1.name}",
                          style: TextStyle(
                              letterSpacing: 1, fontSize: 35, color: Colors.blue),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "${c1.num}",
                          style: TextStyle(
                              letterSpacing: 1, fontSize: 30, color: Colors.blue),
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue.shade50,
                                        spreadRadius: 2,
                                        blurRadius: 10)
                                  ]),
                              child: IconButton(
                                  onPressed: () async {
                                    String link =
                                        "sms: ${c1.num}?body=Welcome";
                                    await launchUrl(Uri.parse(link));
                                  },
                                  icon: Icon(
                                    Icons.message,
                                    color: Colors.blue,
                                    size: 35,
                                  )),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue.shade50,
                                        spreadRadius: 2,
                                        blurRadius: 10)
                                  ]),
                              child: IconButton(
                                  onPressed: () async {
                                    var index;
                                    String link = "tel: ${c1.num}";
                                    await launchUrl(Uri.parse(link));
                                  },
                                  icon: Icon(
                                    Icons.call,
                                    color: Colors.blue,
                                    size: 35,
                                  )),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue.shade50,
                                        spreadRadius: 2,
                                        blurRadius: 10)
                                  ]),
                              child: IconButton(
                                  onPressed: () {
                                    txtnewname = TextEditingController(
                                        text: "${c1.name}");
                                    txtnewnum = TextEditingController(
                                        text: "${c1.num}");
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "Update",
                                                style: TextStyle(
                                                    letterSpacing: 1,
                                                    fontSize: 18,
                                                    color: Colors.blue),
                                              ),
                                              TextField(
                                                controller: txtnewname,
                                              ),
                                              TextField(
                                                controller: txtnewnum,
                                              ),
                                              SizedBox(height: 25),
                                              InkWell(
                                                onTap: () {
                                                  c1 = ContactClass(
                                                      name: txtnewname.text,
                                                      num: txtnewnum.text);
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      color: Colors.blue,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                                  child: Center(
                                                    child: Text(
                                                      "Update",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          letterSpacing: 1,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                    size: 35,
                                  )),
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios_sharp,
          color: Colors.white,
        ),
      ),
    ));
  }
}





