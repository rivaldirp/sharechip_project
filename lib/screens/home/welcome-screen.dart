import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sharechip_project/screens/home/home-screen.dart';
import 'package:sharechip_project/screens/home/signin-screen.dart';
import 'package:sharechip_project/screens/home/signup-screen.dart';
import 'package:sharechip_project/services/firebase-services.dart';

class Wells extends StatelessWidget {
  const Wells({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 108,
            ),
            Image.asset(
              'assets/lowell.png',
              width: 207.53,
              height: 197,
            ),
            Text(
              "Welcome to Share Chip!",
              style: TextStyle(fontSize: 20, fontFamily: 'InterBold'),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              "We will help you.",
              style: TextStyle(fontSize: 13, fontFamily: 'InterRegular'),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(left: 41, right: 41),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    elevation: 0,
                    primary: Color(0xFFF5F5F5),
                    minimumSize: Size(10, 46)),
                onPressed: () async {
                  await FirebaseServices().signInWithGoogle();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/google.png",
                        height: 31,
                        width: 31,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Login with Gmail",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'InterRegular',
                            color: Color(0xFF01908E)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
