import 'package:assetdata/constant/config.dart';
import 'package:assetdata/controller/form_brand_controller.dart';
import 'package:assetdata/controller/profil_controller.dart';
import 'package:assetdata/widget/appbar.dart';
import 'package:assetdata/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';

final controller = Get.put(ProfilController());

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar,
        body: GetBuilder(
            init: ProfilController(),
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => ProfilArea(
                          name: controller.firstName.text +
                              ' ' +
                              controller.lastName.text,
                          email: controller.email.value,
                          imageUrl: controller.photos.value)),
                      const SizedBox(
                        height: 8,
                      ),
                      SDTextFields(
                          title: 'First Name',
                          controller: controller.firstName,
                          hintText: 'Enter your email'),
                      SDTextFields(
                          title: 'Last Name',
                          controller: controller.lastName,
                          hintText: 'Enter your email'),
                      SDTextFields(
                          title: 'Job Title',
                          controller: controller.jobTitle,
                          hintText: 'Enter your email'),
                      SDTextFields(
                          title: 'Employee ID',
                          controller: controller.employeeId,
                          hintText: 'Enter your email'),
                      SDTextFields(
                          title: 'Time Format',
                          controller: controller.timeFormat,
                          hintText: 'Enter your email'),
                      SDTextFields(
                          title: 'Date Format',
                          controller: controller.dateFormat,
                          hintText: 'Enter your email'),
                      SDTextFields(
                          title: 'Company',
                          controller: controller.company,
                          hintText: 'Enter your email'),
                      SDTextFields(
                          title: 'Department',
                          controller: controller.department,
                          hintText: 'Enter your email'),
                      SDTextFields(
                          title: 'Time Zone',
                          controller: controller.timeZone,
                          hintText: 'Enter your email'),
                      SDTextFields(
                          title: 'Phone Number',
                          controller: controller.phoneNumber,
                          hintText: 'Enter your email'),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class ProfilArea extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final String? email;
  const ProfilArea({Key? key, this.imageUrl, this.name, this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            color: Colors.blue[50],
            elevation: 1,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                    width: Get.width / 4,
                    height: Get.width / 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white, width: 3)),
                    child: (imageUrl != null || imageUrl!.isEmpty)
                        ? Image.network(imageUrl!)
                        : Icon(
                            FontAwesome5.user,
                            size: Get.width / 8,
                            color: Colors.blue,
                          )),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.showPickImage(context);
                      },
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3)),
                          child: Icon(
                            Icons.add_circle,
                            size: 15,
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3)),
                        child: const Icon(
                          Icons.cancel,
                          size: 15,
                        )),
                  ],
                )
              ],
            )),
        const SizedBox(
          width: 25,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name ?? 'user', style: textBold),
            Text(
              email ?? 'user',
              style: text600,
            ),
          ],
        ),
      ],
    );
  }
}
