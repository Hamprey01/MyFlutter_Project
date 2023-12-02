import 'package:flutter/material.dart';
import 'package:weedecide/model/weeds.dart';
import 'package:weedecide/weed_details.dart';

class WeedPage extends StatelessWidget {
  const WeedPage({super.key});

  // Provide a default value for hideAppBar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Set app bar color to green
        title: const Text('Weed List'),
      ),
      body: ListView.builder(
        itemCount: weedList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: ClipRRect(
              // To make the image round, wrap it in ClipRRect
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                weedList[index].image,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(weedList[index].weedName),
            subtitle: Text(weedList[index].localName),
            trailing: const Icon(
                Icons.arrow_forward), // Add an arrow icon to the design
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WeedDetails(
                    key: UniqueKey(), // Provide a unique key
                    weed: weedList[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
