// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.data,
  });

  Data? data;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.guid,
    this.firstName,
    this.lastName,
    this.email,
    this.employeeNumber,
    this.phoneNumber,
    this.jobTitle,
    this.lastLogin,
    this.emailVerifiedAt,
    this.status,
    this.roleName,
    this.userStatus,
    this.userTimezone,
    this.userDate,
    this.userTime,
    this.registrationWizardStatus,
    this.roles,
    this.permissions,
    this.company,
    this.companyDepartment,
    this.photos,
    this.preference,
    this.assets,
    this.picVendor,
  });

  String? guid;
  String? firstName;
  String? lastName;
  String? email;
  dynamic employeeNumber;
  dynamic phoneNumber;
  String? jobTitle;
  DateTime? lastLogin;
  DateTime? emailVerifiedAt;
  int? status;
  String? roleName;
  String? userStatus;
  dynamic userTimezone;
  dynamic userDate;
  dynamic userTime;
  int? registrationWizardStatus;
  List<Permission>? roles;
  List<Permission>? permissions;
  Company? company;
  CompanyDepartment? companyDepartment;
  List<Photo>? photos;
  Preference? preference;
  Assets? assets;
  dynamic picVendor;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        guid: json["guid"] ?? 'Data Kosong',
        firstName: json["first_name"] ?? 'Data Kosong',
        lastName: json["last_name"] ?? 'Data Kosong',
        email: json["email"] ?? 'Data Kosong',
        employeeNumber: json["employee_number"] ?? 'Data Kosong',
        phoneNumber: json["phone_number"] ?? 'Data Kosong',
        jobTitle: json["job_title"] ?? 'Data Kosong',
        lastLogin: DateTime.parse(json["last_login"]),
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        status: json["status"] ?? 'Data Kosong',
        roleName: json["role_name"] ?? 'Data Kosong',
        userStatus: json["user_status"] ?? 'Data Kosong',
        userTimezone: json["user_timezone"] ?? 'Data Kosong',
        userDate: json["user_date"] ?? 'Data Kosong',
        userTime: json["user_time"] ?? 'Data Kosong',
        registrationWizardStatus:
            json["registration_wizard_status"] ?? 'Data Kosong',
        roles: List<Permission>.from(
            json["roles"].map((x) => Permission.fromJson(x))),
        permissions: List<Permission>.from(
            json["permissions"].map((x) => Permission.fromJson(x))),
        company: Company.fromJson(json["company"]),
        companyDepartment:
            CompanyDepartment.fromJson(json["company_department"]),
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        preference: Preference.fromJson(json["preference"]),
        assets: Assets.fromJson(json["assets"]),
        picVendor: json["pic_vendor"] ?? 'Data Kosong',
      );

  Map<String, dynamic> toJson() => {
        "guid": guid,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "employee_number": employeeNumber,
        "phone_number": phoneNumber,
        "job_title": jobTitle,
        "last_login": lastLogin?.toIso8601String(),
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "status": status,
        "role_name": roleName,
        "user_status": userStatus,
        "user_timezone": userTimezone,
        "user_date": userDate,
        "user_time": userTime,
        "registration_wizard_status": registrationWizardStatus,
        "roles": List<dynamic>.from(roles!.map((x) => x.toJson())),
        "permissions": List<dynamic>.from(permissions!.map((x) => x.toJson())),
        "company": company?.toJson(),
        "company_department": companyDepartment?.toJson(),
        "photos": List<dynamic>.from(photos!.map((x) => x.toJson())),
        "preference": preference?.toJson(),
        "assets": assets?.toJson(),
        "pic_vendor": picVendor,
      };
}

class Assets {
  Assets({
    this.data,
  });

  List<dynamic>? data;

  factory Assets.fromJson(Map<String, dynamic> json) => Assets(
        data: List<dynamic>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x)),
      };
}

class Company {
  Company({
    this.guid,
    this.name,
    this.isDefault,
  });

  String? guid;
  String? name;
  dynamic isDefault;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        guid: json["guid"] ?? 'Data Kosong',
        name: json["name"] ?? 'Data Kosong',
        isDefault: json["is_default"] ?? 'Data Kosong',
      );

  Map<String, dynamic> toJson() => {
        "guid": guid,
        "name": name,
        "is_default": isDefault,
      };
}

class CompanyDepartment {
  CompanyDepartment({
    this.guid,
    this.name,
  });

  String? guid;
  String? name;

  factory CompanyDepartment.fromJson(Map<String, dynamic> json) =>
      CompanyDepartment(
        guid: json["guid"] ?? 'Data Kosong',
        name: json["name"] ?? 'Data Kosong',
      );

  Map<String, dynamic> toJson() => {
        "guid": guid,
        "name": name,
      };
}

class Permission {
  Permission({
    this.id,
    this.name,
    this.label,
  });

  int? id;
  String? name;
  String? label;

  factory Permission.fromJson(Map<String, dynamic> json) => Permission(
        id: json["id"] ?? 'Data Kosong',
        name: json["name"] ?? 'Data Kosong',
        label: json["label"] ?? 'Data Kosong',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "label": label,
      };
}

class Photo {
  Photo({
    this.guid,
    this.title,
    this.tag,
    this.url,
    this.downloadUrl,
    this.isDefault,
    this.mimeType,
    this.type,
  });

  String? guid;
  String? title;
  dynamic tag;
  String? url;
  String? downloadUrl;
  int? isDefault;
  String? mimeType;
  String? type;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        guid: json["guid"] ?? 'Data Kosong',
        title: json["title"] ?? 'Data Kosong',
        tag: json["tag"] ?? 'Data Kosong',
        url: json["url"] ?? 'Data Kosong',
        downloadUrl: json["download_url"] ?? 'Data Kosong',
        isDefault: json["is_default"] ?? 'Data Kosong',
        mimeType: json["mime_type"] ?? 'Data Kosong',
        type: json["type"] ?? 'Data Kosong',
      );

  Map<String, dynamic> toJson() => {
        "guid": guid,
        "title": title,
        "tag": tag,
        "url": url,
        "download_url": downloadUrl,
        "is_default": isDefault,
        "mime_type": mimeType,
        "type": type,
      };
}

class Preference {
  Preference({
    this.keyTimezone,
    this.keyDateFormat,
    this.keyTimeFormat,
    this.timezone,
    this.dateFormat,
    this.timeFormat,
  });

  String? keyTimezone;
  String? keyDateFormat;
  String? keyTimeFormat;
  String? timezone;
  String? dateFormat;
  String? timeFormat;

  factory Preference.fromJson(Map<String, dynamic> json) => Preference(
        keyTimezone: json["key_timezone"] ?? 'Data Kosong',
        keyDateFormat: json["key_date_format"] ?? 'Data Kosong',
        keyTimeFormat: json["key_time_format"] ?? 'Data Kosong',
        timezone: json["timezone"] ?? 'Data Kosong',
        dateFormat: json["date_format"] ?? 'Data Kosong',
        timeFormat: json["time_format"] ?? 'Data Kosong',
      );

  Map<String, dynamic> toJson() => {
        "key_timezone": keyTimezone,
        "key_date_format": keyDateFormat,
        "key_time_format": keyTimeFormat,
        "timezone": timezone,
        "date_format": dateFormat,
        "time_format": timeFormat,
      };
}
