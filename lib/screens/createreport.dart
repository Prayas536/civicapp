import 'package:flutter/material.dart';
import 'package:sih/screens/homescreen.dart';
import 'package:sih/screens/loginpage.dart';
import 'package:sih/screens/myIssue.dart';
import 'package:sih/screens/notificationpage.dart';
import 'package:sih/screens/profilepage.dart';

// A simple data model for the issue categories.
class IssueCategory {
  final String name;
  final String placeholderText;

  const IssueCategory({required this.name, required this.placeholderText});
}

// The list of all categories to be displayed on the grid.
// In a real app, this might come from a configuration file or an API.
final List<IssueCategory> categories = [
  const IssueCategory(name: 'कचरा (Garbage)', placeholderText: 'Garbage'),
  const IssueCategory(name: 'गड्ढे (Potholes)', placeholderText: 'Potholes'),
  const IssueCategory(name: 'स्ट्रीट लाइट (Streetlight)', placeholderText: 'Streetlight'),
  const IssueCategory(name: 'पानी का रिसाव (Water Leak)', placeholderText: 'Water Leak'),
  const IssueCategory(name: 'जल निकासी (Sewage)', placeholderText: 'Sewage'),
  const IssueCategory(name: 'यातायात (Traffic)', placeholderText: 'Traffic'),
  const IssueCategory(name: 'पार्किंग (Parking)', placeholderText: 'Parking'),
  const IssueCategory(name: 'शोर (Noise)', placeholderText: 'Noise'),
  const IssueCategory(name: 'वायु प्रदूषण (Air Pollution)', placeholderText: 'Air Pollution'),
  const IssueCategory(name: 'अन्य (Other)', placeholderText: 'Other'),
];

// Main entry point for running this page as a standalone app for testing.

// App wrapper with the required dark theme.
class Createreport extends StatelessWidget {
  const Createreport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Report an Issue',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A1A1A),
          elevation: 0,
        ),
      ),
      home: const ReportIssuePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// The main widget for the "Report an Issue" screen.
class ReportIssuePage extends StatefulWidget {
  const ReportIssuePage({Key? key}) : super(key: key);

  @override
  State<ReportIssuePage> createState() => _ReportIssuePageState();
}

class _ReportIssuePageState extends State<ReportIssuePage> {
  // Index for the bottom navigation bar. 'Report' is the 2nd index.
  int _selectedIndex = 2;

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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // TODO: Navigate to the previous screen
            // Example: Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Report an Issue',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Select a Category',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            // A responsive grid for the categories.
            GridView.builder(
              shrinkWrap: true, // Important for GridView inside a Column
              physics: const NeverScrollableScrollPhysics(), // Disables grid's own scrolling
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns
                crossAxisSpacing: 16, // Horizontal spacing
                mainAxisSpacing: 16, // Vertical spacing
                childAspectRatio: 0.85, // Adjust the aspect ratio of the cards
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryCard(category: category);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            activeIcon: Icon(Icons.list_alt_outlined),
            label: 'My Issues',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline, color: Colors.green,), // Custom selected icon
            activeIcon: Icon(Icons.add_task, color: Colors.green, ), // Custom icon
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            activeIcon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFF1A1A1A),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        onTap: _onItemTapped,
      ),
    );
  }
}

// A reusable widget for the category cards in the grid.
class CategoryCard extends StatelessWidget {
  final IssueCategory category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Handle category selection
        print('${category.name} selected');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // The placeholder image container with rounded corners.
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: const Color(0xFF2C2C2C), // A dark background for the placeholder
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  'https://placehold.co/200x250/2c2c2c/ffffff?text=${category.placeholderText}',
                  fit: BoxFit.cover,
                  // Shows a simple container on error.
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                       decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: const Color(0xFF2C2C2C),
                      ),
                      child: Center(
                        child: Text(
                          category.placeholderText,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white54),
                        )
                      )
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // The category title text.
          Text(
            category.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
