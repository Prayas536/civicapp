// import 'package.flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:sih/screens/createreport.dart';
import 'package:sih/screens/homescreen.dart';
import 'package:sih/screens/loginpage.dart';
import 'package:sih/screens/myIssue.dart';
import 'package:sih/screens/notificationpage.dart';
import 'package:sih/screens/profilepage.dart';

// A simple data model to represent an issue.
// In a real app, this would come from your database.
class Issue {
  final String title;
  final String date;
  final String imageUrl;

  const Issue({
    required this.title,
    required this.date,
    required this.imageUrl,
  });
}

// Mock data for the list.
// In a real app, you would fetch this data from Firestore.
final List<Issue> resolvedIssues = [
  Issue(
    title: 'Pothole on Main Street',
    date: 'Resolved on 15th May 2024',
    imageUrl: 'https://placehold.co/100x100/333/fff?text=Pothole',
  ),
  Issue(
    title: 'Streetlight not working',
    date: 'Resolved on 20th April 2024',
    imageUrl: 'https://placehold.co/100x100/444/fff?text=Light',
  ),
  Issue(
    title: 'Garbage pileup near park',
    date: 'Resolved on 5th March 2024',
    imageUrl: 'https://placehold.co/100x100/555/fff?text=Garbage',
  ),
  Issue(
    title: 'Water leakage in residential area',
    date: 'Resolved on 10th February 2024',
    imageUrl: 'https://placehold.co/100x100/666/fff?text=Water',
  ),
];


// Main entry point if you want to run this page as a standalone app.


// A wrapper for the app with the necessary dark theme.
class issuepage extends StatelessWidget {
  const issuepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resolved Issues',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A1A1A),
          elevation: 0,
        ),
        // Define a color for the cards if needed
        cardColor: const Color(0xFF2C2C2C),
      ),
      home: const ResolvedIssuesPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


// The main widget for the "Resolved Issues" screen.
class ResolvedIssuesPage extends StatefulWidget {
  const ResolvedIssuesPage({Key? key}) : super(key: key);

  @override
  State<ResolvedIssuesPage> createState() => _ResolvedIssuesPageState();
}

class _ResolvedIssuesPageState extends State<ResolvedIssuesPage> {
  // The index for the bottom navigation bar. 'My Requests' is the 1st index (0-based).
  int _selectedIndex = 1;

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
            // TODO: Implement navigation to the previous screen
            // For example: Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Resolved Issues',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: resolvedIssues.length,
        itemBuilder: (context, index) {
          final issue = resolvedIssues[index];
          // Each item in the list is an IssueListItem widget.
          return IssueListItem(issue: issue);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            activeIcon: Icon(Icons.list_alt_outlined),
            label: 'My Issues',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline, ),
             activeIcon: Icon(Icons.add_circle_outline, ),
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
        selectedItemColor: Colors.green, // Color for the selected item
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFF2C2C2C),
        type: BottomNavigationBarType.fixed, // Important for background color
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}

// A reusable widget for displaying a single issue in the list.
class IssueListItem extends StatelessWidget {
  final Issue issue;

  const IssueListItem({Key? key, required this.issue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            // The image on the left with rounded corners.
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                issue.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                 errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey[800],
                    child: const Icon(Icons.image_not_supported, color: Colors.grey),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            // The text column, expanded to take available space.
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    issue.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    issue.date,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // The arrow icon on the right.
            const Icon(
              Icons.chevron_right,
              color: Colors.white70,
            ),
          ],
        ),
      ),
    );
  }
}
