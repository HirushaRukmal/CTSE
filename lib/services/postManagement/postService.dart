import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/common/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Post');

class postService{
  static get message => null;

    static Future<Response> addPost({
      required String title,
      required String date,
      required String description,
  }) async {

    Response response = Response(code: null, message: message);
    DocumentReference documentReferencer = _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "date": date,
      "description" : description
    };

    var result = await documentReferencer
        .set(data)
        .whenComplete(() {
      response.code = 200;
      response.message = "Successfully Added the Post!!";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Stream<QuerySnapshot> readPosts(){
    CollectionReference notesItemCollection = _Collection;

    return notesItemCollection.snapshots();
  }

  static Future<Response> deletePost({
      required String docId,
  }) async {
      Response response = Response(code: null, message: message);
      DocumentReference documentReferencer = _Collection.doc(docId);

      await documentReferencer
        .delete()
        .whenComplete((){
        response.code = 200;
        response.message = "Successfully Deleted Post!!";
      })
        .catchError((e) {
        response.code = 500;
        response.message = e;
      });

      return response;
    }


  // static Future<void> deletePosts({
  //   required String docId,
  // }) async{
  //   DocumentReference documentReference = _Collection.doc("1").collection('posts').doc(docId);
  //   await documentReference.delete().whenComplete(() => print("Note item deleted from the database")).catchError((e) => print(e));
  // }

  static Future<Response> updatePost({
    required String docId,
    required String title,
    required String date,
    required String description,
  }) async {
    Response response = Response(code: null, message: message);
    DocumentReference documentReferencer =
    _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "date": date,
      "description" : description
    };

    await documentReferencer
        .update(data)
        .whenComplete(() {
      response.code = 200;
      response.message = "Successfully updated the Post";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }
}