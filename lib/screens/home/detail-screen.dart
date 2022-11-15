import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailScreen extends StatefulWidget {
  String titel;

  DetailScreen(this.titel, {super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState(titel);
}

class _DetailScreenState extends State<DetailScreen> {
  String _titel;

  _DetailScreenState(this._titel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF01908E),
        title: Text(_titel),
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
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 17, right: 17),
              child: Container(
                child: Text(
                  _titel,
                  style: TextStyle(fontSize: 20, fontFamily: 'InterBold'),
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Image.asset(
              'assets/lowell.png',
              width: 207.53,
              height: 197,
            ),
            SizedBox(
              height: 21,
            ),
          ],
        ),
      ),
    );
  }
}
