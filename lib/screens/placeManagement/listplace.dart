///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:kind_heart/screens/dashboard/dashboard.dart';
import 'package:kind_heart/screens/nav%20bar/nav.dart';
import 'package:kind_heart/screens/placeManagement/addplace.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kind_heart/models/placeManagement/place.dart';
import 'package:kind_heart/screens/placeManagement/editplace.dart';
import 'package:kind_heart/services/placeManagement/placeService.dart';

import 'package:kind_heart/services/placeManagement/placeService.dart';

class ListPlace extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListPlace();
  }
}

class _ListPlace extends State<ListPlace> {
  final Stream<QuerySnapshot> collectionReference = PlaceService.readPlace();
  //FirebaseFirestore.instance.collection('Employee').snapshots();
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
        title: const Text("List of Places"),
        backgroundColor: Theme.of(context).primaryColor,
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
                  builder: (BuildContext context) => AddPlace(),
                ),
                (route) =>
                    false, //if you want to disable back feature set to false
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
                children: snapshot.data!.docs.map((e) {
                  return Card(
                      color: Color(0xFFE1F5FE),
                      child: Column(children: [
                        ListTile(
                          title: Text(e["location"],
                              style: const TextStyle(fontSize: 20)),
                          subtitle: Container(
                            child: (Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("date: " + e['date'],
                                    style: const TextStyle(fontSize: 16)),
                                Text("Contact Number: " + e['contactno'],
                                    style: const TextStyle(fontSize: 12)),
                              ],
                            )),
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(5.0),
                                primary: Color.fromARGB(255, 21, 6, 186),
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              child: const Text('Edit'),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil<dynamic>(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                    builder: (BuildContext context) =>
                                        EditPlace(
                                      place: Place(
                                        uid: e.id,
                                        name: e["name"],
                                        contactno: e["contactno"],
                                        date: e["date"],
                                        location: e["location"],
                                        description: e["description"],
                                      ),
                                    ),
                                  ),
                                  (route) =>
                                      false, //if you want to disable back feature set to false
                                );
                              },
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(5.0),
                                primary: Color.fromARGB(255, 221, 26, 26),
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              child: const Text('Delete'),
                              onPressed: () async {
                                var response =
                                    await PlaceService.deletePlace(docId: e.id);
                                if (response.code != 200) {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content:
                                              Text(response.message.toString()),
                                        );
                                      });
                                }
                              },
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
}
