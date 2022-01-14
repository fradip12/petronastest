import 'dart:convert';
import 'dart:io';
import 'package:assetdata/model/brand_model.dart';
import 'package:assetdata/model/manufacturer_model.dart';
import 'package:assetdata/model/profile_model.dart';
import 'package:http/http.dart' as http;

var bearerToken = '';

class Request {
  var mainUrl = 'https://petronastest.be.assetdata.io/api/v1';

  loginRequest({String? email, String? password}) async {
    final data = {
      'email': email ?? "test_flutter@mailinator.com",
      'expire': 4000,
      'password': password ??
          "VW1Gb1lYTnBZVEl3TWpJaEswSlNibkp2V1VGRWMyc2grWUFEc2shIQ==",
      'type': "manual"
    };
    var url = Uri.parse('$mainUrl/a/hash-login');
    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );
      bearerToken = jsonDecode(response.body)["token"];
      return {'message': 'success', 'data': jsonDecode(response.body)};
    } catch (e) {
      return {'message': 'error'};
    }
  }

  Future<ProfileModel> getProfile() async {
    var url = Uri.parse('$mainUrl/a/me');
    try {
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearerToken',
      });
      ProfileModel _dataProfile = profileModelFromJson(response.body);
      return _dataProfile;
    } catch (e) {
      print(e);
      return ProfileModel();
    }
  }

  Future<ManufactureModel> getManufacturerItem({int? page, int? limit}) async {
    var url = Uri.parse(
        '$mainUrl/setting/manufacturer/filter?page=$page&limit=$limit&orderDir=asc&orderCol=name');
    try {
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearerToken',
      });
      return manufactureModelFromJson(response.body);
    } catch (e) {
      return ManufactureModel();
    }
  }

  addBrand({String? name, String? guid, String? modelGuid}) async {
    var url = Uri.parse('$mainUrl/setting/manufacturer/brand');
    var data = {
      'brands': [
        {'name': name}
      ],
      'manufacturer_guid': guid,
      'manufacturer_model_guid': modelGuid,
      'name': name
    };
    try {
      var response = await http.post(url, body: jsonEncode(data), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearerToken',
      });
      return jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  Future<BrandModel> getBrandModel(String guid) async {
    var url = Uri.parse(
        '$mainUrl/setting/manufacturer/model/filter?filter[manufacturer_guid]=$guid');
    try {
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearerToken',
      });
      return brandModelFromJson(response.body);
    } catch (e) {
      return BrandModel();
    }
  }

  Future<Map<String, dynamic>> changePhotoProfile(
      String image, String name) async {
    var url = Uri.parse('$mainUrl/a/me/avatar');
    print('add photo data');
    print({'data': image, 'title': '$name.jpg'});
    try {
      var response = await http.put(url,
          body: jsonEncode(
              {'data': "data:image/jpeg;base64/$image", 'title': '$name.jpeg'}),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $bearerToken',
          });
      print(response.statusCode);
      print(response.body);
      return jsonDecode(response.body);
    } catch (e) {
      return {'message': 'Error Uploaded'};
    }
  }
}
