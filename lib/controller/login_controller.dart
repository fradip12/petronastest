import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    emailController.text = 'test_flutter@mailinator.com';
    passController.text =
        'VW1Gb1lYTnBZVEl3TWpJaEswSlNibkp2V1VGRWMyc2grWUFEc2shIQ==';
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
