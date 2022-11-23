import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailScreen extends StatefulWidget {
  String pid;
  String titel;
  String image;
  String time;
  String desc;
  String code;
  String email;
  String nick;
  String pepe;
  String uid;

  DetailScreen(this.pid, this.titel, this.image, this.time, this.desc,
      this.code, this.email, this.nick, this.pepe, this.uid,
      {super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState(
      pid, titel, image, time, desc, code, email, nick, pepe, uid);
}

class _DetailScreenState extends State<DetailScreen> {
  String _pid;
  String _titel;
  String _image;
  String _time;
  String _desc;
  String _code;
  String _email;
  String _nick;
  String _pepe;
  String _uid;

  _DetailScreenState(this._pid, this._titel, this._image, this._time,
      this._desc, this._code, this._email, this._nick, this._pepe, this._uid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF01908E),
        title: Text(_nick),
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
              height: 39,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: FadeInImage.assetNetwork(
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * .25,
                  placeholder: 'assets/lowell.png',
                  image: _image),
            ),
            SizedBox(
              height: 21,
            ),
            Padding(
              padding: EdgeInsets.only(left: 17, right: 17),
              child: Container(
                child: Text(
                  _desc,
                  style: TextStyle(fontSize: 16, fontFamily: 'InterRegular'),
                ),
              ),
            ),
            SizedBox(
              height: 19,
            ),
            Padding(
              padding: EdgeInsets.only(left: 17, right: 17),
              child: Container(
                child: Text(
                  "Source code:",
                  style: TextStyle(fontSize: 16, fontFamily: 'InterBold'),
                ),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Padding(
              padding: EdgeInsets.only(left: 17, right: 17),
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SelectableText(
                    _code,
                    style: TextStyle(fontSize: 16, fontFamily: 'InterRegular'),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 11,
            ),
          ],
        ),
      ),
    );
  }
}
