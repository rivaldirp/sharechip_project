import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sharechip_project/screens/home/postingan-screen.dart';
import 'package:sharechip_project/screens/home/welcome-screen.dart';
import 'package:sharechip_project/services/firebase-services.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 179, 229, 208),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: ListView(
                children: 
                  [Column(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        margin: const EdgeInsets.only(
                          top: 100,
                          bottom: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(2, 2),
                              blurRadius: 10,
                            ),
                          ],
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                FirebaseAuth.instance.currentUser!.photoURL!),
                          ),
                        ),
                      ),
                      Text(
                        "${FirebaseAuth.instance.currentUser!.displayName}",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Color(0xFF0c6494),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      RichText(text: TextSpan(
                  text: 'logout',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      await FirebaseServices().googleSignOut();
            
                    },
                  style: TextStyle(
                    fontFamily: 'InterBold',
                    color: Color.fromARGB(255, 177, 103, 103),
                  )),),
                      
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 24,
                  right: 24,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "PROFILE",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Color(0xFF01908E),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        listProfile(Icons.person, "Name",
                            "${FirebaseAuth.instance.currentUser!.displayName}"),
                        listProfile(Icons.email, "Email",
                            "${FirebaseAuth.instance.currentUser!.email}"),
                        SizedBox(
                          height: 41,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF01908E)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.list),
                              SizedBox(
                                width: 11,
                              ),
                              Text("Postingan"),
                            ],
                          ),
                          onPressed: () {
                            final User? user = _auth.currentUser;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PostinganScreen(user!.uid.toString())));
                          },
                        ),
                        SizedBox(height: 101,),
                        
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listProfile(IconData icon, String text1, String text2) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 11),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Color.fromARGB(255, 77, 91, 87),
            size: 20,
          ),
          const SizedBox(
            width: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: const TextStyle(
                  color: Color.fromARGB(255, 77, 91, 87),
                  fontFamily: "Montserrat",
                  fontSize: 14,
                ),
              ),
              Text(
                text2,
                style: const TextStyle(
                  color: Colors.black87,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
