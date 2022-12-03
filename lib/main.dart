import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharechip_project/google-signin.dart';
import 'package:sharechip_project/screens/home/home-screen.dart';
import 'package:sharechip_project/screens/home/notif-screen.dart';
import 'screens/home/welcome-screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ShareChip());
}

class ShareChip extends StatelessWidget {
  const ShareChip({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
    child: MaterialApp (
      home: HomePage(),
      debugShowCheckedModeBanner: false,),
  );
}
