import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sharechip_project/screens/home/home-screen.dart';
import 'package:sharechip_project/screens/home/welcome-screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData){
            return HomeScreen();
          }else if (snapshot.hasError){
            return Center(child: Text('Something Went Wrong!'),);
          } else {

        return Wells();
          }
      }
    ),
  );
}
