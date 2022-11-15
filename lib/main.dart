import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/home/welcome-screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ShareChip());
}

class ShareChip extends StatelessWidget {
  const ShareChip({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wells(),
      debugShowCheckedModeBanner: false,
    );
  }
}
