import 'package:assetdata/screen/form_brand.dart';
import 'package:assetdata/screen/home_page.dart';
import 'package:assetdata/screen/login.dart';
import 'package:assetdata/screen/profil_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      getPages: [
        GetPage(
            name: '/',
            page: () => LoginScreen(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/homepage',
            page: () => HomePage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/addbrand',
            page: () => AddFormBrand(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/profilpage',
            page: () => ProfilPage(),
            transition: Transition.fadeIn)
      ],
    );
  }
}
