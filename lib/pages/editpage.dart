import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/data.dart';

class EditPage extends StatelessWidget {
  final GlobalController globalController = Get.find();
  final String type, title, description;

  EditPage(
      {super.key,
      required this.type,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = (type != 'add')
        ? TextEditingController(text: title)
        : TextEditingController();
    final TextEditingController descriptionController = (type != 'add')
        ? TextEditingController(text: description)
        : TextEditingController();
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                maxLines: 1,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: TextField(
                  controller: descriptionController,
                  style: const TextStyle(height: 1.5),
                  maxLines: null,
                  expands: true,
                  decoration: const InputDecoration(
                    labelText: 'Content',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  if (type == 'add') {
                    globalController.addMemo(
                      titleController.text,
                      descriptionController.text,
                    );
                    Get.back();
                    Get.snackbar('Message', 'Memo added.');
                  } else {
                    globalController.editMemo(
                      globalController.memos.indexWhere(
                        (element) => element.title == title,
                      ),
                      titleController.text,
                      descriptionController.text,
                    );
                    Get.back();
                    Get.snackbar('Message', 'Memo edited.');
                  }
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(100, 50)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: (type == 'add')
                    ? const Text('Add Memo')
                    : const Text('Confirm Edit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
