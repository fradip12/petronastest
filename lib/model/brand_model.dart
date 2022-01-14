// To parse this JSON data, do
//
//     final brandModel = brandModelFromJson(jsonString);

import 'dart:convert';

BrandModel brandModelFromJson(String str) =>
    BrandModel.fromJson(json.decode(str));

String brandModelToJson(BrandModel data) => json.encode(data.toJson());

class BrandModel {
  BrandModel({
    this.data,
    this.links,
    this.meta,
  });

  List<Datum>? data;
  Links? links;
  Meta? meta;

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
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
  BrandModel.empty() : data = [];
}

class Datum {
  Datum({
    this.guid,
    this.name,
    this.manufacturer,
    this.createdAt,
    this.update,
  });

  String? guid;
  String? name;
  Manufacturer? manufacturer;
  DateTime? createdAt;
  DateTime? update;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        guid: json["guid"] == null ? null : json["guid"],
        name: json["name"] == null ? null : json["name"],
        manufacturer: json["manufacturer"] == null
            ? null
            : Manufacturer.fromJson(json["manufacturer"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        update: json["update"] == null ? null : DateTime.parse(json["update"]),
      );

  Map<String, dynamic> toJson() => {
        "guid": guid == null ? null : guid,
        "name": name == null ? null : name,
        "manufacturer": manufacturer == null ? null : manufacturer!.toJson(),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "update": update == null ? null : update!.toIso8601String(),
      };
}

class Manufacturer {
  Manufacturer({
    this.guid,
    this.name,
  });

  String? guid;
  String? name;

  factory Manufacturer.fromJson(Map<String, dynamic> json) => Manufacturer(
        guid: json["guid"] == null ? null : json["guid"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "guid": guid == null ? null : guid,
        "name": name == null ? null : name,
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
  dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"] == null ? null : json["first"],
        last: json["last"] == null ? null : json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first == null ? null : first,
        "last": last == null ? null : last,
        "prev": prev,
        "next": next,
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
