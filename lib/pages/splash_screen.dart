import 'package:flutter/material.dart';
import 'package:movies_db_app/pages/home_screen.dart';
import 'package:movies_db_app/utils/assets_strings.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({super.key});

  @override
  State<SpashScreen> createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen> {
  bool isLoading = true;
  Map breadsData = {};
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? HomeScreen(breadsData)
        : Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetString().cameraRolling,
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
