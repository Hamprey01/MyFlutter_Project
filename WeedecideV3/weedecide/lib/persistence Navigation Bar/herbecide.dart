import 'package:flutter/material.dart';

import '../herbicideList/Tab1.dart';
import '../herbicideList/Tab2.dart';
import '../herbicideList/Tab3.dart';

class Herbecide extends StatefulWidget {
  const Herbecide({super.key});

  @override
  _HerbecideState createState() => _HerbecideState();
}

class _HerbecideState extends State<Herbecide>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController =
        TabController(length: 3, vsync: this); // Update the length to 3
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A2E3F).withOpacity(0.97),
      appBar: AppBar(
        title: const Text('herbicide recommendation'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const SizedBox(height: 50),
              Container(
                // height: 50,
                width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: const Color(0xFF2A2E3F).withOpacity(0.97),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TabBar(
                        unselectedLabelColor: Colors.white,
                        labelColor: Colors.white,
                        indicatorColor: Colors.white,
                        indicatorWeight: 2,
                        indicator: BoxDecoration(
                          color: const Color(0xff43D999),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        controller: tabController,
                        tabs: const [
                          Tab(
                            text: 'BroadLeaf',
                          ),
                          Tab(
                            text: 'Sedges', // Change from 'Tab 1' to 'Tab 2'
                          ),
                          Tab(
                            text: 'Grasses',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    Tab1(),
                    Tab2(),
                    Tab3(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
