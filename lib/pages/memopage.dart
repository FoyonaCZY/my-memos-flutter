import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/data.dart';
import 'editpage.dart';

class MemoPage extends StatelessWidget {
  final GlobalController globalController = Get.find();
  final int index;

  MemoPage({super.key, required this.index});

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
        body: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  color: Colors.grey[200],
                  child: Text(
                    globalController.memos[index].title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  color: Colors.grey[200],
                  child: Text(
                    'Edited on ${globalController.memos[index].time}',
                    style: const TextStyle(
                        fontStyle: FontStyle.italic, fontSize: 12),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    color: Colors.grey[200],
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Text(
                        globalController.memos[index].description,
                        style: const TextStyle(fontSize: 20,height: 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => EditPage(
                type: 'edit',
                title: globalController.memos[index].title,
                description: globalController.memos[index].description));
          },
          child: const Icon(Icons.edit),
        ));
  }
}
