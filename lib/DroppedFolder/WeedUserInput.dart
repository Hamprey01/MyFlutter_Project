// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:weedecide/HomePage.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// import 'database folder/databaseMethod.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: HomePage(),
//   ));
// }

// class WeedUserInput extends StatefulWidget {
//   const WeedUserInput({
//     Key? key,
//     required this.imagePath,
//     // required this.weed,
//   }) : super(key: key);

//   final String imagePath;

//   @override
//   State<WeedUserInput> createState() => _WeedUserInputState();
// }

// class _WeedUserInputState extends State<WeedUserInput> {
//   uploadData() async {
//     Map<String, dynamic> uploaddata = {
//       "First Name": userfirstnamecontroller.text,
//       "Last Name": userlastnamecontroller.text,
//       "Exp": userexpcontroller.text,
//     };

//     await DatabaseMethods().addUserDetails(uploaddata);
//     Fluttertoast.showToast(
//         msg: "Data Uploaded Successfully",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0);
//   }

//   TextEditingController userfirstnamecontroller = TextEditingController();
//   TextEditingController userlastnamecontroller = TextEditingController();
//   TextEditingController userexpcontroller = TextEditingController();

//   Future<String?> uploadImageToFirebase(String imagePath) async {
//     try {
//       File imageFile = File(imagePath);
//       String fileName = DateTime.now()
//           .millisecondsSinceEpoch
//           .toString(); // Unique name for the file

//       final Reference storageReference =
//           FirebaseStorage.instance.ref().child('weedPictures/$fileName');
//       await storageReference.putFile(imageFile);

//       String downloadURL = await storageReference.getDownloadURL();
//       return downloadURL;
//     } catch (e) {
//       print('Error uploading image: $e');
//       return null;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 50.0,
//             ),
//             const Padding(
//               padding: EdgeInsets.only(left: 30.0),
//               child: Text(
//                 "First Name",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.w500),
//               ),
//             ),
//             const SizedBox(
//               height: 10.0,
//             ),
//             Container(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
//               margin: const EdgeInsets.symmetric(horizontal: 20.0),
//               decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 151, 255, 255),
//                   borderRadius: BorderRadius.circular(22)),
//               child: TextField(
//                 controller: userfirstnamecontroller,
//                 decoration: const InputDecoration(
//                     border: InputBorder.none,
//                     hintText: 'Your First Name',
//                     hintStyle:
//                         TextStyle(color: Color.fromARGB(255, 17, 17, 17))),
//                 style: const TextStyle(color: Color.fromARGB(255, 17, 17, 17)),
//               ),
//             ),
//             const SizedBox(
//               height: 20.0,
//             ),
//             const Padding(
//               padding: EdgeInsets.only(left: 30.0),
//               child: Text(
//                 "Last Name",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.w500),
//               ),
//             ),
//             const SizedBox(
//               height: 10.0,
//             ),
//             Container(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
//               margin: const EdgeInsets.symmetric(horizontal: 20.0),
//               decoration: BoxDecoration(
//                   color:
//                       const Color.fromARGB(255, 151, 255, 255).withOpacity(.50),
//                   borderRadius: BorderRadius.circular(22)),
//               child: TextField(
//                 controller: userlastnamecontroller,
//                 decoration: const InputDecoration(
//                     border: InputBorder.none,
//                     hintText: 'Your Last Name',
//                     hintStyle:
//                         TextStyle(color: Color.fromARGB(255, 17, 17, 17))),
//                 style: const TextStyle(color: Color.fromARGB(255, 17, 17, 17)),
//               ),
//             ),
//             const SizedBox(
//               height: 20.0,
//             ),
//             const Padding(
//               padding: EdgeInsets.only(left: 30.0),
//               child: Text(
//                 "Years Experience",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.w500),
//               ),
//             ),
//             const SizedBox(
//               height: 10.0,
//             ),
//             Container(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
//               margin: const EdgeInsets.symmetric(horizontal: 20.0),
//               decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 151, 255, 255),
//                   borderRadius: BorderRadius.circular(22)),
//               child: TextField(
//                 controller: userexpcontroller,
//                 decoration: const InputDecoration(
//                     border: InputBorder.none,
//                     hintText: 'Your Experience',
//                     hintStyle:
//                         TextStyle(color: Color.fromARGB(255, 17, 17, 17))),
//                 style: const TextStyle(color: Color.fromARGB(255, 17, 17, 17)),
//               ),
//             ),
//             const SizedBox(
//               height: 10.0,
//             ),
//             Center(
//               child: Container(
//                 width: 180,
//                 height: 180,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.rectangle, // Change the shape to rectangle
//                 ),
//                 child: Image.file(
//                   File(widget.imagePath),
//                   fit: BoxFit
//                       .contain, // Ensure the image fits within the dimensions
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 90.0,
//             ),
//             GestureDetector(
//               onTap: () async {
//                 uploadData();

//                 // Then, navigate to the Herbecide screen.
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>
//                           const HomePage()), // Assuming Herbecide is a valid route/page.
//                 );

//                 String? downloadURL =
//                     await uploadImageToFirebase(widget.imagePath);
//                 if (downloadURL != null) {
//                   // Image uploaded successfully, you can use the downloadURL as needed.
//                   print('Image uploaded to Firebase Storage: $downloadURL');
//                 }
//               },
//               child: Center(
//                 child: Container(
//                   width: 150,
//                   padding: const EdgeInsets.symmetric(vertical: 10.0),
//                   decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(10)),
//                   child: const Center(
//                       child: Text(
//                     "Create",
//                     style: TextStyle(
//                         fontSize: 20.0,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold),
//                   )),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
