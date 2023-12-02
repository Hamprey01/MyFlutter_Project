import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:weedecide/MyHomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WeedValidation(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WeedValidation extends StatefulWidget {
  const WeedValidation({super.key});

  // final String imagePath;

  @override
  State<WeedValidation> createState() => _WeedValidationState();
}

class _WeedValidationState extends State<WeedValidation> {
  HashSet<String> selectedItem = HashSet();
  bool isMultiSelectionEnable = false;

  final List<String> imagePaths = [
    'assets/background/bg1.jpg',
    'assets/background/bg4.gif',
    'assets/background/bg3.jpg',
    'assets/icon/archive.png',
    'assets/icon/art.png',
    'assets/icon/flower.png',
  ];

  int correctSelections = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getHeaderCountText()),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 700,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background/paddy.gif"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2A2E3F).withOpacity(
                  0.97), // Set your desired background color with opacity
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  const SizedBox(height: 16.0),
                  const Text(
                    "Are you a Robot? (You have only 3 selections of pictures)",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Nizzoli Alt',
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    "Choose which are the sagbot or Weeds in the picture",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Nizzoli Alt',
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      childAspectRatio: 1.5,
                      children: imagePaths.map((String path) {
                        return getGridItem(path);
                      }).toList(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (selectedItem.length == 3) {
                        // Check if 2 of the selections are from assets/background
                        int correctSelectionCount = 0;
                        for (String path in selectedItem) {
                          if (path.startsWith('assets/background')) {
                            correctSelectionCount++;
                          }
                        }
                        if (correctSelectionCount >= 2) {
                          // Navigate to another page because the user selected 2 or more correct choices
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return const MyHomePage(); // Replace with the actual page you want to navigate to
                            }),
                          );
                        } else {
                          // Prompt the user to choose the right pictures
                          // showDialog(
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return AlertDialog(
                          //       title: const Text("Validation Error"),
                          //       content: const Text(
                          //           "Please choose the Right Picture"),
                          //       actions: [
                          //         TextButton(
                          //           onPressed: () {
                          //             Navigator.of(context).pop();
                          //           },
                          //           child: const Text("OK"),
                          //         ),
                          //       ],
                          //     );
                          //   },
                          // );

                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Please Choose the right picture'),
                          ));
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF91B17D),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Submit'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String getHeaderCountText() {
    return selectedItem.isNotEmpty
        ? "${selectedItem.length}items selected"
        : "No items selected";
  }

  void doMultiSelection(String path) {
    setState(() {
      if (selectedItem.contains(path)) {
        selectedItem.remove(path);
      } else {
        selectedItem.add(path);
      }
    });
  }

  GridTile getGridItem(String path) {
    return GridTile(
      child: InkWell(
        onTap: () {
          doMultiSelection(path);
        },
        onLongPress: () {
          if (!isMultiSelectionEnable) {
            isMultiSelectionEnable = true;
          }
        },
        child: Stack(
          children: [
            Image.asset(
              path,
              color:
                  Colors.black.withOpacity(selectedItem.contains(path) ? 1 : 0),
              colorBlendMode: BlendMode.color,
            ),
            Visibility(
              visible: selectedItem.contains(path),
              child: const Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 36,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
