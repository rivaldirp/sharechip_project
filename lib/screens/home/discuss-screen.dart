import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class DiscussScreen extends StatefulWidget {
  const DiscussScreen({super.key});

  @override
  State<DiscussScreen> createState() => _DiscussScreenState();
}

class _DiscussScreenState extends State<DiscussScreen> {
  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse("https://t.me/+jfjXdrI-RV9hY2Jl");

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 79, right: 79),
            child: Row(
              children: [
                Text(
                  "SHARE ",
                  style: TextStyle(
                      fontSize: 33,
                      fontFamily: 'InterBold',
                      color: Color(0xFF01908E)),
                ),
                Text(
                  "CHIP",
                  style: TextStyle(
                      fontSize: 33,
                      fontFamily: 'InterBold',
                      color: Color(0xFF0c6494)),
                ),
              ],
            ),
          ),
          Text(
            "Join with us!",
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'InterBold',
                color: Color.fromARGB(255, 77, 91, 87)),
          ),
          SizedBox(
            height: 41,
          ),
          Link(
            target: LinkTarget.blank,
            uri: Uri.parse('https://t.me/+jfjXdrI-RV9hY2Jl'),
            builder: (context, followLink) => 
            Container(
              padding: EdgeInsets.only(left: 79, right: 79),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    elevation: 0,
                    primary: Color(0xFF01908E),
                    minimumSize: Size(10, 46)),
                onPressed: followLink,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 13,
                      ),
                      Image.asset(
                        "assets/telegram.png",
                        height: 26,
                        width: 26,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      const Text(
                        "Telegram",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'InterRegular',
                            color: Color.fromARGB(255, 238, 243, 243)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
        ],
      )),
    );
  }

  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 81, 128, 128),
        textColor: Color.fromARGB(255, 255, 255, 255),
        fontSize: 13.0);
  }
}
