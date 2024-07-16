import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otomotifzal/feature/home_page.dart';
import 'package:otomotifzal/utils/images_string.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  SplashScreenPageState createState() => SplashScreenPageState();
}

class SplashScreenPageState extends State<SplashScreenPage> {

  @override
  void initState() {
    super.initState();
    // Simulate initialization delay with Future.delayed
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to Home Screen after initialization
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(ImagesString.icLogo),
            const SizedBox(height: 40),
            const CircularProgressIndicator()
          ],
        ), // Placeholder for loading indicator
      ),
    );
  }
}