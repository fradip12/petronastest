// To parse this JSON data, do
//
//     final manufactureModel = manufactureModelFromJson(jsonString);

import 'dart:convert';

ManufactureModel manufactureModelFromJson(String str) =>
    ManufactureModel.fromJson(json.decode(str));

String manufactureModelToJson(ManufactureModel data) =>
    json.encode(data.toJson());

class ManufactureModel {
  ManufactureModel({
    this.data,
    this.links,
    this.meta,
  });

  List<Datum>? data;
  Links? links;
  Meta? meta;

  factory ManufactureModel.fromJson(Map<String, dynamic> json) =>
      ManufactureModel(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links == null ? null : links!.toJson(),
        "meta": meta == null ? null : meta!.toJson(),
      };
}

class Datum {
  Datum({
    this.guid,
    this.name,
    this.description,
    this.status,
    this.models,
    this.createdAt,
    this.updatedAt,
  });

  String? guid;
  String? name;
  String? description;
  int? status;
  List<Model>? models;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        guid: json["guid"] == null ? null : json["guid"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        status: json["status"] == null ? null : json["status"],
        models: json["models"] == null
            ? null
            : List<Model>.from(json["models"].map((x) => Model.fromJson(x))),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "guid": guid == null ? null : guid,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "status": status == null ? null : status,
        "models": models == null
            ? null
            : List<dynamic>.from(models!.map((x) => x.toJson())),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}

class Model {
  Model({
    this.guid,
    this.manufacturerGuid,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.isConflict,
  });

  String? guid;
  String? manufacturerGuid;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic isConflict;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        guid: json["guid"] == null ? null : json["guid"],
        manufacturerGuid: json["manufacturer_guid"] == null
            ? null
            : json["manufacturer_guid"],
        name: json["name"] == null ? null : json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        isConflict: json["is_conflict"],
      );

  Map<String, dynamic> toJson() => {
        "guid": guid == null ? null : guid,
        "manufacturer_guid": manufacturerGuid == null ? null : manufacturerGuid,
        "name": name == null ? null : name,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "is_conflict": isConflict,
      };
}

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String? first;
  String? last;
  dynamic prev;
  String? next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"] == null ? null : json["first"],
        last: json["last"] == null ? null : json["last"],
        prev: json["prev"],
        next: json["next"] == null ? null : json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first == null ? null : first,
        "last": last == null ? null : last,
        "prev": prev,
        "next": next == null ? null : next,
      };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int? currentPage;
  int? from;
  int? lastPage;
  List<Link>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"] == null ? null : json["current_page"],
        from: json["from"] == null ? null : json["from"],
        lastPage: json["last_page"] == null ? null : json["last_page"],
        links: json["links"] == null
            ? null
            : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"] == null ? null : json["path"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        to: json["to"] == null ? null : json["to"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage == null ? null : currentPage,
        "from": from == null ? null : from,
        "last_page": lastPage == null ? null : lastPage,
        "links": links == null
            ? null
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "path": path == null ? null : path,
        "per_page": perPage == null ? null : perPage,
        "to": to == null ? null : to,
        "total": total == null ? null : total,
      };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  dynamic label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"],
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label,
        "active": active == null ? null : active,
      };
}
