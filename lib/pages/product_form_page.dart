
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:realtime_database_crud/models/post_model.dart';
import 'package:realtime_database_crud/services/database_service.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({super.key});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {

  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController stockQController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController qualityController = TextEditingController();
  TextEditingController countryController = TextEditingController();

Future<void> create(String path)async{
  PostModel postModel = PostModel(
      name: nameController.text.trim(),
      description: descController.text.trim(),
      price: priceController.text.trim(),
      category: categoryController.text.trim(),
      stockQuantity: stockQController.text.trim(),
      size: sizeController.text.trim(),
      color: colorController.text.trim(),
      brand: brandController.text.trim(),
      rating: ratingController.text.trim(),
      quality: qualityController.text.trim(),
      country: countryController.text.trim()
  );
  await RTDBService.storeData(data: postModel.toJson(), path: path);
  nameController.clear();
  descController.clear();
  priceController.clear();
  categoryController.clear();
  stockQController.clear();
  sizeController.clear();
  colorController.clear();
  brandController.clear();
  ratingController.clear();
  qualityController.clear();
  countryController.clear();
  log("Successfully posted");
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
              const SizedBox(height: 15),
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Category:',
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
                    controller: categoryController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                        color: Colors.white
                    ),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 10, left: 14),
                        hintText: 'Category',
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 17
                        )
                    ),
                  ),
                )
              ],
            ), // Field -- 4
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Stock Quantity:',
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
                      controller: stockQController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                          color: Colors.white
                      ),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 10, left: 14),
                          hintText: 'Stock Quantity',
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 17
                          )
                      ),
                    ),
                  )
                ],
              ), //Field--5
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Size: ',
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
                      controller: sizeController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                          color: Colors.white
                      ),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 10, left: 14),
                          hintText: 'Size',
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 17
                          )
                      ),
                    ),
                  )
                ],
              ), //Field--6
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Color: ',
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
                      controller: colorController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                          color: Colors.white
                      ),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 10, left: 14),
                          hintText: 'Color',
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 17
                          )
                      ),
                    ),
                  )
                ],
              ), //Field--7
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Brand: ',
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
                      controller: brandController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                          color: Colors.white
                      ),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 10, left: 14),
                          hintText: 'Brand',
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 17
                          )
                      ),
                    ),
                  )
                ],
              ), //Field--8
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Rating: ',
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
                      controller: ratingController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                          color: Colors.white
                      ),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 10, left: 14),
                          hintText: 'Rating',
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 17
                          )
                      ),
                    ),
                  )
                ],
              ), //Field--9
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Quality: ',
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
                      controller: qualityController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                          color: Colors.white
                      ),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 10, left: 14),
                          hintText: 'Quality',
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 17
                          )
                      ),
                    ),
                  )
                ],
              ), //Field--10
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Country:',
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
                      controller: countryController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                          color: Colors.white
                      ),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 10, left: 14),
                          hintText: 'Country',
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 17
                          )
                      ),
                    ),
                  )
                ],
              ), //Field--11
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
                    // String randomUniqueId = randomAlphaNumeric(10);
                    // Map<String, dynamic> usersData = {
                    //   "Username" : usernameController.text,
                    //   "Specialty" : specialtyController.text,
                    //   "Id" : randomUniqueId,
                    //   "Hobby" : hobbyController.text
                    // };
                    // await CFSDatabaseService().storeData(dataOfUsers: usersData, id: randomUniqueId).then((value) {
                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    // });
                    await create("products");
                  },
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  color: const Color.fromRGBO(15, 145, 108, 1),
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
