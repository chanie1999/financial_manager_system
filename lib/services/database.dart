import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {

  getUsersInfo(String userName) async {
    return Firestore.instance.collection('User').where("name",isEqualTo: userName).getDocuments().catchError((e) {print(e.toString());});
  }
}