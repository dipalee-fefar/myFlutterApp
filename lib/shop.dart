import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiscoverProductsPage(),
    );
  }
}

class DiscoverProductsPage extends StatefulWidget {
  @override
  _DiscoverProductsPageState createState() => _DiscoverProductsPageState();
}

class _DiscoverProductsPageState extends State<DiscoverProductsPage> {
  final List<Category> _categories = [
    Category('Living', Icons.weekend, Colors.grey , Image.asset('livingRoom.jpeg')),
    Category('Bedroom', Icons.bed, Colors.blueGrey,Image.asset('bedroom.jpeg')),
    Category('Kitchen & Dining', Icons.kitchen, Colors.orange,Image.asset('kitchain..jpeg')),
    Category('Bathroom', Icons.bathtub, Colors.lightBlue,Image.asset('bathroom.jpeg')),
    Category('Furniture', Icons.chair, Colors.brown,Image.asset('furniture.jpg')),
    Category('Home Decor', Icons.home, Colors.indigo,Image.asset('homeDecor.jpeg')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search Houzz',
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              // Handle cart button press
            },
          ),
        ],
        leading: Icon(Icons.person, color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Just Landed Banner
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.pink[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "image(4).jpg", // Replace with your image asset
                      width: 80,
                      height: 80,
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'JUST LANDED',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 4),
                        ElevatedButton(
                          onPressed: () {
                            // Handle Shop Now button press
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green, // Button background color
                          ),
                          child: Text('Shop Now'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Shop by Category Grid
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'SHOP BY CATEGORY',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 2 / 1.5,
                ),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(category: _categories[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Category {
  final String name;
  final IconData icon;
  final Color color;
  final Image image;

  Category(this.name, this.icon, this.color, this.image);
}

class CategoryTile extends StatelessWidget {
  final Category category;

  CategoryTile({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(children:[category.image, Icon(
              category.icon,
              size: 40,
              color: category.color,
            ),],
          ),
          SizedBox(height: 8),
          Text(
            category.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
