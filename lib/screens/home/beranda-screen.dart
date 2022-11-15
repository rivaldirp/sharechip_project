import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sharechip_project/screens/home/detail-screen.dart';
import 'package:sharechip_project/screens/home/upload-screen.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({super.key});

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  final dbRef = FirebaseDatabase.instance.reference().child('posts');
  TextEditingController searchController = TextEditingController();
  String search = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        backgroundColor: Color(0xFF01908E),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UpScreen()),
          );
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 43,
          ),
          Container(
            child: Row(
              children: [
                SizedBox(
                  width: 215,
                ),
                Text(
                  "SHARE ",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'InterBold',
                      color: Color(0xFF01908E)),
                ),
                Text(
                  "CHIP",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'InterBold',
                      color: Color(0xFF0c6494)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 11, right: 11),
            child: TextFormField(
                controller: searchController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (val) {
                  setState(() {
                    search = val;
                  });
                }),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 21, right: 21),
            child: FirebaseAnimatedList(
              query: dbRef.child('Post List'),
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                String tempTitle = snapshot.child('pTittle').value.toString();

                if (search.isEmpty) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 11,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(snapshot
                                      .child('pTittle')
                                      .value
                                      .toString())));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 233, 245, 245),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(29),
                                        child: FadeInImage.assetNetwork(
                                            fit: BoxFit.cover,
                                            width: 29,
                                            height: 29,
                                            placeholder: 'assets/lowell.png',
                                            image: snapshot
                                                .child('uPepe')
                                                .value
                                                .toString()),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          snapshot
                                              .child('uNick')
                                              .value
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'InterBold')),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                          snapshot
                                              .child('pTime')
                                              .value
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontFamily: 'InterRegular')),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 13,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: FadeInImage.assetNetwork(
                                      fit: BoxFit.cover,
                                      width:
                                          MediaQuery.of(context).size.width * 1,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .25,
                                      placeholder: 'assets/lowell.png',
                                      image: snapshot
                                          .child('pImage')
                                          .value
                                          .toString()),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(snapshot.child('pTittle').value.toString(),
                                    style: TextStyle(
                                        fontSize: 20, fontFamily: 'InterBold')),
                                Text(snapshot
                                    .child('pDescription')
                                    .value
                                    .toString()),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      )
                    ],
                  );
                }
                if (tempTitle.toLowerCase().startsWith(search.toLowerCase())) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 11,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(snapshot
                                      .child('pTittle')
                                      .value
                                      .toString())));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 233, 245, 245),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(29),
                                        child: FadeInImage.assetNetwork(
                                            fit: BoxFit.cover,
                                            width: 29,
                                            height: 29,
                                            placeholder: 'assets/lowell.png',
                                            image: snapshot
                                                .child('uPepe')
                                                .value
                                                .toString()),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          snapshot
                                              .child('uNick')
                                              .value
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'InterBold')),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                          snapshot
                                              .child('pTime')
                                              .value
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontFamily: 'InterRegular')),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 13,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: FadeInImage.assetNetwork(
                                      fit: BoxFit.cover,
                                      width:
                                          MediaQuery.of(context).size.width * 1,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .25,
                                      placeholder: 'assets/lowell.png',
                                      image: snapshot
                                          .child('pImage')
                                          .value
                                          .toString()),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(snapshot.child('pTittle').value.toString(),
                                    style: TextStyle(
                                        fontSize: 20, fontFamily: 'InterBold')),
                                Text(snapshot
                                    .child('pDescription')
                                    .value
                                    .toString()),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      )
                    ],
                  );
                }
                return Container();
              },
            ),
          )),
        ],
      ),
    );
  }
}
