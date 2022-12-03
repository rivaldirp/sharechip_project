import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpScreen extends StatefulWidget {
  const UpScreen({super.key});

  @override
  State<UpScreen> createState() => _UpScreenState();
}

class _UpScreenState extends State<UpScreen> {
  bool showSpinner = false;
  final postRef = FirebaseDatabase.instance.reference().child('posts');
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  File? _image;
  final picker = ImagePicker();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController keterController = TextEditingController();

  Future getImageGalery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('no image selected');
      }
    });
  }

  Future getCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('no image selected');
      }
    });
  }

  void dialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: Container(
              height: 120,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      getCamera();
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: Icon(Icons.camera),
                      title: Text('Camera'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      getImageGalery();
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: Icon(Icons.photo),
                      title: Text('Galery'),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF01908E),
          title: Text("Upload Project"),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  dialog(context);
                },
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * .25,
                    child: _image != null
                        ? ClipRect(
                            child: Image.file(
                              _image!.absolute,
                              width: 100,
                              height: 100,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 176, 203, 203),
                                borderRadius: BorderRadius.circular(10)),
                            width: 100,
                            height: 100,
                            child: Icon(
                              Icons.camera_alt,
                              color: Color(0xFF01908E),
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    minLines: 1,
                    maxLength: 90,
                    maxLines: 3,
                    controller: titleController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Title',
                        hintText: 'Enter project title',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.normal),
                        labelStyle: TextStyle(
                            color: Color(0xFF01908E),
                            fontWeight: FontWeight.normal)),
                  )
                ],
              )),
              SizedBox(
                height: 9,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    minLines: 1,
                    maxLines: 10,
                    controller: descController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Description',
                        hintText: 'Enter project description complete with tools and component',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.normal),
                        labelStyle: TextStyle(
                            color: Color(0xFF01908E),
                            fontWeight: FontWeight.normal)),
                  )
                ],
              )),
              SizedBox(
                height: 9,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    controller: keterController,
                    maxLines: 5,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Source Code',
                        hintText: 'Enter project source code',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.normal),
                        labelStyle: TextStyle(
                            color: Color(0xFF01908E),
                            fontWeight: FontWeight.normal)),
                  )
                ],
              )),
              SizedBox(
                height: 11,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF01908E)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });

                  try {
                    int date = DateTime.now().microsecondsSinceEpoch;
                    firebase_storage.Reference ref = firebase_storage
                        .FirebaseStorage.instance
                        .ref('/sharechip$date');
                    UploadTask uploadTask = ref.putFile(_image!.absolute);
                    await Future.value(uploadTask);
                    var newUrl = await ref.getDownloadURL();

                    final User? user = _auth.currentUser;

                    postRef.child('Post List').child(date.toString()).set({
                      'pId': date.toString(),
                      'pImage': newUrl.toString(),
                      'pTime':
                          DateFormat('dd/MM/yyyy KK.mm').format(DateTime.now()),
                      'pTittle': titleController.text.toString(),
                      'pDescription': descController.text.toString(),
                      'pSourceCode': keterController.text.toString(),
                      'pLike': 0.toInt(),
                      'pDislike': 0.toInt(),
                      'uEmail': user!.email.toString(),
                      'uNick': user!.displayName.toString(),
                      'uPepe': user!.photoURL.toString(),
                      'uid': user!.uid.toString(),
                    }).then((value) {
                      toastMessage('Post Published');
                      setState(() {
                        showSpinner = false;
                      });
                      Navigator.pop(context);
                    }).onError((error, stackTrace) {
                      toastMessage(error.toString());
                      setState(() {
                        showSpinner = false;
                      });
                    });
                  } catch (e) {
                    setState(() {
                      showSpinner = false;
                    });
                    toastMessage('Cant upload empty file');
                  }
                },
                child: Text('Upload'),
              )
            ],
          ),
        )),
      ),
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
