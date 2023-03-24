import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kind_heart/models/common/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Place');

class PlaceService {
//CRUD method here

  static get message => null;
  static Future<Response> addPlace({
    required String name,
    required String contactno,
    required String date,
    required String location,
    required String description,
  }) async {
    Response response = Response(code: null, message: message);
    DocumentReference documentReferencer = _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "contactno": contactno,
      "date": date,
      "location": location,
      "description": description,
    };

    var result = await documentReferencer.set(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully added to the database";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Stream<QuerySnapshot> readPlace() {
    CollectionReference notesItemCollection = _Collection;

    return notesItemCollection.snapshots();
  }

  static Future<Response> updatePlace({
    required String docId,
    required String name,
    required String contactno,
    required String date,
    required String location,
    required String description,
  }) async {
    Response response = Response(code: null, message: message);
    DocumentReference documentReferencer = _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "contactno": contactno,
      "date": date,
      "location": location,
      "description": description,
    };

    await documentReferencer.update(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully updated Place";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Future<Response> deletePlace({
    required String docId,
  }) async {
    Response response = Response(code: null, message: message);
    DocumentReference documentReferencer = _Collection.doc(docId);

    await documentReferencer.delete().whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully Deleted Place";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }
}
