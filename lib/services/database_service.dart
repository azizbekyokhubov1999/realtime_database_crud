import 'package:firebase_database/firebase_database.dart';
import 'package:realtime_database_crud/models/post_model.dart';

class RTDBService {
  static DatabaseReference ref = FirebaseDatabase.instance.ref();
  static const path = 'products';
  // static Future<void> storeData(
  //     {required Map<String, dynamic> data, required String path}) async {
  //   String? key = ref.child(path).push().key;
  //   await ref.child(path).child(key!).set(data);
  // }

 static Future<void> storeData({required PostModel postModel, required String path}) async {
   String? key = ref.child(path).push().key;
   postModel.id = key;
   await ref.child(path).child(postModel.id ?? key!).set(postModel.toJson());
 }

 static Future<List<PostModel>> readPosts(String path)async{
   List<PostModel> postList = [];
   Query query = ref.child(path);
   DatabaseEvent databaseEvent = await query.once();
   Iterable<DataSnapshot> result =  databaseEvent.snapshot.children;
   for(DataSnapshot e in result){
     if(e != null){
       postList.add(PostModel.fromJson(Map<String, dynamic>.from(e.value as Map)));
     }
   }
   return postList;
 }

 static Future<void> updatePost(PostModel postModel, String path) async{
   await ref.child(path).child(postModel.id ?? "").set(postModel.toJson());
 }

 static Future<void> deletePost(String path, String id) async{
   await ref.child(path).child(id).remove();
 }

}