// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_app/global/common/toast.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:AppBar(
//         backgroundColor: Colors.blue,
//         title: const Text(
//           'Home Page'
//         ),
//       ) ,
//       body:Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Center(
//             child: Text(
//           'Welcome to Home',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 25
//           ),
//           ),
//         ),
//         const SizedBox(height: 30,),
//         GestureDetector(
//           onTap: () {
//             FirebaseAuth.instance.signOut();
//             Navigator.pushNamed(context,"/login");
//             showToast(message: "Successfully signed out");
//           },
//           child: Container(
//             height: 45,
//             width: 100,
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               borderRadius: BorderRadius.circular(10)
//             ),
//             child:const Center(
//               child: Text(
//                 'Sign Out',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18
          
//                 ),
//               ),)
//           ),
//         ),
//         const SizedBox(height: 30,),
//         GestureDetector(
//           onTap: () async {
//             final firestore = FirebaseFirestore.instance;

//             await firestore.collection("users").doc("2").set(
//               {
//                 "username": "Tommmmm",
//                 "address": "India",
//                 "firstNme": "Kalani"
//               }
//             );
            
//           },
//           child: Container(
//             height: 50,
//             width: 120,
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               borderRadius: BorderRadius.circular(10)
//             ),
//             child:const Center(
//               child: Text(
//                 'Create Data',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18
          
//                 ),
//               ),)
//           ),
//         )

//         ],
        
//       )
//     );
//   }
// }



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Insertdata extends StatefulWidget {
  @override
  State<Insertdata> createState() => _InsertdataState();
}

class _InsertdataState extends State<Insertdata> {
  TextEditingController sample1 = new TextEditingController();
  TextEditingController sample2 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: sample1,
              decoration: const InputDecoration(hintText: "Data 1"),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: sample2,
              decoration: const InputDecoration(hintText: "Data 2"),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Map<String, dynamic> data = {
                  "Field1": sample1.text,
                  "Field2": sample2.text,
                };
                FirebaseFirestore.instance.collection("users").add(data);
              },
              child: Container(
                  height: 45,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
