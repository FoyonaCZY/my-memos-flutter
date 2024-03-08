import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/data.dart';
import '../models/drawer.dart';
import '../models/list.dart';
import './editpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
      ),
      drawer: const MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.grey[200],
            child: const Text(
              'MyMemos',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
          ),
          Expanded(
            flex: 1,
            child: MemosList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => EditPage(type: 'add',title: '',description: ''));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
