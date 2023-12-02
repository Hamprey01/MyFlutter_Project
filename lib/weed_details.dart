import 'package:flutter/material.dart';
import 'package:weedecide/model/weeds.dart'; // Import the Weed class

class WeedDetails extends StatelessWidget {
  final Weed weed;

  const WeedDetails({required Key key, required this.weed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(weed.weedName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                weed.image,
                height: 500,
                width: 500,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  'Scientific name: ${weed.weedName}',
                  style: const TextStyle(
                      fontSize: 24.0, fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Local name: ${weed.localName}',
                  style: const TextStyle(
                      fontSize: 22.0, fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  weed.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 20.0),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Herbicides Recommendation',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: weed.herbicides.length,
                itemBuilder: (context, index) {
                  Herbicide herbicide = weed.herbicides[index];
                  return ListTile(
                    title: Text(
                      herbicide.name,
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Weeds Controlled: ${herbicide.weedsControlled}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'Time of Application: ${herbicide.timeofApplication}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'Rate of Application:${herbicide.rateofApplication}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'Reminders: ${herbicide.reminders}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
