import 'package:assetdata/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[900]),
                ),
                onPressed: () async {
                  Get.toNamed('/addbrand');
                },
                child: Container(
                    width: Get.width,
                    child: const Center(child: Text('Add Brand')))),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[900]),
                ),
                onPressed: () async {
                  Get.toNamed('/profilpage');
                },
                child: Container(
                    width: Get.width,
                    child: const Center(child: Text('Profile')))),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[900]),
                ),
                onPressed: () async {},
                child: Container(
                    width: Get.width,
                    child: const Center(child: Text('Logout'))))
          ],
        ),
      ),
    );
  }
}
