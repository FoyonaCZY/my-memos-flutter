import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/data.dart';

class AboutPage extends StatelessWidget {
  final GlobalController globalController = Get.find();

  AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.grey[200],
      ),
      body: Container(
        color: Colors.grey[200],
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: const Column(
            children: [
              Text(
                'About',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
              SizedBox(height: 20),
              Text(
                  'MyMemos is a simple memo app.\nIt\'s built by FoyonaCZY using Flutter and GetX.\nGithub repository:my-memos-flutter@FoyonaCZY',
                  style: TextStyle(fontSize: 15, height: 1.5)),
            ],
          ),
        ),
      ),
    );
  }
}
