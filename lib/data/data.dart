import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalController extends GetxController {
  static GlobalController instance = Get.find();
  List memos = <Memo>[].obs;
  var theme = ThemeData.light().obs;

  @override
  void onInit() {
    super.onInit();
    _loadMemos();
  }

  _loadMemos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('memos')) {
      List<String> memosStringList = prefs.getStringList('memos')!;
      memos.assignAll(memosStringList.map((memoString) {
        Map<String, dynamic> memoMap = json.decode(memoString);
        return Memo(
          title: memoMap['title'],
          description: memoMap['description'],
          time: memoMap['time'],
        );
      }).toList());
    }
  }

  _saveMemos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> memosStringList = memos
        .map((memo) => json.encode({
              'title': memo.title,
              'description': memo.description,
              'time': memo.time,
            }))
        .toList();
    prefs.setStringList('memos', memosStringList);
  }

  void changeTheme() {
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
  }

  void addMemo(String title, String description) {
    memos.add(Memo(
      title: title,
      description: description,
      time: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
    ));
    update();
    _saveMemos();
  }

  void deleteMemo(int index) {
    memos.removeAt(index);
    update();
    _saveMemos();
  }

  void editMemo(int index, String title, String description) {
    memos[index] = Memo(
      title: title,
      description: description,
      time: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
    );
    update();
    _saveMemos();
  }
}

class Memo {
  final String title;
  final String description;
  final String time;

  Memo({required this.title, required this.description, required this.time});
}
