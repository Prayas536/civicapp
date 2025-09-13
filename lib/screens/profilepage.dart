import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:sih/screens/createreport.dart';
import 'package:sih/screens/homescreen.dart';
import 'package:sih/screens/loginpage.dart';
import 'package:sih/screens/myIssue.dart';
import 'package:sih/screens/notificationpage.dart';
import 'package:sih/screens/profilepage.dart';

// Main entry point for running this page as a standalone app for testing.


// App wrapper with the required dark theme.
class Profilepage extends StatelessWidget {
   Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212), // A slightly deeper black
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121212),
          elevation: 0,
        ),
        // Define a color for the cards and other elements
        cardColor: const Color(0xFF1E1E1E),
        iconTheme: const IconThemeData(color: Colors.white70),
      ),
      home: const ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// The main widget for the Profile screen.
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Index for the bottom navigation bar. 'Profile' is the 4th index.
  int _selectedIndex = 4;
  bool _languageSwitchValue = false;

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
            // TODO: Navigate back
          },
        ),
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          children: [
            // Profile Picture
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://placehold.co/150x150/FFF/333?text=AS'),
              backgroundColor: Colors.grey,
            ),
            const SizedBox(height: 16),
            // User Name
            const Text(
              'Arjun Sharma',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 4),
            // User Email
            const Text(
              'arjun.sharma@email.com',
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 32),

            // Info Cards Section
            _buildInfoCard(Icons.phone_outlined, 'Phone Number', '+91 9876543210'),
            const SizedBox(height: 12),
            _buildInfoCard(Icons.email_outlined, 'Email', 'arjun.sharma@email.com'),
            const SizedBox(height: 12),
            _buildInfoCard(Icons.location_on_outlined, 'Default Area', '400001'),
            const SizedBox(height: 16),

            // Diamond Credits Card
            _buildCreditsCard(),
            const SizedBox(height: 16),

            // Local Language Support
            _buildLanguageSupportCard(),
            const SizedBox(height: 32),

            // Logout Button
            OutlinedButton.icon(
              onPressed: () {
                // TODO: Handle logout
              },
              icon: const Icon(Icons.logout, color: Colors.redAccent),
              label: const Text(
                'Logout',
                style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.redAccent.withOpacity(0.5)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined), label: 'My Issues'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: 'Report'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_outlined), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFF1E1E1E),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }

  // A reusable widget for the simple info cards (Phone, Email, Area).
  Widget _buildInfoCard(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 2),
              Text(subtitle, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }

  // A specific widget for the Diamond Credits card.
  Widget _buildCreditsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.star, color: Colors.yellow, size: 24),
              const SizedBox(width: 12),
              const Text('Diamond Credits', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              const Spacer(),
              const Text('120', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Earn credits by submitting verified civic issue reports and become a "Good Citizen" in your community.',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }

  // A widget for the language support toggle.
  Widget _buildLanguageSupportCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.language, size: 24),
          const SizedBox(width: 16),
          const Text('Local Language Support', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
          const Spacer(),
          Switch(
            value: _languageSwitchValue,
            onChanged: (value) {
              setState(() {
                _languageSwitchValue = value;
              });
            },
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
