import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kind_heart/screens/dashboard/dashboard.dart';
import 'package:kind_heart/screens/nav%20bar/nav.dart';
import 'package:kind_heart/screens/postManagement/addPost.dart';
import 'package:kind_heart/screens/postManagement/viewPost.dart';
import '../../widgets/FlutterVizBottomNavigationBarModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/postManagement/post.dart';
import '../../services/postManagement/postService.dart';
import 'package:intl/intl.dart';

class PostList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PostList();
  }
}

class _PostList extends State<PostList> {
  final Stream<QuerySnapshot> collectionReference = postService.readPosts();

  List<FlutterVizBottomNavigationBarModel> flutterVizBottomNavigationBarItems =
      [
    FlutterVizBottomNavigationBarModel(icon: Icons.home, label: "Home"),
    FlutterVizBottomNavigationBarModel(icon: Icons.article, label: "Donation"),
    FlutterVizBottomNavigationBarModel(icon: Icons.location_on, label: "Place"),
    FlutterVizBottomNavigationBarModel(icon: Icons.credit_card, label: "Post"),
    FlutterVizBottomNavigationBarModel(
        icon: Icons.account_circle, label: "Account")
  ];

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Nav(),
            ),
          );
        }),
        title: const Text("Posts List"),
        backgroundColor: Color(0xff3a57e8),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.app_registration,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => AddPostScreen(),
                ),
                (route) =>
                    true, //if you want to disable back feature set to false
              );
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: collectionReference,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView(
                children: snapshot.data!.docs.map((p) {
                  return Card(
                      color: Color(
                          0xFFE1F5FE), //0xFFB3E5FC //0xFF90CAF9 //0xFFE1F5FE
                      child: Column(children: [
                        ListTile(
                          title: Text(p["title"],
                              style: const TextStyle(fontSize: 18)),
                          subtitle: Container(
                            child: (Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // Text("Title: " + p['title'],
                                //     style: const TextStyle(fontSize: 14)),
                                Text("date: " + p['date'],
                                    //Text("
                                    // date: " + p['date'],
                                    style: const TextStyle(fontSize: 14)),
                              ],
                            )),
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            // TextButton(
                            //   style: TextButton.styleFrom(
                            //     padding: const EdgeInsets.all(5.0),
                            //     primary: const Color.fromARGB(255, 143, 133, 226),
                            //     textStyle: const TextStyle(fontSize: 20),
                            //   ),
                            //   child: const Text('Edit'),
                            //   onPressed: () {
                            //     viewPost(
                            //       post: Post(
                            //           id: p.id,
                            //           title: p["title"],
                            //           date: p["date"],
                            //           description: p["description"]),
                            //     );
                            //   },
                            // ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(5.0),
                                primary:
                                    const Color.fromARGB(255, 143, 133, 226),
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              child: const Text(''),
                              onPressed: () async {},
                            ),

                            // Icon(
                            //
                            //   Icons.visibility_outlined,
                            //   color: Colors.blue,
                            //   size: 30.0,
                            //   onPressed: (){},
                            // ),

                            IconButton(
                              icon: Icon(Icons.visibility_outlined),
                              onPressed: () {
                                viewPost(
                                  post: Post(
                                      id: p.id,
                                      title: p["title"],
                                      date: p["date"],
                                      description: p["description"]),
                                );
                              },
                              color: Colors.blue,
                              iconSize: 24,
                            ),
                          ],
                        ),
                      ]));
                }).toList(),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }

  viewPost({required Post post}) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ViewPostScreen(
        post_id: post.id,
        post_title: post.title,
        post_date: post.date,
        post_description: post.description,
      ),
    ));
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }
}
