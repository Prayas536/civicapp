import 'package:flutter/material.dart';
// import 'package:sih/screens/homepage.dart';
import 'package:sih/screens/homescreen.dart';


// class Homepage extends StatelessWidget {
//   const Homepage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Community App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         fontFamily: 'Inter', // A nice, clean font. You can change this.
//       ),
//       home: const WelcomeScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive design
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[100], // Light grey background like in the image
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // --- IMAGE PLACEHOLDER ---
              // You can replace this Container with your actual image asset.
             Image.asset('assets/homescreen.png',
             height: screenHeight*0.4,
             width: double.infinity,
             fit: BoxFit.fitWidth,
             ),
              // Container(
              //   height: screenHeight * 0.3,
              //   // Using a simple placeholder icon.
              //   // Replace this with: Image.asset('assets/your_image.png'),
              //   child: const FlutterLogo(size: 150), // Example placeholder
              //   margin: const EdgeInsets.only(bottom: 40.0),
              // ),
              
              // --- HEADLINE TEXT ---
              SizedBox(height: 25,),
              const Text(
                'Report, Resolve, Rebuild',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50), // A dark slate color
                ),
              ),
              const SizedBox(height: 16),

              // --- SUBTITLE TEXT ---
              const Text(
                'Connect with your community and local government to address issues and improve your neighborhood.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.5, // Line spacing
                ),
              ),
              const SizedBox(height: 90),

              // --- SIGN UP BUTTON ---
              ElevatedButton(
                onPressed: () {
                  
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>CivicApp()));
                  // TODO: Implement Sign Up navigation/logic
                  print('Sign Up button pressed');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3498DB), // Blue color from image
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  elevation: 5,
                  shadowColor: Colors.black.withOpacity(0.2),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // --- LOG IN BUTTON ---
              TextButton(
                onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>CivicApp()));
                  // TODO: Implement Log In navigation/logic
                
                },
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF3498DB), // Blue color from image
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              
              const Spacer(), // Pushes the footer text to the bottom

              // --- FOOTER TEXT ---
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'By continuing, you agree to our Terms of Service and Privacy Policy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
