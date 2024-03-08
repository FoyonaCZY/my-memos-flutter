import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/data.dart';

class SettingsPage extends StatelessWidget {
  final GlobalController globalController = Get.find();

  SettingsPage({super.key});

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
                'Settings',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
              SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () {
              //     globalController.changeTheme();
              //   },
              //   child: const Text('Change Theme'),
              // ),
              Text('Coming soon...')
            ],
          ),
        ),
      ),
    );
  }
}