import 'package:flutter/material.dart';

class MorePage extends StatefulWidget {
  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interior Design',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tell us what you like'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: DesignSelectionScreen(),
      ),
    );
  }
}

class DesignSelectionScreen extends StatelessWidget {
  final List<String> designImages = [
    'design1.jpeg',
    'design2.jpeg',
    'design3.jpeg',
    'design4.jpeg',
    'design5.jpeg',
    'design6.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Your choice is our First choice',
            style: TextStyle(fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, // Two images per row
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: designImages.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  designImages[index], // Replace with your actual image paths
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ElevatedButton(
            onPressed: () {
              // Action when "See proposals" button is pressed
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50), backgroundColor: Colors.white54,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: Text('Make your dream place'),
          ),
        ),
      ],
    );
  }
}
