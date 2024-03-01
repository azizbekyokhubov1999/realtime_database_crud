// import 'dart:developer';
// import '../models/post_model.dart';
// import '../services/database_service.dart';
// import 'package:realtime_database_crud/models/post_model.dart';
//
// import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:realtime_database_crud/pages/product_form_page.dart';



// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController descController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//
//   List<PostModel> list = [];
//
//   /// Remote config --->
//   bool isBannerShoww = false;
//   final remoteConfig = FirebaseRemoteConfig.instance;
//
//   Map<String, Color> colors = {
//     "blue":Colors.blue,
//     "yellow":Colors.yellow,
//     "red":Colors.red,
//     "green":Colors.green,
//     "grey":Colors.grey,
//     "pink":Colors.pink,
//     "white":Colors.white,
//     "purple": const Color.fromRGBO(99, 7, 181, 1)
//   };
//
//   String backgroundColor = "white";
//
//   Future<void> fetchData() async {
//     await remoteConfig.fetchAndActivate().then((value) {
//       backgroundColor = remoteConfig.getString("background_color");
//     });
//   }
//
//   Future<void> initialConfig() async{
//     remoteConfig.setDefaults({"background_color" : backgroundColor,});
//     remoteConfig.setDefaults({"isBannerShoww": isBannerShoww});
//     await fetchData();
//     remoteConfig.onConfigUpdated.listen((event) async{
//       await fetchData();
//       setState(() {});
//     });
//   }
//
//
//   getPosts() async {
//     list = await RTDBService.readPosts(RTDBService.path);
//     setState(() {});
//   }
//
//   Future<void> updatePost(PostModel postModel) async {
//     await RTDBService.updatePost(postModel, RTDBService.path);
//     await getPosts();
//   }
//
//   Future<void> deletePost(String? id) async {
//     await RTDBService.deletePost(RTDBService.path, id!);
//     await getPosts();
//   }
//
//   @override
//   void initState() {
//     getPosts();
//     initialConfig();
//     isBannerShoww = remoteConfig.getBool("isBannerShoww");
//     log(isBannerShoww.toString());
//     remoteConfig.onConfigUpdated.listen((event) async{
//       await remoteConfig.activate();
//       setState(() {
//         isBannerShoww = remoteConfig.getBool("isBannerShoww");
//       });
//     });
//     super.initState();
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: isBannerShoww ? AppBar(
//         centerTitle: true,
//         backgroundColor: colors[backgroundColor],
//         title: const Text('Product info',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ): AppBar(
//           centerTitle: false,
//           backgroundColor: Colors.red,
//           title: const Text('Product info',
//           style: TextStyle(
//           color: Colors.white,
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//          ),
//         ),
//       ),
//       body: Container(
//         margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
//         child: Column(
//           children: [
//             Expanded(
//               child: list.isNotEmpty? ListView.builder(
//                   itemCount: list.length,
//                   itemBuilder: (_, index) {
//                     return  Container(
//                       margin: const EdgeInsets.only(bottom: 20),
//                       child: Material(
//                         elevation: 5,
//                         borderRadius: BorderRadius.circular(10),
//                         child: Container(
//                           padding: const EdgeInsets.all(20),
//                           width: MediaQuery.of(context).size.width,
//                           decoration: BoxDecoration(
//                               color: colors[backgroundColor],
//                               borderRadius: BorderRadius.circular(10)
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text("Name: ${list[index].name}",
//                                     style: const TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                   const Spacer(),
//                                   GestureDetector(
//                                     onTap: () {
//                                       nameController.text = list[index].name;
//                                       descController.text = list[index].description;
//                                       priceController.text = list[index].price;
//                                       editUserInfo(list[index].id);
//                                     },
//                                     child: const Icon(Icons.edit,
//                                       color: Colors.yellow,
//                                     ),
//                                   ),
//                                   const SizedBox(width: 8),
//                                   GestureDetector(
//                                     onTap: () async {
//                                      await deletePost(list[index].id);
//                                     },
//                                     child: const Icon(Icons.delete,
//                                       color: Colors.yellow,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               Text("Description:  ${list[index].description}",
//                                 style: const TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                               Text("Price: ${list[index].price}",
//                                 style: const TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   }
//               ) : Container()
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => ProductForm()));
//         },
//         backgroundColor: const Color.fromRGBO(161, 66, 245, 1),
//         child: const Icon(Icons.add,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
//
//
//   Future editUserInfo(String? id) => showDialog(context: context, builder: (context) =>
//         AlertDialog(
//             content: Container(
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Icon(Icons.cancel),
//                       ),
//                       const SizedBox(width: 60),
//                       const Text('Update Product Info',
//                         style: TextStyle(
//                           color:  Color.fromRGBO(99, 7, 181, 1),
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 15),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       const Text(
//                         'Name:',
//                         style: TextStyle(
//                             color: Colors.black87,
//                             fontSize: 17,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: 'Roboto'
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Container(
//                         alignment: Alignment.centerLeft,
//                         decoration: BoxDecoration(
//                             color: const Color.fromRGBO(158, 118, 194, 1),
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: const [
//                               BoxShadow(
//                                   color: Colors.grey,
//                                   blurRadius: 6,
//                                   offset: Offset(0, 2)
//                               )
//                             ]
//                         ),
//                         height: 60,
//                         child: TextField(
//                           controller: nameController,
//                           keyboardType: TextInputType.text,
//                           style: const TextStyle(
//                               color: Colors.white
//                           ),
//                           decoration: const InputDecoration(
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.only(top: 10, left: 14),
//                               hintText: 'name',
//                               hintStyle: TextStyle(
//                                   color: Color.fromRGBO(99, 7, 181, 1)
//                               )
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       const Text(
//                         'Description',
//                         style: TextStyle(
//                             color: Colors.black87,
//                             fontSize: 17,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: 'Roboto'
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Container(
//                         alignment: Alignment.centerLeft,
//                         decoration: BoxDecoration(
//                             color: const Color.fromRGBO(158, 118, 194, 1),
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: const [
//                               BoxShadow(
//                                   color: Colors.grey,
//                                   blurRadius: 6,
//                                   offset: Offset(0, 2)
//                               )
//                             ]
//                         ),
//                         height: 60,
//                         child: TextField(
//                           controller: descController,
//                           keyboardType: TextInputType.text,
//                           style: const TextStyle(
//                               color: Colors.white
//                           ),
//                           decoration: const InputDecoration(
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.only(top: 10, left: 14),
//                               hintText: 'description',
//                               hintStyle: TextStyle(
//                                   color: Color.fromRGBO(99, 7, 181, 1)
//                               )
//                           ),
//                         ),
//
//                       )
//                     ],
//                   ),
//
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       const Text(
//                         'Price: ',
//                         style: TextStyle(
//                             color: Colors.black87,
//                             fontSize: 17,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: 'Roboto'
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Container(
//                         alignment: Alignment.centerLeft,
//                         decoration: BoxDecoration(
//                             color: const Color.fromRGBO(158, 118, 194, 1),
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: const [
//                               BoxShadow(
//                                   color: Colors.grey,
//                                   blurRadius: 6,
//                                   offset: Offset(0, 2)
//                               )
//                             ]
//                         ),
//                         height: 60,
//                         child: TextField(
//                           controller: priceController,
//                           keyboardType: TextInputType.text,
//                           style: const TextStyle(
//                               color: Colors.white
//                           ),
//                           decoration: const InputDecoration(
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.only(top: 10, left: 14),
//                               hintText: 'price',
//                               hintStyle: TextStyle(
//                                   color: Color.fromRGBO(99, 7, 181, 1)
//                               )
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.symmetric(vertical: 25),
//                     child: MaterialButton(
//                       onPressed: () async {
//                         PostModel postModel = PostModel(
//                             id: id,
//                             name: nameController.text.trim(),
//                             description: descController.text.trim(),
//                             price: priceController.text.trim()
//                         );
//                         await updatePost(postModel).then((value) {
//                           Navigator.pop(context);
//                         });
//                       },
//                       padding: const EdgeInsets.all(15),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15)
//                       ),
//                       color: const Color.fromRGBO(99, 7, 181, 1),
//                       child: const Text('Update',
//                         style: TextStyle(color: Colors.white,
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ));
// }


import 'package:provider/provider.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context, listen: false);
    homeController.initState(context);

    return Scaffold(
      appBar: homeController.isBannerShoww ? AppBar(
        centerTitle: true,
        backgroundColor: homeController.colors[homeController.backgroundColor],
        title: const Text('Product info',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ): AppBar(
        centerTitle: false,
        backgroundColor: Colors.red,
        title: const Text('Product info',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          children: [
            Expanded(
              child: Consumer<HomeController>(
                builder: (context, controller, child) {
                  return controller.list.isNotEmpty ? ListView.builder(
                    itemCount: controller.list.length,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: controller.colors[controller.backgroundColor],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("Name: ${controller.list[index].name}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        controller.nameController.text = controller.list[index].name;
                                        controller.descController.text = controller.list[index].description;
                                        controller.priceController.text = controller.list[index].price;
                                        controller.editUserInfo(context, controller.list[index].id);
                                      },
                                      child: const Icon(Icons.edit,
                                        color: Colors.yellow,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    GestureDetector(
                                      onTap: () async {
                                        await controller.deletePost(controller.list[index].id);
                                      },
                                      child: const Icon(Icons.delete,
                                        color: Colors.yellow,
                                      ),
                                    ),
                                  ],
                                ),
                                Text("Description:  ${controller.list[index].description}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("Price: ${controller.list[index].price}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ) : Container();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProductForm()));
        },
        backgroundColor: const Color.fromRGBO(161, 66, 245, 1),
        child: const Icon(Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}


