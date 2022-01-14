import 'package:assetdata/controller/form_brand_controller.dart';
import 'package:assetdata/model/manufacturer_model.dart';
import 'package:assetdata/service/api_service.dart';
import 'package:assetdata/widget/appbar.dart';
import 'package:assetdata/widget/textfield.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final controller = Get.put(AddFormController());

class AddFormBrand extends StatelessWidget {
  const AddFormBrand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar,
        body: GetBuilder(
            init: AddFormController(),
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(32.0),
                child: Obx(() => SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    'Choose Manufacturer',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '*',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                  width: Get.width,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlueAccent
                                          .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        hint: Text(
                                          controller.manufactureValue.value ==
                                                  ''
                                              ? 'Select Manufacturer'
                                              : controller
                                                  .manufactureValue.value,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        items: controller.data.value.data!
                                            .map((value) {
                                          return DropdownMenuItem<String>(
                                            value:
                                                value.guid! + '|' + value.name!,
                                            child: Text(value.name!),
                                          );
                                        }).toList(),
                                        onChanged: (_) async {
                                          controller.manufactureValue.value =
                                              _!.split('|')[1];
                                          controller.choosenManufactureGuid
                                              .value = _.split('|')[0];
                                          controller.getBrandFromManufacture(
                                              _.split('|')[0]);
                                        },
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Column(
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    'Choose Model',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '*',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                  width: Get.width,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlueAccent
                                          .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        hint: Text(
                                          controller.brandValue.value == ''
                                              ? 'Select Model'
                                              : controller.brandValue.value,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        items: controller.dataBrand.value.data!
                                            .map((value) {
                                          return DropdownMenuItem<String>(
                                            value:
                                                value.guid! + '|' + value.name!,
                                            child: Text(value.name!),
                                          );
                                        }).toList(),
                                        onChanged: (_) {
                                          controller.brandValue.value =
                                              _!.split('|')[1];
                                          controller.choosenBrandGuid.value =
                                              _.split('|')[0];
                                        },
                                      ),
                                    ),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          SDTextFields(
                            controller: controller.brandNameController,
                            title: 'Brand',
                            hintText: 'Enter your brand',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  onPressed: () async {
                                    controller.addBrand();
                                  },
                                  child: const Center(child: Text('Add'))),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.grey[200]),
                                  ),
                                  onPressed: () async {
                                    Get.back();
                                  },
                                  child: const Center(
                                      child: Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.black54),
                                  )))
                            ],
                          )
                        ],
                      ),
                    )),
              );
            }),
      ),
    );
  }
}
