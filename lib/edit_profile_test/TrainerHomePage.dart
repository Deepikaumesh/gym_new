//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../main.dart';
// import '../Auth/loginn.dart';
// import '../../trainer/Edit_Profile_Trainer.dart';
// import 'Trainer_chatpage.dart';
//
//
//
//
// class Trainer extends StatefulWidget {
//   const Trainer({super.key});
//
//   @override
//   State<Trainer> createState() => _TrainerState();
// }
//
// class _TrainerState extends State<Trainer> {
//
//   final Future<String> _calculation = Future<String>.delayed(
//     const Duration(seconds: 1),
//         () => 'Data Loaded',
//   );
//
//   final CollectionReference _reference = FirebaseFirestore.instance.collection("Trainer_Add_Data");
//   final _auth = FirebaseAuth.instance;
//
//   String? _email() {
//     if (_auth.currentUser == null) {
//       return "no current user";
//     } else {
//       return _auth.currentUser!.email;
//     }
//   }
//
//   @override
//   void initState() {
//     setState(() {
//       trainer_name;
//       trainer_Image;
//       getDoc_name();
//     });
//
//
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   toolbarHeight: 100,
//       //  // title: Text("Trainer"),
//       //   title: StreamBuilder(
//       //     stream: FirebaseFirestore.instance.collection('Trainer_Add_Data').snapshots(),
//       //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//       //       if (!snapshot.hasData) {
//       //         return CircularProgressIndicator();
//       //       }
//       //
//       //       return Column(
//       //         children: snapshot.data!.docs.map((document) {
//       //
//       //           return Row(
//       //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       //             children: [
//       //               Text("Welcome "+document['name'],style: TextStyle(fontSize: 20),),
//       //               CircleAvatar(
//       //                   radius: 30,
//       //                   backgroundImage: NetworkImage(document['image'])),
//       //
//       //             ],
//       //           );
//       //         }).toList(),
//       //       );
//       //     },
//       //   ),
//       // ),
//
//       // appBar: AppBar(
//       //   toolbarHeight: 100,
//       //
//       //
//       //
//       //   title: FutureBuilder<String>(
//       //     future: _calculation, // a previously-obtained Future<String> or null
//       //     builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//       //       List<Widget> children;
//       //       if (snapshot.hasData) {
//       //         children = <Widget>[
//       //           Text("${trainer_name}",style: TextStyle(fontSize: 20,color: Colors.white),),
//       //           CircleAvatar(
//       //               backgroundColor: Colors.transparent,
//       //               radius: 20,
//       //               backgroundImage: NetworkImage(trainer_Image)),
//       //         ];
//       //       } else if (snapshot.hasError) {
//       //         children = <Widget>[
//       //           SizedBox(),
//       //
//       //         ];
//       //       } else {
//       //         children = const <Widget>[
//       //
//       //
//       //         ];
//       //       }
//       //       return Row(
//       //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       //         children: children,
//       //
//       //       );
//       //     },
//       //   ),
//       //
//       // ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.all(0),
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.green,
//               ), //BoxDecoration
//               child: UserAccountsDrawerHeader(
//                 decoration: BoxDecoration(color: Colors.green),
//                 accountName:StreamBuilder(
//                   stream: FirebaseFirestore.instance.collection('Trainer_Add_Data').snapshots(),
//                   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                     if (!snapshot.hasData) {
//                       return CircularProgressIndicator();
//                     }
//
//                     return Column(
//                       children:
//                       snapshot.data!.docs.map((document) {
//
//                            return Padding(
//                              padding: const EdgeInsets.only(top: 28),
//                              child: Text(document['name'],style: TextStyle(fontSize: 20),),
//                            );
//
//
//
//                       }).toList(),
//                     );
//                   },
//                 ),
//                 accountEmail: Text("${_email().toString()}"),
//                 currentAccountPictureSize: Size.square(50),
//
//                 currentAccountPicture: StreamBuilder(
//                   stream: FirebaseFirestore.instance.collection('Trainer_Add_Data').snapshots(),
//                   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                     if (!snapshot.hasData) {
//                       return CircularProgressIndicator();
//                     }
//
//                     return Column(
//                       children:
//                       snapshot.data!.docs.map((document) {
//
//                         return CircleAvatar(backgroundImage: NetworkImage(document['image']),radius: 25,
//                         );
//
//
//
//                       }).toList(),
//                     );
//                   },
//                 ),
//                 // currentAccountPicture: CircleAvatar(
//                 //   backgroundColor: Color.fromARGB(255, 165, 255, 137),
//                 //   child: Text(
//                 //     "A",
//                 //     style: TextStyle(fontSize: 30.0, color: Colors.blue),
//                 //   ), //Text
//                 // ), //circleAvatar
//               ), //UserAccountDrawerHeader
//             ), //DrawerHeader
//             ListTile(
//               leading: Icon(Icons.person),
//               title: Text(' Display Data '),
//               onTap: () {
//                // Navigator.push(context, MaterialPageRoute(builder: (context)=>Display_Data()));
//               },
//             ),
//
//             ListTile(
//               leading: Icon(Icons.book),
//               title: Text(' Chat '),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Trainer_Chatpage(email: email_get,)));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.workspace_premium),
//               title: Text(' Go Premium '),
//               onTap: () {
//                 Navigator.pop(context);
//                 print(email_get);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.video_label),
//               title: Text(' Saved Videos '),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.edit),
//               //title: Text(' Edit Profile '),
//               title: StreamBuilder(
//                 stream: FirebaseFirestore.instance.collection('Trainer_Add_Data').snapshots(),
//                 builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                   if (!snapshot.hasData) {
//                     return CircularProgressIndicator();
//                   }
//
//                   return Column(
//                     children: snapshot.data!.docs.map((document) {
//                       var id=document.id;
//                       return Padding(
//                         padding: EdgeInsets.only(right: 136),
//                        // child: Text("Edit Profile"),
//                       child: GestureDetector(
//                           onTap: (){
//                             // Navigator.push(context, MaterialPageRoute(builder: (context)=>
//                             //     Edit_Profile_Trainer(name:document['name'],image :document['image'],id: document.id,
//                             //       phone: document['phone'],address: document['address'],gender: document['gender'], age: document['age'],
//                             //     )));
//                           },
//                           child: Text("Edit Profile")),
//                       );
//                       // return Text(document['name'],style: TextStyle(fontSize: 20),);
//                     }).toList(),
//                   );
//                 },
//               ),
//               onTap: () {
//
//               },
//             ),
//             ListTile(
//
//               leading: Icon(Icons.logout),
//               title: Text('LogOut'),
//               onTap: () {
//                 logout(context);
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//
//
//
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(children: [
//
//             SizedBox(
//               height: 20,
//             ),
//
//
//             SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//                 style: ButtonStyle(
//                     foregroundColor: MaterialStateProperty.all(Colors.white),
//                     backgroundColor: MaterialStateProperty.all(Colors.black),
//                     minimumSize: MaterialStateProperty.all(Size(300, 100))),
//                 onPressed: () {},
//                 child: Text("WELCOME")),
//             SizedBox(
//               height: 60,
//             ),
//             ElevatedButton(
//                 style: ButtonStyle(
//                     foregroundColor: MaterialStateProperty.all(Colors.white),
//                     backgroundColor: MaterialStateProperty.all(Colors.black),
//                     minimumSize: MaterialStateProperty.all(Size(300, 100))),
//                 onPressed: () {},
//                 child: Text("MEMBERS ATTANDANCE")),
//             SizedBox(
//               height: 60,
//             ),
//             ElevatedButton(
//                 style: ButtonStyle(
//                     foregroundColor: MaterialStateProperty.all(Colors.white),
//                     backgroundColor: MaterialStateProperty.all(Colors.black),
//                     minimumSize: MaterialStateProperty.all(Size(300, 100))),
//                 onPressed: () {},
//                 child: Text("COMMUNICATION")),
//             SizedBox(
//               height: 60,
//             ),
//             ElevatedButton(
//                 style: ButtonStyle(
//                     foregroundColor: MaterialStateProperty.all(Colors.white),
//                     backgroundColor: MaterialStateProperty.all(Colors.black),
//                     minimumSize: MaterialStateProperty.all(Size(300, 100))),
//                 onPressed: () {},
//                 child: Text("MY ATTENDANCE")),
//
//
//
//           ]),
//         ),
//      ),
//     );
//   }
//
//   Future<void> logout(BuildContext context) async {
//     CircularProgressIndicator();
//     await FirebaseAuth.instance.signOut();
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => LoginPage(),
//       ),
//     );
//   }
//
//
//   Future getDoc_name() async {
//     var a = await FirebaseFirestore.instance
//         .collection('Trainer_Add_Data')
//         .doc(email_get)
//         .get();
//     if (a.exists) {
//
//
//       trainer_name = a.get('name');
//       trainer_Image = a.get('image');
//       print(member_name);
//
//
//       return a;
//     }
//     if (!a.exists) {
//       print('Not exists');
//
//       return null;
//     }
//
//
// }}
