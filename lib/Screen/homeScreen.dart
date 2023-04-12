import 'package:exam_2/utiles/dataModal.dart';
import 'package:flutter/material.dart';
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 int i=0;
  var name,num;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.black38,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.more_vert,
              size: 25,
              color: Colors.black38,
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 35),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("My Contact",
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontSize: 23))),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                child: Expanded(
                  child: Container(

                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(10))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  "Type of name or numbers",
                                  style: TextStyle(color: Colors.black38),
                                ),
                                Spacer(),
                                Icon(Icons.search_rounded,
                                    size: 20, color: Colors.black12),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          Column(
                            children: [
                              SizedBox(
                                  height: 475,
                                  child: ListView.builder(
                                      itemBuilder: (context, index) =>
                                          mynumber(contactList[index]),
                                      itemCount: contactList.length)),

                            ],
                          )
                        ],
                      ),
                  ),
                ),
              ),
              FloatingActionButton(child: Icon(Icons.add),backgroundColor: Colors.blue,onPressed: () {
                setState(() {
                  i++;
                    });
                Navigator.pushNamed(context, 'add',arguments: ContactClass(name: name,num: num)).then((value) => 'add');

              },)

        ]
      ),
    ),
    ),
    ),
    );
  }

  Widget mynumber(ContactClass c1) {
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
                "${c1.name}",
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                "${c1.num}",
                style: TextStyle(color: Colors.black38, fontSize: 12),
              ),
            ],
          ),
          Spacer(),
          IconButton(onPressed: () {
            Navigator.pushNamed(context, 'profileScreen',arguments: c1);
          }, icon: Icon(Icons.phone,color: Colors.blue,),
          ),
          IconButton(onPressed: () {
            Navigator.pushNamed(context, 'profileScreen',arguments: c1);
          }, icon: Icon(Icons.sms,color: Colors.blue,),
          ),
        ],
      ),
    );
  }
}
