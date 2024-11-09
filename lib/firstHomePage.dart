import 'package:flutter/material.dart ';
class FirstHomePage extends StatelessWidget {
  const FirstHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Discover ideas',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            Text(
              'for your home',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {},
          ),
        ],
        leading: Icon(Icons.person, color: Colors.black),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Houzz',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          // Categories Section
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              padding: const EdgeInsets.all(8.0),
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SecondHome()),
                    // );
                  },
                  child: CategoryTile(
                    title: 'Browse Photos',
                    imageUrl: 'https://images.pexels.com/photos/1571460/pexels-photo-1571460.jpeg', // Use network image
                  ),
                ),
                CategoryTile(
                  title: 'Unique Loft Look',
                  imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGPY1I54G2M1ZEvLrYvmvkuXdjhIrI5l3DpQ&s'),
                CategoryTile(
                  title: 'Get the Industrial Loft Look',
                  imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDZIPam2V6j1zQ9NrcfgdsO9ENk1pRo2URlQ&s' ),
                CategoryTile(
                  title: 'Get the Industrial Loft Look',
                  imageUrl: 'data:image/jpeg;base64,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', // Use network image
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String title;
  final String imageUrl;

  CategoryTile({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(imageUrl), // Use NetworkImage
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [Colors.black54, Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}


