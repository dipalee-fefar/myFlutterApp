import 'package:flutter/material.dart';
import 'package:my_interior_app/firstHomePage.dart';
import 'package:my_interior_app/secondPage.dart';
import 'package:my_interior_app/shop.dart';

import 'morePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // Set the StatefulWidget here
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Widget> widgetList = [
    FirstHomePage(),
    SecondHome(),
    ShopPage(),
    // SecondHome(),
    MorePage()
  ];

  int currentInd = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetList[currentInd],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Photos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.work),
          //   label: 'Find a Pro',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
        onTap: (value) {
          setState(() {
            currentInd = value;
          });
        },
        currentIndex: currentInd,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}