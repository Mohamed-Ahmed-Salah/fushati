// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:fushati/src/home/data/models/card_model.dart';
import 'package:fushati/src/home/domain/entity/card.dart';
import 'package:fushati/src/home/domain/entity/home_response.dart';

class HomeResponseModel extends HomeResponse {
  HomeResponseModel({
    required super.currentPage,
    required super.cards,
    required super.lastPage,
  });

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeResponseModel(
        currentPage: json["current_page"] ?? 1,
        cards: json["data"] == null || json["data"]?.length == 0
            ? []
            : List<CardEntity>.from(
                json["data"].map((x) => CardModel.fromJson(x))),
        lastPage: json["last_page"] ?? 1,
      );
}
