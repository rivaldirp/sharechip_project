import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:like_button/like_button.dart';
import 'package:readmore/readmore.dart';
import 'package:sharechip_project/screens/home/detail-screen.dart';
import 'package:sharechip_project/screens/home/upload-screen.dart';

class PostinganScreen extends StatefulWidget {
  String uid;
  PostinganScreen(this.uid, {super.key});

  @override
  State<PostinganScreen> createState() => _PostinganScreenState(uid);
}

class _PostinganScreenState extends State<PostinganScreen> {
  final dbRef = FirebaseDatabase.instance.reference().child('posts');
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child('Post List');
  TextEditingController searchController = TextEditingController();
  String _uid;

  _PostinganScreenState(this._uid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF01908E),
        title: Text("Postingan"),
      ),
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
            height: 9,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 21, right: 21),
            child: FirebaseAnimatedList(
              query: dbRef.child('Post List'),
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                String tempTitle = snapshot.child('uid').value.toString();

                if (tempTitle.toLowerCase().startsWith(_uid.toLowerCase())) {
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
                                  builder: (context) => DetailScreen(
                                      snapshot.child('pId').value.toString(),
                                      snapshot
                                          .child('pTittle')
                                          .value
                                          .toString(),
                                      snapshot.child('pImage').value.toString(),
                                      snapshot.child('pTime').value.toString(),
                                      snapshot
                                          .child('pDescription')
                                          .value
                                          .toString(),
                                      snapshot
                                          .child('pSourceCode')
                                          .value
                                          .toString(),
                                      snapshot.child('uEmail').value.toString(),
                                      snapshot.child('uNick').value.toString(),
                                      snapshot.child('uPepe').value.toString(),
                                      snapshot.child('uid').value.toString())));
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
                                ReadMoreText(
                                  snapshot
                                      .child('pDescription')
                                      .value
                                      .toString(),
                                  trimLines: 1,
                                  trimCollapsedText: 'Show more',
                                  trimExpandedText: 'Show less',
                                  moreStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 56, 148, 128)),
                                  lessStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 56, 148, 128)),
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromARGB(40, 1, 144, 142)),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            LikeButton(
                                              size: 24,
                                              isLiked: false,
                                              likeCount: 0,
                                            ),
                                            LikeButton(
                                              likeBuilder: (bool isLiked) {
                                                return Icon(
                                                  Icons.cancel,
                                                  color: isLiked
                                                      ? Colors.deepPurpleAccent
                                                      : Colors.grey,
                                                  size: 24,
                                                );
                                              },
                                              size: 24,
                                              isLiked: false,
                                              likeCount: 0,
                                            ),
                                            GestureDetector(
                                              onTap: (() => showDialog<String>(
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        AlertDialog(
                                                      title:
                                                          const Text('Hapus'),
                                                      content: const Text(
                                                          'Anda yakin ingin menghapus postingan ini?'),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  context,
                                                                  'Cancel'),
                                                          child: const Text(
                                                              'Cancel'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            dbRef
                                                                .child(
                                                                    'Post List')
                                                                .child(snapshot
                                                                    .child(
                                                                        'pId')
                                                                    .value
                                                                    .toString())
                                                                .remove();
                                                            Navigator.pop(
                                                                context, 'Ya');
                                                          },
                                                          child: const Text(
                                                            'Ya',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.red[400],
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
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
