import 'package:flutter/material.dart';

class SecondHome extends StatefulWidget {
  @override
  State<SecondHome> createState() => _SecondHomeState();
}

class _SecondHomeState extends State<SecondHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BrowsePhotosPage(),
    );
  }
}

class BrowsePhotosPage extends StatefulWidget {
  @override
  _BrowsePhotosPageState createState() => _BrowsePhotosPageState();
}

class _BrowsePhotosPageState extends State<BrowsePhotosPage> {
  List<String> _photos = List.generate(6, (index) => 'assets/photo_$index.jpg'); // Sample photo paths
  String _selectedFilter = 'All';
  String _searchQuery = '';

  void _onFilterChanged(String filter) {
    setState(() {
      _selectedFilter = filter;
      // Update photos list based on the selected filter
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
      // Update photos list based on the search query
    });
  }

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
              'Browse and save photos',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigates back to the previous screen (HomePage)
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: _onSearchChanged,
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
                IconButton(
                  icon: Icon(Icons.filter_alt),
                  onPressed: () {
                    // Action for filter
                  },
                ),
              ],
            ),
          ),
          // Filter Options
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterButton(
                  label: 'Filter',
                  isSelected: _selectedFilter == 'Filter',
                  onTap: () => _onFilterChanged('Filter'),
                ),
                FilterButton(
                  label: 'Room',
                  isSelected: _selectedFilter == 'Room',
                  onTap: () => _onFilterChanged('Room'),
                ),
                FilterButton(
                  label: 'Style',
                  isSelected: _selectedFilter == 'Style',
                  onTap: () => _onFilterChanged('Style'),
                ),
                FilterButton(
                  label: 'Area',
                  isSelected: _selectedFilter == 'Area',
                  onTap: () => _onFilterChanged('Area'),
                ),

              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Image.asset('design10.jpeg', height: 400,width: 600,),
                Image.asset('design10.jpeg', height: 400,width: 600,),
                // Image.asset('design10.jpeg', height: 400,width: 600,),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),

          // Grid of Photos
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: _photos.length, // Dynamic number of photos
                itemBuilder: (context, index) {
                  return PhotoTile(imagePath: _photos[index]); // Replace with actual image paths
                },
              ),
            ),
          ),


        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  FilterButton({required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : Colors.black,
        backgroundColor: isSelected ? Colors.green : Colors.grey[300],
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(label),
    );
  }
}

class PhotoTile extends StatelessWidget {
  final String imagePath;
  PhotoTile({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
