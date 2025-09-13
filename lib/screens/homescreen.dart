import 'package:flutter/material.dart';
import 'package:sih/screens/createreport.dart';
import 'package:sih/screens/myIssue.dart';
import 'package:sih/screens/notificationpage.dart';
import 'package:sih/screens/profilepage.dart';

// The main entry point for the Flutter application.
// void main() {
//   runApp(const CivicApp());
// }

// The root widget of the application.
class CivicApp extends StatelessWidget {
  const CivicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Civic Engagement App',
      // Theming the app with a dark theme to match the screenshot.
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
        scaffoldBackgroundColor: const Color(0xFF1A1A1A), // Dark background
        cardColor: const Color(0xFF2C2C2C), // Darker card color
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A1A1A),
          elevation: 0,
        ),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// The main HomePage widget which is stateful to manage the bottom navigation bar index.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // State for the currently selected tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    
    });
  if(_selectedIndex==0){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }
  else if(_selectedIndex==1){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>issuepage()));

  }
  else if(_selectedIndex==2){
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Createreport()));

  }
  else if(_selectedIndex==3){
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NotificationsPage()));

  }
  else if(_selectedIndex==4){
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProfilePage()));

  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The top AppBar with location and settings icon.
      appBar: AppBar(
        leadingWidth: 200, // Increased width to fit the location text
        leading: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Row(
            children: [
              Icon(Icons.location_on, color: Colors.white70),
              SizedBox(width: 8),
              Text(
                'Ashok Nagar, Delhi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // TODO: Implement settings functionality
            },
          ),
        ],
      ),
      // The main content of the screen.
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          // "Overview" Title
          const Text(
            'Overview',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),

          // Issue Cards Section
          const Row(
            children: [
              Expanded(
                child: IssueCard(
                  title: 'Open Issues',
                  count: 12,
                  color: Colors.red,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: IssueCard(
                  title: 'Resolved Issues',
                  count: 35,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // "News & Updates" Title
          const Text(
            'News & Updates',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),

          // Horizontal News List
          SizedBox(
            height: 250, // Fixed height for the horizontal list
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                NewsCard(
                  imageUrl: 'https://placehold.co/300x200/666/fff?text=New+Road',
                  title: 'नई सड़क निर्माण परियोजना को मंजूरी',
                  subtitle: 'New Road Construction Project Approved',
                ),
                SizedBox(width: 16),
                NewsCard(
                  imageUrl: 'https://placehold.co/300x200/555/fff?text=Govt+Launch',
                  title: 'सरकार ने स्वच्छ भारत मिशन लॉन्च किया',
                  subtitle: 'Government Launched Swachh Bharat',
                ),
              ],
            ),
          ),
        ],
      ),

      // // The large green floating action button.
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // TODO: Implement add issue functionality
      //   },
      //   backgroundColor: Colors.green,
      //   child: const Icon(Icons.add, color: Colors.white, size: 30),
      //   shape: const CircleBorder(),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      // The bottom navigation bar.
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'My Issues',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Report',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFF2C2C2C),
        type: BottomNavigationBarType.fixed, // Ensures background is always visible
        onTap: _onItemTapped,
      ),
    );
  }
}

// A reusable widget for the "Open Issues" and "Resolved Issues" cards.
class IssueCard extends StatelessWidget {
  final String title;
  final int count;
  final Color color;

  const IssueCard({
    Key? key,
    required this.title,
    required this.count,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 4,
            width: 30,
            color: color,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            count.toString(),
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

// A reusable widget for the news article cards.
class NewsCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const NewsCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220, // Fixed width for each news card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with rounded corners
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              // Error builder for when the image fails to load
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.grey[800],
                  child: const Icon(Icons.image_not_supported, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
