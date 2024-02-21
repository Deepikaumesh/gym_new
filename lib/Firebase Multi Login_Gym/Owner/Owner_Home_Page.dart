import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../About_Us.dart';
import '../Auth/loginn.dart';
import 'Owner_Display_Member_fees.dart';
import 'Owner_Display_Product.dart';
import 'Owner_Update_Display_Product.dart';
import 'Owner_add_Product.dart';
import 'View_Member_Attendance.dart';
import 'View_Member_details.dart';
import 'View_Staff_details.dart';
import 'View_Trainer_Attendance.dart';
import 'chatpage_Owner.dart';
import 'Owner_Display_Sold_Product.dart';

class Owner extends StatefulWidget {
  const Owner({super.key});

  @override
  State<Owner> createState() => _OwnerState();
}

class _OwnerState extends State<Owner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Owner"),
        toolbarHeight: 110,
        backgroundColor: Colors.teal.shade100,


      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green.shade100,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green.shade100),
                accountName: SizedBox(height: 2,),

                accountEmail: Text("${email_get.toString()}",style: TextStyle(color: Colors.teal.shade900),),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/owner.png"),
                  radius: 25,
                ), //UserAccountDrawerHeader
              ),
            ), //DrawerHeader

            ListTile(
              leading: Icon(Icons.logout),
              title: Text('LogOut'),
              onTap: () {
                logout(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.menu_book_outlined),
              title: Text('About Us'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => About_Us(
                        )));
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      minimumSize: MaterialStateProperty.all(Size(350, 50))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => View_Staff_details()));
                  },
                  child: Text("Staff Details")),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      minimumSize: MaterialStateProperty.all(Size(350, 50))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => View_Member_details()));
                  },
                  child: Text("Member Details")),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      minimumSize: MaterialStateProperty.all(Size(350, 50))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => View_Member_Attendance()));
                  },
                  child: Text("Member Attendance")),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      minimumSize: MaterialStateProperty.all(Size(350, 50))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Owner_Display_Member_fees()));
                  },
                  child: Text("Member fees")),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      minimumSize: MaterialStateProperty.all(Size(350, 50))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => View_Trainer_Attendance()));
                  },
                  child: Text("Trainer Attendance")),
              SizedBox(
                height: 50,
              ),

              ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      minimumSize: MaterialStateProperty.all(Size(350, 50))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Owner_add_Product()));
                  },
                  child: Text("Add Product")),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      minimumSize: MaterialStateProperty.all(Size(350, 50))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Owner_Display_Product()));

                    //
                  },
                  child: Text("Display Product")),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      minimumSize: MaterialStateProperty.all(Size(350, 50))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Owner_Display_Sold_Product()));

                    //
                  },
                  child: Text("Sold Product Details")),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      minimumSize: MaterialStateProperty.all(Size(350, 50))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Owner_Upate_Display_Product()));
                    //
                  },
                  child: Text("Update Product")),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      minimumSize: MaterialStateProperty.all(Size(350, 50))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => chatpage_Owner(
                                  email: email_get,
                                )));
                  },
                  child: Text("Chat")),
              SizedBox(
                height: 50,
              ),

            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
