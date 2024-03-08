import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/aboutpage.dart';
import '../pages/settingspage.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: const Center(
                child: Text('MyMemos',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.black)),
              )),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings', style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18)),
            onTap: () {
              Get.to(() => SettingsPage());
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About', style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18)),
            onTap: () {
              Get.to(() => AboutPage());
            },
          ),
        ],
      ),
    );
  }
}
