import 'package:flutter/material.dart';
import 'package:realtime_database_crud/pages/product_form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(99, 7, 181, 1),
        title: const Text('Product info',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // body: Container(
      //   margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
      //   child: Column(
      //     children: [
      //       Expanded(child: allUserDetail()),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductForm()));
        },
        backgroundColor: const Color.fromRGBO(161, 66, 245, 1),
        child: const Icon(Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
  }

