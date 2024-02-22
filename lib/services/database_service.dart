import 'package:firebase_database/firebase_database.dart';

class RTDBService{
  static DatabaseReference ref = FirebaseDatabase.instance.ref();

  static Future<void> storeData({required Map<String, dynamic> data, required String path}) async{
    String? key = ref.child(path).push().key;
    await ref.child(path).child(key!).set(data);
  }
}