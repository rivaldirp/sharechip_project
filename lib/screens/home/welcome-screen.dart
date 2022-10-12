import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sharechip_project/screens/home/signin-screen.dart';

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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  elevation: 0,
                  primary: Color(0xFF01908E),
                  minimumSize: Size(183, 36)),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
              },
              child: Text(
                "Sign In",
                style: TextStyle(fontSize: 15, fontFamily: 'InterRegular'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  elevation: 0,
                  primary: Color(0xFF01908E),
                  minimumSize: Size(183, 36)),
              onPressed: () {},
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 15, fontFamily: 'InterRegular'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
