import 'package:flutter/gestures.dart';
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
              height: 213,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: 'Syarat dan Ketentuan',
                style: TextStyle(
                  color: Color.fromARGB(255, 136, 185, 218),
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('SYARAT & KETENTUAN'),
                          content: Container(
                            child: ListView(
                              children: [
                                Text(
                                    'Dengan masuk ke akun Anda, Anda harus menyetujui syarat dan ketentuan kami.\nFAQ\n\nBagaimana cara masuk ke akun Share Chip saya?\n\nIkuti langkah-langkah berikut untuk masuk atau login ke akun Share Chip Anda:\n1. Buka aplikasi Share Chip.\n2. Pilih menu “Login”\n3. Masukkan alamat email serta kata sandi yang telah terdaftar di Share Chip, lalu klik “Login“.\n\nMengapa saya tidak bisa masuk ke akun Share Chip saya?\n\nAda beberapa hal yang menyebabkan Anda tidak bisa masuk ke akun Share Chip Anda, seperti: \n1. Anda memasukkan alamat email dan kata sandi yang salah. Pastikan Anda sudah memasukkan alamat email dan kata sandi yang benar dan sesuai. \n2. Anda memasukkan alamat email yang belum terdaftar pada akun Google atau Share Chip (belum melakukan registrasi).'),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
              ),
            ])),
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
                            color: Color.fromARGB(255, 255, 255, 255)),
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
