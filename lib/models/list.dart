import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/data.dart';
import '../pages/editpage.dart';
import '../pages/homepage.dart';
import '../pages/memopage.dart';

class MemosList extends StatelessWidget {
  final GlobalController globalController = Get.find();

  MemosList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => (globalController.memos.isEmpty)
        ? Container(
            color: Colors.grey[200],
            child: const Center(
              child: Text(
                'No memo yet.',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        : Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: ListView.builder(
              itemCount: globalController.memos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Get.to(() => MemoPage(index: index));
                  },
                  title: Text(
                    globalController.memos[index].title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    globalController.memos[index].description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(globalController.memos[index].time),
                      IconButton(
                        onPressed: () {
                          Get.defaultDialog(
                            title: 'Delete Memo',
                            middleText:
                                'Confirm deletion of this memo?',
                            textConfirm: 'Yes',
                            textCancel: 'No',
                            onConfirm: () {
                              globalController.deleteMemo(index);
                              Get.back();
                              Get.snackbar('Message', 'Memo deleted.');
                            },
                          );
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            )));
  }
}
