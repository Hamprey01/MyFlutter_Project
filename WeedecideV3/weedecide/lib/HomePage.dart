import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:weedecide/imageResult/ImageResult.dart';
import 'package:weedecide/persistence%20Navigation%20Bar/herbecide.dart';
import 'package:weedecide/weed.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weedecide/model/weeds.dart'; // Import the Weed class

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final picker = ImagePicker();
  late XFile _image;
  late List _output;
  late final Weed weed;

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  classifyImage(String imagePath) async {
    var output = await Tflite.runModelOnImage(
      path: imagePath, // Use the provided imagePath
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      _output = output!;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageResult(
            imagePath: imagePath, // Pass the imagePath to ImageResult
            output: _output,
          ),
        ),
      );
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt');
  }

  pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;

    setState(() {
      _image = XFile(image.path);
    });

    classifyImage(image.path);
  }

  pickGalleryImage() async {
    final XFile? image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (image == null) return null;

    setState(() {
      _image = XFile(image.path);
    });

    classifyImage(image.path); // Pass the image path to classifyImage
  }

  final List<String> imgList = [
    'assets/background/bg1.jpg',
    'assets/background/bg4.gif',
    'assets/background/bg3.jpg',
  ];

  final List<Gradient> gradients = [
    const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(149, 149, 149, 0.76), // First color with 76% opacity
        Color.fromRGBO(42, 46, 63, 0.76), // Second color with 76% opacity
      ],
    ),
    const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(42, 46, 63, 0.76), // First color with 76% opacity
        Color.fromRGBO(42, 46, 63, 0.76), // Second color with 76% opacity
      ],
    ),
    const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(67, 217, 153, 0.76), // First color with 76% opacity
        Color.fromRGBO(42, 46, 63, 0.76), // Second color with 76% opacity
      ],
    ),
  ];

  final List<Color> borderColors = [
    const Color(0xffE8C99B), // Border color for the first image
    const Color.fromRGBO(42, 46, 63, 0.76), // Border color for the second image
    const Color(0xff43D999), // Border color for the third image
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background/paddy.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2A2E3F).withOpacity(
                0.94), // Set your desired background color with opacity
          ),
          child: Column(children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Row(children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Stack(
                    children: [
                      Image.asset('assets/icon/logov3.png'),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Good Boy',
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'W',
                            style: TextStyle(color: Color(0xff43D999))),
                        TextSpan(
                            text: 'ee', style: TextStyle(color: Colors.white)),
                        TextSpan(
                            text: 'D',
                            style: TextStyle(color: Color(0xffE8C99B))),
                        TextSpan(
                            text: 'ecide',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 650,
              width: double.infinity,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  viewportFraction: .9,
                  height: 600,
                  autoPlay: false,
                ),
                itemCount: imgList.length,
                itemBuilder: (context, index, real) {
                  final img = imgList[index];
                  final gradient = gradients[index];
                  final borderColor = borderColors[index];

                  if (index == 0) {
                    // Add two buttons to the first image
                    return buildImageWithGradient(context, img, gradient,
                        borderColor, pickGalleryImage, pickImage);
                  } else if (index == 1) {
                    // Add one button to the second and third images
                    return buildImageeeWithGradient(
                        context, img, gradient, borderColor);
                  } else {
                    return buildImageeWithGradient(
                        context, img, gradient, borderColor);
                  }
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget buildImageWithGradient(BuildContext context, img, Gradient gradient,
    Color borderColor, Function() pickGalleryImage, Function() pickImage) {
  return Stack(
    children: [
      Container(
        height: 600, // Set the height to match the CarouselSlider
        width: 400, // Set the desired width
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 7), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0), // Set the border radius
          child: Image.asset(
            img,
            fit: BoxFit.cover, // Maintain aspect ratio and cover the height
          ),
        ),
      ),
      Container(
        height: 600, // Set the height to match the CarouselSlider
        width: 400, // Set the same width as the image
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(16.0),
          // Set the border radius
          border: Border.all(color: borderColor, width: 0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center, // Align to the left side
              child: Container(
                margin: const EdgeInsets.only(
                  left: 13,
                  right: 13,
                ), // Add margin to the left side
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // Align text to the left
                  children: [
                    SizedBox(height: 8), // Add spacing between words
                    Center(
                      child: Text(
                        'DISCLAIMER: The weed classification feature can only identify five weed species on an irrigated ricefield. It will be improved in succeeding versions',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Nizzoli Alt',
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 200),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center, // Align to the left side
              child: Container(
                margin: const EdgeInsets.only(
                  left: 13,
                  right: 13,
                ), // Add margin to the left side
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // Align text to the left
                  children: [
                    Text(
                      'DETECT',
                      style: TextStyle(
                        color: Color.fromARGB(255, 94, 207, 255),
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5,
                      ),
                    ),
                    SizedBox(height: 8), // Add spacing between words
                    Text(
                      'Lets start with camera to capture weeds',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Nizzoli Alt',
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 8), // Add spacing between words
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16), // Adjust spacing as needed
            Container(
              height: 55,
              width: 250, // Set the desired width for the button
              margin: const EdgeInsets.symmetric(
                  vertical: 0, horizontal: 20), // Set the desired margin
              child: ElevatedButton(
                onPressed: pickGalleryImage,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xffE8C99B)
                      .withOpacity(0.5), // Background color with 50% opacity
                  padding: const EdgeInsets.all(16.0), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        50), // Button border radius set to 50
                    side: const BorderSide(
                      color: Color(0xffE8C99B), // Border color
                      width: .3, // Border width
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icon/archive.png', // Replace with the path to your asset image
                      height: 50, // Set the desired height for the image
                      width: 50, // Set the desired width for the image
                      // Set the color of the image
                    ),
                    const SizedBox(
                        width:
                            8), // Adjust the space between the image and text
                    const Text(
                      'Files',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Nizzoli Alt',
                        letterSpacing: 5.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              height: 55,
              width: 250, // Set the desired width for the button
              margin: const EdgeInsets.symmetric(
                  vertical: 20, horizontal: 20), // Set the desired margin
              child: ElevatedButton(
                onPressed: pickImage,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xffE8C99B)
                      .withOpacity(0.5), // Background color with 50% opacity
                  padding: const EdgeInsets.all(16.0), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        50), // Button border radius set to 50
                    side: const BorderSide(
                      color: Color(0xffE8C99B), // Border color
                      width: 0.3, // Border width
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icon/camera.png', // Replace with the path to your asset image
                      height: 50, // Set the desired height for the image
                      width: 50, // Set the desired width for the image
                      // Set the color of the image
                    ),
                    const SizedBox(
                        width:
                            8), // Adjust the space between the image and text
                    const Text(
                      'Camera',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Nizzoli Alt',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildImageeeWithGradient(
    BuildContext context, img, Gradient gradient, Color borderColor) {
  return Stack(
    children: [
      Container(
        height: 600, // Set the height to match the CarouselSlider
        width: 400, // Set the desired width
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 10), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0), // Set the border radius
          child: Image.asset(
            img,
            fit: BoxFit.cover, // Maintain aspect ratio and cover the height
          ),
        ),
      ),
      Container(
        height: 600, // Set the height to match the CarouselSlider
        width: 400, // Set the same width as the image
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(16.0), // Set the border radius
          border: Border.all(color: borderColor, width: 1.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.center, // Align to the left side
              child: Container(
                margin: const EdgeInsets.only(
                  left: 16,
                ), // Add margin to the left side
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // Align text to the left
                  children: [
                    Text(
                      'HERBICIDE',
                      style: TextStyle(
                        color: Color(0xffFDCD56),
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5,
                      ),
                    ),
                    SizedBox(height: 8), // Add spacing between words
                    Text(
                      'Get to know more about the herbicide',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Nizzoli Alt',
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16), // Adjust spacing as needed
            Container(
              height: 55,
              width: 250, // Set the desired width for the button
              margin: const EdgeInsets.symmetric(
                  vertical: 55, horizontal: 20), // Set the desired margin
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Herbecide()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xff2A2E3F)
                      .withOpacity(0.5), // Background color with 50% opacity
                  padding: const EdgeInsets.all(16.0), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        50), // Button border radius set to 50
                    side: const BorderSide(
                      color: Color(0xff2A2E3F), // Border color
                      width: 0.3, // Border width
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icon/herbicide.png', // Replace with the path to your asset image
                      height: 50, // Set the desired height for the image
                      width: 50, // Set the desired width for the image
                      // Set the color of the image
                    ),
                    const SizedBox(
                        width:
                            8), // Adjust the space between the image and text
                    const Text(
                      'View',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Nizzoli Alt',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildImageeWithGradient(
    BuildContext context, img, Gradient gradient, Color borderColor) {
  return Stack(
    children: [
      Container(
        height: 600, // Set the height to match the CarouselSlider
        width: 400, // Set the desired width
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 7), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0), // Set the border radius
          child: Image.asset(
            img,
            fit: BoxFit.cover, // Maintain aspect ratio and cover the height
          ),
        ),
      ),
      Container(
        height: 600, // Set the height to match the CarouselSlider
        width: 400, // Set the same width as the image
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(16.0), // Set the border radius
          border: Border.all(color: borderColor, width: 1.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.center, // Align to the left side
              child: Container(
                margin: const EdgeInsets.only(
                  left: 16,
                ), // Add margin to the left side
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // Align text to the left
                  children: [
                    Text(
                      'WEEDS',
                      style: TextStyle(
                        color: Color(0xffA8E580),
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5,
                      ),
                    ),
                    SizedBox(height: 8), // Add spacing between words
                    Text(
                      'Let us Start to know the weed plant',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Nizzoli Alt',
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16), // Adjust spacing as needed
            Container(
              height: 55,
              width: 250, // Set the desired width for the button
              margin: const EdgeInsets.symmetric(
                  vertical: 55, horizontal: 20), // Set the desired margin
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WeedPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xff43D999)
                      .withOpacity(0.5), // Background color with 50% opacity
                  padding: const EdgeInsets.all(16.0), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        50), // Button border radius set to 50
                    side: const BorderSide(
                      color: Color(0xff43D999), // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icon/grass.png', // Replace with the path to your asset image
                      height: 50, // Set the desired height for the image
                      width: 50, // Set the desired width for the image
                      // Set the color of the image
                    ),
                    const SizedBox(
                        width:
                            8), // Adjust the space between the image and text
                    const Text(
                      'View',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Nizzoli Alt',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
