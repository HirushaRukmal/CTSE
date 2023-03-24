import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/common/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Donation');

class donationService {
  static get message => null;

  //Add donation
  static Future<Response> addDonation({
    required String name,
    required String email,
    required String mobileNumber,
    required String location,
    required String category,
    required String description,
  }) async {
    Response response = Response(code: null, message: message);
    DocumentReference documentReferencer = _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "email": email,
      "mobileNumber": mobileNumber,
      "location": location,
      "category": category,
      "description": description
    };

    var result = await documentReferencer
      .set(data)
      .whenComplete(() {
        response.code = 200;
        response.message = "Successfully Added a Donation.";
      })
      .catchError((e) {
        response.code = 500;
        response.message = e;
      });

      return response;
  }

  //Retrive Donation
  static Stream<QuerySnapshot> readDonation() {
    CollectionReference notesItemCollection =
        _Collection;

    return notesItemCollection.snapshots();
  }

  //Update Donation
  static Future<Response> updateDonation({
    required String docId,
    required String name,
    required String email,
    required String mobileNumber,
    required String location,
    required String category,
    required String description,
    
  }) async {
   Response response = Response(code: null, message: message);
    DocumentReference documentReferencer =
        _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "email": email,
      "mobileNumber" : mobileNumber,
      "location": location,
      "category": category,
      "description": description,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() {
           response.code = 200;
          response.message = "Sucessfully updated Donation";
        })
        .catchError((e) {
            response.code = 500;
            response.message = e;
        });

        return response;
  }

  //Delete Donation
  static Future<Response> deleteDonation({
    required String docId,
  }) async {
     Response response = Response(code: null, message: message);
    DocumentReference documentReferencer =
        _Collection.doc(docId);

    await documentReferencer
        .delete()
        .whenComplete((){
          response.code = 200;
          response.message = "Sucessfully Deleted Donation";
        })
        .catchError((e) {
           response.code = 500;
            response.message = e;
        });

   return response;
  }
}