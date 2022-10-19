// To parse this JSON data, do
//
//     final exploreEgyptModel = exploreEgyptModelFromJson(jsonString);

import 'dart:convert';

ExploreEgyptModel exploreEgyptModelFromJson(String str) =>
    ExploreEgyptModel.fromJson(json.decode(str));

String exploreEgyptModelToJson(ExploreEgyptModel data) =>
    json.encode(data.toJson());

class ExploreEgyptModel {
  ExploreEgyptModel({
    this.data,
  });

  List<Data>? data;

  factory ExploreEgyptModel.fromJson(Map<String, dynamic> json) =>
      ExploreEgyptModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Data {
  Data({
    this.id,
    this.name,
    this.description,
    this.details,
    this.photo,
  });

  int? id;
  String? name;
  String? description;
  dynamic details;
  String? photo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    details: json["details"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "details": details,
    "photo": photo,
  };
}
