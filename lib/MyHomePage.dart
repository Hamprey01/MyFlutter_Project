import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:weedecide/HomePage.dart';
// import 'package:firebase_core/firebase_core.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imgList = [
    'assets/slideshow/assist.png',
    'assets/slideshow/camera.png',
    'assets/slideshow/herbicide.png',
    'assets/slideshow/weed.png'
  ];

  List<String> textList = [
    "Let start using the app by clicking the button",
    "Use the Camera to capture the weeds",
    "We will given herbecide recommendation",
    "The app will give information about weed",
    // Add more text items as needed
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Container(
        // background
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background/welcomeBackground.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2A2E3F).withOpacity(
                0.96), // Set your desired background color with opacity
          ),

          // design
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 320,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 260,
                      child: Stack(
                        children: [
                          Image.asset('assets/icon/logov3.png'),
                          Positioned(
                            bottom:
                                0, // Adjust the position of the text as needed
                            left: 0,
                            right: 0,
                            top: 160,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 85,
                                    fontFamily: 'Good Boy',
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'W',
                                        style: TextStyle(
                                            color: Color(0xff43D999))),
                                    TextSpan(
                                        text: 'ee',
                                        style: TextStyle(color: Colors.white)),
                                    TextSpan(
                                        text: 'D',
                                        style: TextStyle(
                                            color: Color(0xffE8C99B))),
                                    TextSpan(
                                        text: 'ecide',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 350,
                      height: 50,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom:
                                0, // Adjust the position of the text as needed
                            left: 0,
                            right: 0,
                            child: Container(
                              // Add a semi-transparent background to the text
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.center,
                              child: const Text(
                                'Helping Farmers To Detect Weeds From Rice Fields',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontFamily: 'Nizzoli Alt',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 280,
                // color: Colors.deepPurple[300],
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 400,
                    autoPlay: true,
                  ),
                  itemCount: imgList.length,
                  itemBuilder: (context, index, real) {
                    final img = imgList[index];
                    final textArray = textList[index];

                    return buildImage(img, textArray, index);
                  },
                ),
              ),
              SizedBox(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 55,
                      width: 290,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(
                              0xFF43D999), // Set the background color here
                        ),
                        child: const Text(
                          'Let\'s Start',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: '',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 90,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 5,
                            bottom:
                                0, // Adjust the position of the text as needed
                            left: 0,
                            right: 0,
                            child: Container(
                              // Add a semi-transparent background to the text
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.center,
                              child: const Text(
                                'Tap the button to Learn new things in Farming',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontFamily: 'Nizzoli Alt',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildImage(String img, String text, int index) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            img,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              padding: const EdgeInsets.all(8),
              child: Text(
                text, // Use the 'text' parameter here
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
