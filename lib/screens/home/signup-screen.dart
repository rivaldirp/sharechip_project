import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sharechip_project/screens/home/home-screen.dart';
import 'package:sharechip_project/screens/home/welcome-screen.dart';

import '../../reusable-widget.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 29, top: 39),
              child: InkWell(
                onTap: (() => Navigator.of(context).pop(true)),
                child: Container(
                  width: 40,
                  height: 50,
                  child: Image.asset(
                    'assets/back.png',
                    width: 8.75,
                    height: 17.5,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Hello!",
                style: TextStyle(fontSize: 20, fontFamily: 'InterBold'),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Sign up for free.",
                style: TextStyle(fontSize: 13, fontFamily: 'InterRegular'),
              ),
            ),
            SizedBox(
              height: 21,
            ),
            Container(
              padding: EdgeInsets.only(left: 21, right: 21),
              child: reusableTextField("Username", Icons.person_outline, false,
                  _emailTextController),
            ),
            SizedBox(
              height: 21,
            ),
            Container(
              padding: EdgeInsets.only(left: 21, right: 21),
              child: reusableTextField(
                  "Email", Icons.person_outline, false, _emailTextController),
            ),
            SizedBox(
              height: 21,
            ),
            Container(
              padding: EdgeInsets.only(left: 21, right: 21),
              child: reusableTextField("Password", Icons.lock_outline, true,
                  _passwordTextController),
            ),
            SizedBox(
              height: 41,
            ),
            Padding(
                padding: EdgeInsets.only(left: 81, right: 81),
                child: firebaseUIButton(context, "Sign Up", () {}))
          ],
        ),
      ),
    );
  }
}
