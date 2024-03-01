import 'dart:async';
import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_database_crud/models/post_model.dart';
import 'package:realtime_database_crud/services/database_service.dart';

class HomeController extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  List<PostModel> list = [];

  bool isBannerShoww = false;
  final remoteConfig = FirebaseRemoteConfig.instance;

  Map<String, Color> colors = {
    "blue":Colors.blue,
    "yellow":Colors.yellow,
    "red":Colors.red,
    "green":Colors.green,
    "grey":Colors.grey,
    "pink":Colors.pink,
    "white":Colors.white,
    "purple": const Color.fromRGBO(99, 7, 181, 1)
  };

  String backgroundColor = "white";

  Future<void> fetchData() async {
    await remoteConfig.fetchAndActivate().then((value) {
      backgroundColor = remoteConfig.getString("background_color");
    });
  }

  Future<void> initialConfig() async{
    remoteConfig.setDefaults({"background_color" : backgroundColor,});
    remoteConfig.setDefaults({"isBannerShoww": isBannerShoww});
    await fetchData();
    remoteConfig.onConfigUpdated.listen((event) async{
      await fetchData();
      notifyListeners();
    });
  }

  Future<void> getPosts() async {
    list = await RTDBService.readPosts(RTDBService.path);
    notifyListeners();
  }

  Future<void> updatePost(PostModel postModel) async {
    await RTDBService.updatePost(postModel, RTDBService.path);
    await getPosts();
  }

  Future<void> deletePost(String? id) async {
    await RTDBService.deletePost(RTDBService.path, id!);
    await getPosts();
  }

  void initState(BuildContext context) {
    getPosts();
    initialConfig();
    isBannerShoww = remoteConfig.getBool("isBannerShoww");
    log(isBannerShoww.toString());
    remoteConfig.onConfigUpdated.listen((event) async{
      await remoteConfig.activate();
      isBannerShoww = remoteConfig.getBool("isBannerShoww");
      notifyListeners();
    });
  }

  Future<void> editUserInfo(BuildContext context, String? id) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.cancel),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'Update Product Info',
                    style: TextStyle(
                      color: Color.fromRGBO(99, 7, 181, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Name:',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(158, 118, 194, 1),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    height: 40,
                    child: TextField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only( left: 14),
                        hintText: 'name',
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(99, 7, 181, 1),
                        ),
                      ),
                    ),
                  )
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Description',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto'
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(158, 118, 194, 1),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 6,
                              offset: Offset(0, 2)
                          )
                        ]
                    ),
                    height: 40,
                    child: TextField(
                      controller: descController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                          color: Colors.white
                      ),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 5, left: 14),
                          hintText: 'description',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(99, 7, 181, 1)
                          )
                      ),
                    ),

                  )
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Price: ',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto'
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(158, 118, 194, 1),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 6,
                              offset: Offset(0, 2)
                          )
                        ]
                    ),
                    height: 40,
                    child: TextField(
                      controller: priceController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                          color: Colors.white
                      ),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 5, left: 14),
                          hintText: 'price',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(99, 7, 181, 1)
                          )
                      ),
                    ),
                  )
                ],
              ),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: MaterialButton(
                  onPressed: () async {
                    PostModel postModel = PostModel(
                        id: id,
                        name: nameController.text.trim(),
                        description: descController.text.trim(),
                        price: priceController.text.trim()
                    );
                    await updatePost(postModel).then((value) {
                      Navigator.pop(context);
                    });
                  },
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  color: const Color.fromRGBO(99, 7, 181, 1),
                  child: const Text('Update',
                    style: TextStyle(color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
