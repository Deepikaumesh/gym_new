import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Firebase Multi Login_Gym/Auth/loginn.dart';
import 'Firebase Multi Login_Gym/member/test_animation.dart';
import 'edit_profile_test/view_image.dart';

var email_get_test = "trainer@gmail.com";
var email_get;

var member_name;

var member_Image;

var tester_name;

var tester_Image;

var trainer_name='';
var  trainer_Image='';
var trainer_address='';
var trainer_age='';
var trainer_gender='';
var trainer_phone='';
var trainer_id='';

var member_Payment_Id='';


var member_pro_name ="";
var member_pro_Name ="";
var member_pro_date ="";
var member_pro_account ="";
var member_pro_bank ="";
var member_pro_phone ="";
var member_pro_price ="";




void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    // options: FirebaseOptions(
    //   apiKey: "",
    //   appId: "",
    //   messagingSenderId: "",
    //   projectId: "",
    //)
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    setState(() {
      getDoc_name();
    });
    // TODO: implement initState
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // home:LoginPage(),
      home:animation_test(),

      //animation_test
    );
  }

  Future getDoc_name() async {
    var a = await FirebaseFirestore.instance
        .collection('Buy_Product')
        .doc(email_get)
        .get();
    if (a.exists) {
      member_pro_name = a.get('name');
      member_pro_Name = a.get('product_name');
      member_pro_date = a.get('Date');
      member_pro_account = a.get('account');
      member_pro_bank = a.get('bank');
      member_pro_phone = a.get('phone');
      member_pro_price = a.get('price');

      return a;
    }
    if (!a.exists) {
      print('Not exists');
      print("no data");



      return null;
    }
  }
}
