import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:gym_mngmnt_new/main.dart';
import 'package:intl/intl.dart';

import 'Owner_Update_Product.dart';

class Owner_Upate_Display_Product extends StatefulWidget {
  @override
  State<Owner_Upate_Display_Product> createState() => _Owner_Upate_Display_ProductState();
}

class _Owner_Upate_Display_ProductState extends State<Owner_Upate_Display_Product> {

  CollectionReference users = FirebaseFirestore.instance.collection(
      'Product Data');

  var current;

  var notcurrent;


  @override
  void initState() {
    // TODO: implement initState
    current = false;
    notcurrent = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: Colors.grey.shade600,
        title: Text(
          "Update Product Details",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: StreamBuilder(

        stream: FirebaseFirestore.instance.collection('Product Data')
            .snapshots(),

        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          var doc = users.doc('id').get();


          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Column(
                children: [
                  ListTile(
                    leading: FullScreenWidget(
                      disposeLevel: DisposeLevel.High,
                      child: CircleAvatar(
                        backgroundImage:
                        NetworkImage(document['image']),
                      ),
                    ),
                    title: Text(document['name']),
                    subtitle: Text(document['price'], style: TextStyle(
                        color: Colors.teal),),
                    trailing:GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Owner_Update_Product(
                            id: document.id, name: document['name'], image: document['image'], price: document['price'],)));
                        },
                        child: Icon(Icons.edit,color: Colors.green.shade900,)),
                  ),

                   Divider(thickness: 2,),
                ],
              );
            }).toList(),

          );
        },

      ),

    );
  }

  Future getDoc() async {
    var orderref =
    FirebaseFirestore.instance.collection("Mark_Member_attendance");
    var docsanpshots = await orderref.get();
    docsanpshots.docs.forEach((doc) {
      if (doc.get('Date') == '${getCurrentDate()}') {
        print("current date");
        current = true;
      } else {
        notcurrent = true;
      }
    });
  }

  String getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    return formattedDate.toString();
  }


  custom_listtile(String name,var image,var email,var address,var phone) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF7090B0).withOpacity(0.2),
              blurRadius: 20.0,
              offset: const Offset(0, 10.0),
            )
          ],
        ),
        child: Card(
          color: Colors.white,
          child: ListTile(
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.5),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            leading: Container(
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(image),
                ),
              ),
            ),
            title: Text(name

            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    email
                ),
                Text(
                    address
                ),
              ],
            ),
            trailing:Text(
                phone

            ),
          ),
        )

    );
  }


}
