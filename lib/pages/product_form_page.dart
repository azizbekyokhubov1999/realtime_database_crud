
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:realtime_database_crud/models/post_model.dart';
import 'package:realtime_database_crud/services/database_service.dart';

import 'home_page.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({super.key});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {

  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  List<PostModel> list = [];
  bool isLoading = false;

Future<void> create(String path)async{
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

Future<void> readPosts() async{
  list = await RTDBService.readPosts(RTDBService.path);
  setState(() {});
}

Future<void> deletePost(String id) async{
  await RTDBService.deletePost(RTDBService.path, id);
  await readPosts();
}

@override
  void initState() {
    readPosts().then((value){
      isLoading = true;
      setState(() {});
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(99, 7, 181, 1),
        title: const Text('Product form',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child:  SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Name:',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto'
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color:  const Color.fromRGBO(158, 118, 194, 1),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 6,
                            offset: Offset(0,2)
                        )
                      ]
                  ),
                  height: 60,
                  child:  TextField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                        color: Colors.white
                    ),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 10, left: 14),
                        hintText: 'Name',
                        hintStyle: TextStyle(
                            color: Colors.white,
                          fontSize: 17,
                        )
                    ),
                  ),
                )
              ],
            ), // Field--1
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Description:',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto'
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color:  const Color.fromRGBO(158, 118, 194, 1),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 6,
                              offset: Offset(0,2)
                          )
                        ]
                    ),
                    height: 60,
                    child:  TextField(
                      controller: descController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                          color: Colors.white
                      ),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 10, left: 14),
                          hintText: 'Description',
                          hintStyle: TextStyle(
                              color: Colors.white,
                            fontSize: 17,
                          )
                      ),
                    ),
                  )
                ],
              ), // Field--2
              const SizedBox(height: 15),
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Price:',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto'
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color:  const Color.fromRGBO(158, 118, 194, 1),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 6,
                            offset: Offset(0,2)
                        )
                      ]
                  ),
                  height: 60,
                  child:  TextField(
                    controller: priceController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                        color: Colors.white
                    ),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 10, left: 14),
                        hintText: 'Price',
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 17
                        )
                    ),
                  ),
                )
              ],
            ),// Field--3
              const SizedBox(height: 100),
              const Divider(
                thickness: 1.5,
                color:  Color.fromRGBO(161, 66, 245, 1),
                height: 2,
                endIndent: 1.5,
                indent: 1.5,
              ),
              const SizedBox(height: 5),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: MaterialButton(
                  onPressed: () async {
                    await create("products").then((value){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    });

                  },
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  color: const Color.fromRGBO(99, 7, 181, 1),
                  child: const Text('Create',
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
