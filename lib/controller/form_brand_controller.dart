import 'package:assetdata/model/brand_model.dart';
import 'package:assetdata/model/manufacturer_model.dart';
import 'package:assetdata/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class AddFormController extends GetxController {
  late final Rx<ManufactureModel> data;
  late final Rx<BrandModel> dataBrand;
  final choosenManufacture = ''.obs;
  final choosenManufactureGuid = ''.obs;
  final choosenBrand = ''.obs;
  final choosenBrandGuid = ''.obs;
  final TextEditingController brandNameController = TextEditingController();
  var manufactureValue = ''.obs;
  var brandValue = ''.obs;
  @override
  void onInit() async {
    data = ManufactureModel().obs;
    dataBrand = BrandModel.empty().obs;
    final _data = await Request().getManufacturerItem(page: 1, limit: 100);
    data.value = _data;
    super.onInit();
  }

  void getBrandFromManufacture(String _) async {
    final _databrand = await Request().getBrandModel(_);
    if (_databrand.data!.isEmpty) {
      Get.showSnackbar(const GetSnackBar(
        duration: Duration(seconds: 1),
        message: 'Brand kosong',
        backgroundColor: Colors.red,
      ));
      dataBrand.value = BrandModel.empty();
    } else {
      dataBrand.value = _databrand;
    }
  }

  void addBrand() async {
    final response = await Request().addBrand(
        guid: choosenManufactureGuid.value,
        modelGuid: choosenBrandGuid.value,
        name: brandNameController.text);
    Get.showSnackbar(GetSnackBar(
      duration: Duration(seconds: 1),
      message: response['message'],
    ));
  }

  @override
  void dispose() {
    brandNameController.dispose();
    choosenBrand.value = '';
    choosenManufacture.value = '';
    super.dispose();
  }
}
