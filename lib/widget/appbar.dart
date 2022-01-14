import 'package:flutter/material.dart';
import 'package:get/get.dart';

var _imgUrl = 'https://petronastest.assetdata.io/media/logos/assetdata.png';
final appBar = AppBar(
  backgroundColor: Colors.white,
  centerTitle: true,
  leading: Icon(
    Icons.menu,
    color: Colors.blue[900],
  ),
  title: SizedBox(
    width: Get.width / 3,
    child: Image.network(_imgUrl),
  ),
);
