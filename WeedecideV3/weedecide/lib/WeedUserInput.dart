import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weedecide/HomePage.dart';

import 'database folder/databaseMethod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WeedUserInput(),
  ));
}

class WeedUserInput extends StatefulWidget {
  const WeedUserInput({super.key});

  @override
  State<WeedUserInput> createState() => _WeedUserInputState();
}

class _WeedUserInputState extends State<WeedUserInput> {
  uploadData() async {
    Map<String, dynamic> uploaddata = {
      "First Name": userfirstnamecontroller.text,
      "Last Name": userlastnamecontroller.text,
      "Exp": userexpcontroller.text,
    };

    await DatabaseMethods().addUserDetails(uploaddata);
    Fluttertoast.showToast(
        msg: "Data Uploaded Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  TextEditingController userfirstnamecontroller = TextEditingController();
  TextEditingController userlastnamecontroller = TextEditingController();
  TextEditingController userexpcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50.0,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Text(
              "First Name",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 151, 255, 255),
                borderRadius: BorderRadius.circular(22)),
            child: TextField(
              controller: userfirstnamecontroller,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Your First Name',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 17, 17, 17))),
              style: const TextStyle(color: Color.fromARGB(255, 17, 17, 17)),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Text(
              "Last Name",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 151, 255, 255).withOpacity(.50),
                borderRadius: BorderRadius.circular(22)),
            child: TextField(
              controller: userlastnamecontroller,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Your Last Name',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 17, 17, 17))),
              style: const TextStyle(color: Color.fromARGB(255, 17, 17, 17)),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Text(
              "Years Experience",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 151, 255, 255),
                borderRadius: BorderRadius.circular(22)),
            child: TextField(
              controller: userexpcontroller,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Your Experience',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 17, 17, 17))),
              style: const TextStyle(color: Color.fromARGB(255, 17, 17, 17)),
            ),
          ),
          const SizedBox(
            height: 90.0,
          ),
          GestureDetector(
            onTap: () {
              // Perform your upload operation here.
              uploadData();

              // Then, navigate to the Herbecide screen.
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const HomePage()), // Assuming Herbecide is a valid route/page.
              );
            },
            child: Center(
              child: Container(
                width: 150,
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  "Create",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
