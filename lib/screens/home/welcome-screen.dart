import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sharechip_project/google-signin.dart';
import 'package:sharechip_project/screens/home/home-screen.dart';
import 'package:sharechip_project/screens/home/itulah-screen.dart';
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
        child: ListView(
          children: 
            [Column(
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
                  height: 213,
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.only(left: 61, right: 61),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        elevation: 0,
                        primary: Color.fromARGB(255, 154, 190, 213),
                        minimumSize: Size(10, 46)),
                    onPressed: () {
                      
                      final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                      provider.googleLogin();
                      
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
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4,),
                RichText(
          text: TextSpan(
            text: 'By continuing, you agree to the ',
            style: TextStyle(fontSize: 13, fontFamily: 'InterRegular', color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                  text: 'Privacy Policy',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ItulahScreen()),
          );
        },
                  style: TextStyle(
                    color: Colors.blue,
                  )),
              
            ],
          ),
        ),
        SizedBox(height: 21,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
