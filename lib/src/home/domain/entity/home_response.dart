// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:fushati/src/home/domain/entity/card.dart';


class HomeResponse {
  final int currentPage;
  final List<CardEntity> cards;
  final int lastPage;

  HomeResponse({
    required this.currentPage,
    required this.cards,
    required this.lastPage,
  });



}
