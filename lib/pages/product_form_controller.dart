import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_database_crud/models/post_model.dart';
import 'package:realtime_database_crud/services/database_service.dart';

class ProductFormController extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  List<PostModel> list = [];
  bool isLoading = false;

  Future<void> create(String path) async {
    PostModel postModel = PostModel(
      name: nameController.text.trim(),
      description: descController.text.trim(),
      price: priceController.text.trim(),
    );
    await RTDBService.storeData(postModel: postModel, path: path);
    nameController.clear();
    descController.clear();
    priceController.clear();
    log("Successfully posted");
    await readPosts();
  }

  Future<void> readPosts() async {
    list = await RTDBService.readPosts(RTDBService.path);
    notifyListeners();
  }

  Future<void> deletePost(String id) async {
    await RTDBService.deletePost(RTDBService.path, id);
    await readPosts();
  }

  void initState(BuildContext context) {
    readPosts().then((value) {
      isLoading = true;
      notifyListeners();
    });
  }
}
