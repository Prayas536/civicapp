import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:sih/screens/createreport.dart';
import 'package:sih/screens/homescreen.dart';
import 'package:sih/screens/loginpage.dart';
import 'package:sih/screens/myIssue.dart';
import 'package:sih/screens/notificationpage.dart';
import 'package:sih/screens/profilepage.dart';

// Enum to represent the different types of notifications for styling.
enum NotificationType {
  acknowledged,
  resolved,
  alert,
  assigned,
  update,
}

// Data model for a single notification item.
class NotificationItem {
  final String title;
  final String message;
  final String timeAgo;
  final NotificationType type;
  final bool isUnread;

  const NotificationItem({
    required this.title,
    required this.message,
    required this.timeAgo,
    required this.type,
    this.isUnread = false,
  });
}

// Mock data list for notifications.
// In a real app, this would be fetched from a database like Firestore.
final List<NotificationItem> notifications = [
  const NotificationItem(
    title: 'Report Acknowledged',
    message: 'Your report on the pothole near the market has been acknowledged. We\'re on it!',
    timeAgo: '2d',
    type: NotificationType.acknowledged,
    isUnread: true,
  ),
  const NotificationItem(
    title: 'Issue Resolved',
    message: 'The street light issue on MG Road is now resolved. Thanks for your report!',
    timeAgo: '3d',
    type: NotificationType.resolved,
    isUnread: true,
  ),
  const NotificationItem(
    title: 'Community Alert',
    message: 'Alert: Road closure on Nehru Street due to maintenance. Please use alternative routes.',
    timeAgo: '1w',
    type: NotificationType.alert,
  ),
  const NotificationItem(
    title: 'Report Assigned',
    message: 'Your report on the overflowing garbage bin has been assigned to the sanitation team.',
    timeAgo: '2w',
    type: NotificationType.assigned,
  ),
  const NotificationItem(
    title: 'Repair Update',
    message: 'Update: The water leakage issue near the park is currently under repair. Expected completion: 3 days.',
    timeAgo: '3w',
    type: NotificationType.update,
  ),
];


// Main entry point for running this page as a standalone app.


// App wrapper with the required dark theme.
class Notificationpage extends StatelessWidget {
  const Notificationpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifications',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A1A1A),
          elevation: 0,
        ),
      ),
      home: const NotificationsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// The main widget for the Notifications screen.
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  // Index for the bottom navigation bar. 'Notifications' is the 3rd index.
  int _selectedIndex = 3;

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
        title: const Text(
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              // TODO: Implement settings functionality.
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // "Mark all as read" and "Clear all" buttons.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () { /* TODO */ },
                  child: const Text('Mark all as read', style: TextStyle(color: Colors.grey)),
                ),
                TextButton(
                  onPressed: () { /* TODO */ },
                  child: const Text('Clear all', style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
          ),
          // The list of notifications.
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return NotificationCard(item: notifications[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'My Issues',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            activeIcon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFF1A1A1A),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        onTap: _onItemTapped,
      ),
    );
  }
}

// A reusable widget for a single notification card.
class NotificationCard extends StatelessWidget {
  final NotificationItem item;

  const NotificationCard({Key? key, required this.item}) : super(key: key);

  // Helper method to get the right icon and color based on the notification type.
  Widget _getIcon() {
    IconData iconData;
    Color backgroundColor;

    switch (item.type) {
      case NotificationType.acknowledged:
        iconData = Icons.check_circle;
        backgroundColor = Colors.green;
        break;
      case NotificationType.resolved:
        iconData = Icons.lightbulb_circle;
        backgroundColor = Colors.lightGreen;
        break;
      case NotificationType.alert:
        iconData = Icons.warning;
        backgroundColor = Colors.orange;
        break;
      case NotificationType.assigned:
        iconData = Icons.assignment_turned_in;
        backgroundColor = Colors.blue;
        break;
      case NotificationType.update:
        iconData = Icons.build;
        backgroundColor = Colors.cyan;
        break;
    }

    return CircleAvatar(
      backgroundColor: backgroundColor.withOpacity(0.3),
      child: Icon(iconData, color: backgroundColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon with the unread indicator dot.
          Stack(
            clipBehavior: Clip.none,
            children: [
              _getIcon(),
              if (item.isUnread)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.lightGreenAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          // Title, message, and time.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.message,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Text(
            item.timeAgo,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
