// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

TourismResult welcomeFromJson(String str) => TourismResult.fromJson(json.decode(str));

String welcomeToJson(TourismResult data) => json.encode(data.toJson());

class TourismResult {
  TourismResult({
    required this.statusCode,
    required this.listData,
  });

  int statusCode;
  List<ListData> listData;

  factory TourismResult.fromJson(Map<String, dynamic> json) => TourismResult(
    statusCode: json["statusCode"],
    listData: List<ListData>.from(json["listData"].map((x) => ListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "listData": List<dynamic>.from(listData.map((x) => x.toJson())),
  };
}

class ListData {
  ListData({
    required this.id,
    required this.tourismName,
    required this.tourismDescription,
    required this.tourismLocation,
    required this.tourismTicketPrice,
    required this.tourismWorkingHours,
    required this.tourismOpenDays,
    required this.tourismImg,
    required this.createdAt,
    required this.updatedAt,
    required this.tourismImgList,
  });

  int id;
  String tourismName;
  String tourismDescription;
  String tourismLocation;
  int tourismTicketPrice;
  String tourismWorkingHours;
  String tourismOpenDays;
  String tourismImg;
  dynamic createdAt;
  dynamic updatedAt;
  List<String> tourismImgList;

  factory ListData.fromJson(Map<String, dynamic> json) => ListData(
    id: json["id"],
    tourismName: json["tourism_name"],
    tourismDescription: json["tourism_description"],
    tourismLocation: json["tourism_location"],
    tourismTicketPrice: json["tourism_ticket_price"],
    tourismWorkingHours: json["tourism_working_hours"],
    tourismOpenDays: json["tourism_open_days"],
    tourismImg: json["tourism_img"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    tourismImgList: List<String>.from(json["tourism_img_list"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tourism_name": tourismName,
    "tourism_description": tourismDescription,
    "tourism_location": tourismLocation,
    "tourism_ticket_price": tourismTicketPrice,
    "tourism_working_hours": tourismWorkingHours,
    "tourism_open_days": tourismOpenDays,
    "tourism_img": tourismImg,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "tourism_img_list": List<dynamic>.from(tourismImgList.map((x) => x)),
  };
}
