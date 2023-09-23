import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:weedecide/model/weeds.dart';
import 'package:weedecide/weed_Validation.dart';
// import 'package:weedecide/userInput.dart';

class ImageResult extends StatelessWidget {
  ImageResult({
    Key? key,
    required this.imagePath,
    required this.output,
    // required this.weed,
  });

  final String imagePath; // Change 'image' to 'imagePath'
  final List output;
  // final Weed weed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background/paddy.gif"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2A2E3F).withOpacity(
                  0.80), // Set your desired background color with opacity
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20.0),
                Container(
                  height: 700,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
                        top: 70,
                        child: Container(
                          height: 280,
                          width: 370,
                          decoration: BoxDecoration(
                            color: const Color(0xffF9FFF1),
                            borderRadius: BorderRadius.circular(
                                20), // Adjust the value as per your preference
                          ),
                          child: Stack(
                            children: <Widget>[
                              const Positioned(
                                top: 120,
                                left: 15,
                                child: Text(
                                  'The image identify as',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'Segoe UI',
                                    color: Color(0xff91B17D),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 135,
                                left: 15,
                                child: Text(
                                  '${output[0]['label']}',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'Segoe UI',
                                    color: Color(0xff4A603C),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              if (output[0]['label'] == 'Billy Goat')
                                const Positioned(
                                  top: 175,
                                  left: 15,
                                  child: SizedBox(
                                    height: 130,
                                    width: 340,
                                    child: Text(
                                      'Ageratum conyzoides (billygoat-weed, chick weed, goatweed, whiteweed, mentrasto) is native to Tropical America, especially Brazil, and is an invasive weed in many other regions. It is an herb that is 0.5–1 m. high, with ovate leaves 2–6 cm long, and flowers are white to mauve.',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontFamily: 'Segoe UI',
                                        color: Color(0xff91B17D),
                                      ),
                                    ),
                                  ),
                                ),
                              if (output[0]['label'] == 'Banyard Grass')
                                const Positioned(
                                  top: 175,
                                  left: 15,
                                  child: SizedBox(
                                    height: 130,
                                    width: 340,
                                    child: Text(
                                      'Echinochloa crus-galli is a type of wild grass originating from tropical Asia that was formerly classified as a type of panicum grass. It is commonly known as cockspur, barnyard millet, Japanese millet, water grass, common barnyard grass, or simply "barnyard grass".',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontFamily: 'Segoe UI',
                                        color: Color(0xff91B17D),
                                      ),
                                    ),
                                  ),
                                ),
                              if (output[0]['label'] == 'Cyanthillium')
                                const Positioned(
                                  top: 175,
                                  left: 15,
                                  child: SizedBox(
                                    height: 130,
                                    width: 340,
                                    child: Text(
                                      'Cyanthillium cinereum is a species of perennial plants in the sunflower family. The species is native to tropical Africa and to tropical Asia and has become naturalized in Australia, Mesoamerica, tropical South America, the West Indies, and the US State of Florida.',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontFamily: 'Segoe UI',
                                        color: Color(0xff91B17D),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffF9FFF1),

                            // Replace this with your desired color
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 180,
                                height: 180,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: ClipOval(
                                  child: Image.file(File(imagePath)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (output[0]['label'] == 'Billy Goat')
                        Positioned(
                          top: 360,
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 110,
                                width: 370,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      height: 60,
                                      width: 140,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF9FFF1),
                                        borderRadius: BorderRadius.circular(
                                            20), // Adjust the value as per your preference
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 10.0, top: 15.0),
                                            child: const Text(
                                              'Broadleaf',
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Segoe UI',
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff4A603C),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 25.0, top: 0.0),
                                            child: const Text(
                                              'Type Of Weed',
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                fontSize: 7,
                                                fontFamily: 'Segoe UI',
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff4A603C),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF9FFF1),
                                        borderRadius: BorderRadius.circular(
                                            20), // Adjust the value as per your preference
                                      ),
                                      height: 100,
                                      width: 210,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  right: 10.0, top: 15.0),
                                              height: 50,
                                              width: 150,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  billyGoat(context);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color(0xFF91B17D),
                                                  foregroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                ),
                                                child: const Text(
                                                  'Herbicide Recommendation',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize:
                                                        15.0, // Adjust text style as needed
                                                  ),
                                                ),
                                              )),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 29.0, top: 3.0),
                                            width: 100,
                                            child: const Text(
                                              'Click the button to show the recommendation',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 7,
                                                fontFamily: 'Segoe UI',
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff4A603C),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 15,
                                left: 0,
                                child: Image.asset(
                                  'assets/icon/flower.png',
                                  height: 60.0,
                                  width: 60.0,
                                ),
                              ),
                              Positioned(
                                top: 4,
                                right: 120,
                                child: Image.asset(
                                  'assets/icon/herbicide1.png',
                                  height: 90.0,
                                  width: 90.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (output[0]['label'] == 'Cyanthillium')
                        Positioned(
                          top: 360,
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 90,
                                width: 360,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      height: 60,
                                      width: 140,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF9FFF1),
                                        borderRadius: BorderRadius.circular(
                                            20), // Adjust the value as per your preference
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 10.0, top: 15.0),
                                            child: const Text(
                                              'Sedges',
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Segoe UI',
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff4A603C),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 25.0, top: 0.0),
                                            child: const Text(
                                              'Type Of Weed',
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                fontSize: 7,
                                                fontFamily: 'Segoe UI',
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff4A603C),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF9FFF1),
                                        borderRadius: BorderRadius.circular(
                                            20), // Adjust the value as per your preference
                                      ),
                                      height: 110,
                                      width: 210,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  right: 10.0, top: 15.0),
                                              height: 50,
                                              width: 150,
                                              child: ElevatedButton(
                                                onPressed: () =>
                                                    cyanthillium(context),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color(0xFF91B17D),
                                                  foregroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                ),
                                                child: const Text(
                                                  'Herbicide Recommendation',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                  ),
                                                ),
                                              )),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 29.0, top: 3.0),
                                            width: 100,
                                            child: const Text(
                                              'Click the button to show the recommendation',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 7,
                                                fontFamily: 'Segoe UI',
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff4A603C),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 15,
                                left: 0,
                                child: Image.asset(
                                  'assets/icon/flower.png',
                                  height: 60.0,
                                  width: 60.0,
                                ),
                              ),
                              Positioned(
                                top: 4,
                                right: 120,
                                child: Image.asset(
                                  'assets/icon/herbicide1.png',
                                  height: 90.0,
                                  width: 90.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (output[0]['label'] == 'Billy Goat')
                        Positioned(
                          top: 460,
                          child: SizedBox(
                            height: 120,
                            width: 370,
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 370,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        height: 75,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffF9FFF1),
                                          borderRadius: BorderRadius.circular(
                                              20), // Adjust the value as per your preference
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 20.0, top: 60.0),
                                              child: const Text(
                                                'Visayan Term',
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'Segoe UI',
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff4A603C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xffF9FFF1),
                                          borderRadius: BorderRadius.circular(
                                              20), // Adjust the value as per your preference
                                        ),
                                        height: 70,
                                        width: 260,
                                        child: const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Pega-Pega',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Segoe UI',
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff4A603C),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: -5,
                                  left: 5,
                                  child: Image.asset(
                                    'assets/icon/language.png',
                                    height: 90.0,
                                    width: 90.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (output[0]['label'] == 'Cyanthillium')
                        Positioned(
                          top: 460,
                          child: SizedBox(
                            height: 120,
                            width: 370,
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 370,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        height: 75,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffF9FFF1),
                                          borderRadius: BorderRadius.circular(
                                              20), // Adjust the value as per your preference
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 20.0, top: 60.0),
                                              child: const Text(
                                                'Visayan Term',
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'Segoe UI',
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff4A603C),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xffF9FFF1),
                                          borderRadius: BorderRadius.circular(
                                              20), // Adjust the value as per your preference
                                        ),
                                        height: 70,
                                        width: 260,
                                        child: const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Gubat',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Segoe UI',
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff4A603C),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: -5,
                                  left: 5,
                                  child: Image.asset(
                                    'assets/icon/language.png',
                                    height: 90.0,
                                    width: 90.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Positioned(
                        top: 580,
                        child: Container(
                          height: 110,
                          width: 370,
                          color: const Color(0xffF9FFF1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: const Text(
                                  'Is the identified picture is correct?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Segoe UI',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff4A603C),
                                  ),
                                ),
                              ),
                              Container(
                                width: 340,
                                margin: const EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                            height: 40,
                                            width: 160,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                // Add your action here when the button is pressed
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xFF9DBF87),
                                              ),
                                              child: const Text(
                                                'Yes',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontFamily: 'Segoe UI',
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                            height: 40,
                                            width: 160,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                _showAlertDialog(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xFF9DBF87),
                                              ),
                                              child: const Text(
                                                'No',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontFamily: 'Segoe UI',
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 590,
                        left: 315,
                        child: Image.asset(
                          'assets/icon/picture.png',
                          height: 70.0,
                          width: 70.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void billyGoat(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Billy Goat Herbicide Recommendation'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Herbicide Recommendation for Bensulfuron methyl:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Herbicide: Bensulfuron methyl\n\n'
              'Weeds Controlled: Broadleaves\n\n'
              'Time of Application: 4-8 DAS (Days After Seeding)\n\n'
              'Rate of Application: 500-700 g/ha\n\n'
              'Reminders: Works best with standing water that should be retained for at least 4 days. Spray volume is 80-160 L/ha.',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}

void cyanthillium(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Cyanthillium Herbicide Recommendation'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            Text(
              'Herbicide Recommendation for Bensulfuron methyl:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Herbicide: Bentazone\n\n'
              'Weeds Controlled: Perennial and annual sedges\n\n'
              'Time of Application: weeds at 2 to 10-leaf stage\n\n'
              'Rate of Application: 2.0 L/ha\n\n'
              'Reminders: Apply on saturated soil or reduce water to expose weeds. Spray volume is 500 L/ha.',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}

void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Alert"),
        content:
            const Text("Do you want us to give information about that weed?"),
        actions: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WeedValidation()),
                  );
                },
                child: const Text('Yes'),
              ),
              const SizedBox(width: 16), // Add some spacing between the buttons
              ElevatedButton(
                onPressed: () {
                  // Handle 'No' button tap
                  Navigator.of(context).pop(); // Close the alert dialog
                  // Add your code for 'No' action here
                },
                child: const Text('No'),
              ),
            ],
          ),
        ],
      );
    },
  );
}
