import 'package:assetdata/controller/login_controller.dart';
import 'package:assetdata/service/api_service.dart';
import 'package:assetdata/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _imgUrl = 'https://petronastest.assetdata.io/media/logos/assetdata.png';
    final controller = Get.put(LoginController());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: GetBuilder(
          init: LoginController(),
          builder: (context) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: Get.width / 1.5,
                        child: Image.network(_imgUrl),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SDTextFields(
                          controller: controller.emailController,
                          hintText: 'Enter your email'),
                      const SizedBox(
                        height: 15,
                      ),
                      SDTextFields(
                        controller: controller.passController,
                        obsecureText: true,
                        title: 'Pasword',
                        hintText: 'Enter your password',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            var _request = await Request().loginRequest(
                                email: controller.emailController.text,
                                password: controller.passController.text);
                            Get.showSnackbar(GetSnackBar(
                              duration: Duration(seconds: 1),
                              message: _request['message'],
                              backgroundColor: Colors.green,
                            ));
                            if (_request['message'] == 'success') {
                              Get.toNamed('/homepage');
                            }
                          },
                          child: SizedBox(
                              width: Get.width,
                              child: const Center(child: Text('Login'))))
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
