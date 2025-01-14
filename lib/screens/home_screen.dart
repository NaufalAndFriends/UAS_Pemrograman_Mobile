import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HotelScreen(),
    );
  }
}

class HotelScreen extends StatelessWidget {
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
              "Current location",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.blue, size: 16),
                Text(
                  "Jepara, Indonesia",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            // TabBar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryTab("Hotel", true),
                _buildCategoryTab("Homestay", false),
                _buildCategoryTab("Apartemen", false),
              ],
            ),
            SizedBox(height: 16),

            // Section: Near Location
            SectionHeader(title: "Near Location", actionText: "See All"),
            SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildHotelCard(
                    imageUrl: 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/67723625-2592x1944-FIT_AND_TRIM-b4483650952ed3f28b28e28a0f792a62.jpeg?_src=imagekit&tr=c-at_max,f-jpg,fo-auto,h-332,pr-true,q-80,w-480',
                    name: "Hotel Kencana",
                    location: "Jl. Pemuda No.16A, Panggang III, Panggang, Kec. Jepara, Kabupaten Jepara, Jawa Tengah 59411",
                    price: "250K/Malam",
                    rating: 5.0,
                    isFavorite: true,
                  ),
                  SizedBox(width: 16),
                  _buildHotelCard(
                    imageUrl: 'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/10003209-1000x550-FIT_AND_TRIM-8283f6a330555a359743da58d6385914.jpeg?_src=imagekit&tr=c-at_max,f-jpg,h-360,pr-true,q-80,w-640',
                    name: "Hotel Jepara Indah",
                    location: "Jl. HOS. Cokroaminoto No.12, Kauman, Kec. Jepara, Kabupaten Jepara, Jawa Tengah 59417",
                    price: "300K",
                    rating: 4.7,
                    isFavorite: false,
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Section: Popular Hotel
            SectionHeader(title: "Popular Hotel", actionText: "See All"),
            SizedBox(height: 8),
            _buildHotelCard(
              imageUrl: 'https://syailendra-hotel-jepara.hotelmix.id/data/Photos/1080x700/1510/151097/151097164/Syailendra-Hotel-Syariah-Jepara-Exterior.JPEG',
              name: "Hotel Syailendra Jepara",
              location: " Jl. HOS. Cokroaminoto No.27, Kauman, Kec. Jepara, Kabupaten Jepara, Jawa Tengah 59417",
              price: "\Rp300K/Malam",
              rating: 5.0,
              isFavorite: false,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {},
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildCategoryTab(String title, bool isSelected) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget _buildHotelCard({
    required String imageUrl,
    required String name,
    required String location,
    required String price,
    required double rating,
    required bool isFavorite,
  }) {
    return Container(
      width: 250,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.network(imageUrl, height: 150, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(location, style: TextStyle(color: Colors.grey, fontSize: 12)),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(price, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 16),
                          Text("$rating"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;

  const SectionHeader({required this.title, required this.actionText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        GestureDetector(
          onTap: () {},
          child: Text(actionText, style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}
