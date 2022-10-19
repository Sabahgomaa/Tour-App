// To parse this JSON data, do
//
//     final exploreEgyptCities = exploreEgyptCitiesFromJson(jsonString);

import 'dart:convert';

ExploreEgyptCities exploreEgyptCitiesFromJson(String str) => ExploreEgyptCities.fromJson(json.decode(str));

String exploreEgyptCitiesToJson(ExploreEgyptCities data) => json.encode(data.toJson());

class ExploreEgyptCities {
  ExploreEgyptCities({
    this.data,
  });

  List<Datum>? data;

  factory ExploreEgyptCities.fromJson(Map<String, dynamic> json) => ExploreEgyptCities(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.city,
    this.description,
    this.attachments,
  });

  int? id;
  String? name;
  City? city;
  String? description;
  List<Attachment>? attachments;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    city: City.fromJson(json["city"]),
    description: json["description"],
    attachments: List<Attachment>.from(json["attachments"].map((x) => Attachment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "city": city!.toJson(),
    "description": description,
    "attachments": List<dynamic>.from(attachments!.map((x) => x.toJson())),
  };
}

class Attachment {
  Attachment({
    this.id,
    this.url,
    this.fileType,
  });

  int? id;
  String? url;
  FileType? fileType;

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
    id: json["id"],
    url: json["url"],
    fileType: fileTypeValues.map![json["file_type"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "file_type": fileTypeValues.reverse![fileType],
  };
}

// ignore: constant_identifier_names
enum FileType { IMAGE_JPEG }

final fileTypeValues = EnumValues({
  "image/jpeg": FileType.IMAGE_JPEG
});

class City {
  City({
    this.id,
    this.name,
    this.countryId,
  });

  int? id;
  String? name;
  int? countryId;

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    name: json["name"],
    countryId: json["country_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country_id": countryId,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
