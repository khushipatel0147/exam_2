import 'package:flutter/material.dart';
import 'homeScreen.dart';

class Missedcall extends StatefulWidget {
  const Missedcall({Key? key}) : super(key: key);

  @override
  State<Missedcall> createState() => _MissedcallState();
}

class _MissedcallState extends State<Missedcall> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                  child: Expanded(
                    child: Container(
                      height: 685,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            SizedBox(height: 40),
                            Text(
                              "Missed calls",
                              style: TextStyle(
                                  color: Colors.blue,
                                  letterSpacing: 2,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 20),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "My Contacts",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15),
                                )),
                            SizedBox(height: 20),
                            Column(
                              children: [
                                SizedBox(
                                    height: 555,
                                    child: ListView.builder(
                                        itemBuilder: (context, index) =>
                                            mynumber(index),
                                        itemCount: contactList.length)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                    height: 60,
                    width: double.infinity,

                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget mynumber(int index) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Row(
        children: [
          SizedBox(width: 10),
          CircleAvatar(
            backgroundImage:AssetImage("assets/images/tom&jerry.jpg"),
            radius: 20,
          ),
          SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${contactList[index].name}",
                style: TextStyle(color: Colors.red,fontSize: 20),
              ),
            ],
          ),
          Spacer(),
          IconButton(onPressed: () {
            Navigator.pushNamed(context, 'profileScreen',arguments: index).then((value) {
              setState(() {

              });
            },);
          }, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.blue,))
        ],
      ),
    );
  }
}
