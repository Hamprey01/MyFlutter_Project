import 'package:flutter/material.dart';

import '../HomePage.dart';

class Tab2 extends StatelessWidget {
  const Tab2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2A2E3F).withOpacity(0.97),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Wrap(
                spacing: 16.0,
                alignment: WrapAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Use Navigator.pop to go back without specifying a new route
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                    child: const Text('Go Back'),
                  ),
                  buildButton(
                    context,
                    'assets/herbecide/bentazone.jpg',
                    'Bentazone',
                    'Herbicide Recommendation for Bensulfuron methyl:',
                    'Herbicide: Bentazone\n\n'
                        'Weeds Controlled: Perennial and annual sedges\n\n'
                        'Time of Application: weeds at 2 to10-leaf stage\n\n'
                        'Rate of Application: 2.0 L/ha\n\n'
                        'Reminders: Apply on saturated soil or reduce water to expose weeds. Spray volume is 500 L/ha.',
                  ),
                  buildButton(
                    context,
                    'assets/herbecide/Bispy.jpg',
                    'Bispyribac sodium',
                    'Herbicide Recommendation for Bispyribac sodium:',
                    'Herbicide: Bispyribac sodium\n\n'
                        'Weeds Controlled: Annual grasses except L. chinensis, sedges, and broadleaves\n\n'
                        'Time of Application: 20-35 DAS (Days After Seeding)\n\n'
                        'Rate of Application: 250 ml/ha\n\n'
                        'Reminders: Before spraying, drain excess water until the half part of target weeds appears. Re-irrigate within 1-3 days after spraying.',
                  ),
                  buildButton(
                    context,
                    'assets/herbecide/buta.jpg',
                    'Butachlor (emulsifiable concentrate with safener)',
                    'Herbicide Recommendation for Butachlor:',
                    'Herbicide: Butachlor (emulsifiable concentrate with safener)\n\n'
                        'Weeds Controlled: Grasses, sedges, and broadleaves\n\n'
                        'Time of Application: 2-5 DAS (Days After Seeding)\n\n'
                        'Rate of Application: 0.75-1.0 L/ha\n\n'
                        'Reminders: Apply on moist and puddled soil. Control water normally after applying without submerging seedlings; spray volume is 200 L/ha.',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton(
    BuildContext context,
    String imagePath,
    String buttonText,
    String alertTitle,
    String alertContent,
  ) {
    return Container(
      width: 400, // Adjust the width for the button's container
      height: 250,
      margin: const EdgeInsets.only(bottom: 20.0, top: 20.0),

      child: ElevatedButton(
        onPressed: () {
          // Show the alert box when the button is tapped
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(alertTitle),
                content: Text(alertContent),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'OK', // Define the text for the "OK" button
                    ),
                  ),
                ],
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero, // Remove padding
          backgroundColor: const Color.fromRGBO(
              67, 217, 153, 0.76), // Background color of the button
          elevation: 4.0, // Add shadow to the button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                16.0), // Set border radius to 0 for square corners
          ),
        ),
        child: Stack(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover, // Cover the entire button with the image
              width: double.infinity, // Make the image cover the full width
              height: 150, // Adjust the height of the image as needed
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 150.0), // Adjust the top padding
              child: Container(
                color: Colors.transparent, // Make the container transparent
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.all(8.0), // Add padding to the text
                    child: Text(
                      buttonText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15, // Adjust the font size
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nizzoli Alt',
                        color: Colors.white, // Text color of the button
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// children: [
//               buildButton(
//                 context,
//                 'assets/herbecide/bentazone.jpg',
//                 'Bentazone',
//                 'Herbicide Recommendation for Bensulfuron methyl:',
//                 'Herbicide: Bentazone\n\n'
//                     'Weeds Controlled: Perennial and annual sedges\n\n'
//                     'Time of Application: weeds at 2 to10-leaf stage\n\n'
//                     'Rate of Application: 2.0 L/ha\n\n'
//                     'Reminders: Apply on saturated soil or reduce water to expose weeds. Spray volume is 500 L/ha.',
//               ),
//               buildButton(
//                 context,
//                 'assets/herbecide/Bispy.jpg',
//                 'Bispyribac sodium',
//                 'Herbicide Recommendation for Bispyribac sodium:',
//                 'Herbicide: Bispyribac sodium\n\n'
//                     'Weeds Controlled: Annual grasses except L. chinensis, sedges, and broadleaves\n\n'
//                     'Time of Application: 20-35 DAS (Days After Seeding)\n\n'
//                     'Rate of Application: 250 ml/ha\n\n'
//                     'Reminders: Before spraying, drain excess water until the half part of target weeds appears. Re-irrigate within 1-3 days after spraying.',
//               ),
//               buildButton(
//                 context,
//                 'assets/herbecide/buta.jpg',
//                 'Butachlor (emulsifiable concentrate with safener)',
//                 'Herbicide Recommendation for Butachlor:',
//                 'Herbicide: Butachlor (emulsifiable concentrate with safener)\n\n'
//                     'Weeds Controlled: Grasses, sedges, and broadleaves\n\n'
//                     'Time of Application: 2-5 DAS (Days After Seeding)\n\n'
//                     'Rate of Application: 0.75-1.0 L/ha\n\n'
//                     'Reminders: Apply on moist and puddled soil. Control water normally after applying without submerging seedlings; spray volume is 200 L/ha.',
//               ),
//             ],