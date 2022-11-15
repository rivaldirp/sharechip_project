import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DiscussScreen extends StatefulWidget {
  const DiscussScreen({super.key});

  @override
  State<DiscussScreen> createState() => _DiscussScreenState();
}

class _DiscussScreenState extends State<DiscussScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF01908E),
        title: Text("Discussion"),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onTap: (() {
            Navigator.pop(context);
          }),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
              onPressed: () async {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/whatsapp.png",
                      height: 31,
                      width: 31,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "WhatsApp",
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
          SizedBox(
            height: 39,
          ),
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
              onPressed: () async {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/telegram.png",
                      height: 26,
                      width: 26,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 28,
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
        ],
      )),
    );
  }
}
