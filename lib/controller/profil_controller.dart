import 'dart:convert';
import 'dart:io';

import 'package:assetdata/model/profile_model.dart';
import 'package:assetdata/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

class ProfilController extends GetxController {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController jobTitle = TextEditingController();
  final TextEditingController employeeId = TextEditingController();
  final TextEditingController timeFormat = TextEditingController();
  final TextEditingController dateFormat = TextEditingController();
  final TextEditingController company = TextEditingController();
  final TextEditingController department = TextEditingController();
  final TextEditingController timeZone = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  late final ProfileModel dataProfile;
  late final email = ''.obs;
  late final photos = ''.obs;
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  var base64Image = '';
  @override
  void onInit() async {
    super.onInit();
    dataProfile = await Request().getProfile();
    email.value = dataProfile.data!.email!;
    photos.value = dataProfile.data!.photos![0].url!;
    firstName.text = dataProfile.data!.firstName!;
    lastName.text = dataProfile.data!.lastName!;
    jobTitle.text = dataProfile.data!.jobTitle!;
    employeeId.text = dataProfile.data!.employeeNumber!;
    timeFormat.text = dataProfile.data!.userTime!;
    dateFormat.text = dataProfile.data!.userDate!;
    company.text = dataProfile.data!.company!.name!;
    department.text = dataProfile.data!.company!.name!;
    timeZone.text = dataProfile.data!.userTimezone!;
    phoneNumber.text = dataProfile.data!.phoneNumber!;
    print(dataProfile.data!.photos![0].url);
    print(dataProfile.data!.photos![0].downloadUrl);
    print(dataProfile.data!.photos![0].title);
  }

  void getImage(ImageSource imageSource) async {
    final pickedFile =
        await ImagePicker().pickImage(source: imageSource, imageQuality: 50);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value = selectedImagePath.value;
      List<int> imageBytes = File(selectedImagePath.value).readAsBytesSync();
      base64Image = base64Encode(imageBytes);

      final response = await Request().changePhotoProfile(
          base64Image, selectedImagePath.value.split('/').take(5).last);
      Get.showSnackbar(GetSnackBar(
        duration: Duration(seconds: 1),
        message: response['message'],
      ));
    } else {
      Get.showSnackbar(const GetSnackBar(
        duration: Duration(seconds: 1),
        message: 'No Image Selected',
      ));
    }
  }

  showPickImage(
    context,
  ) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Gallery'),
                      onTap: () {
                        getImage(ImageSource.gallery);
                        Get.back();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      getImage(ImageSource.camera);
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
