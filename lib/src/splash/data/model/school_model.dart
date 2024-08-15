
import 'package:fushati/src/splash/domain/entities/school.dart';

class SchoolModel extends School {

  SchoolModel({
    required super.id,
    required super.name,
    required super.apiEndpoint,

  });

  factory SchoolModel.fromJson(Map<String, dynamic> json) => SchoolModel(
    id: json["id"],
    name: json["name"]??"School",
    apiEndpoint: json["api_endpoint"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "api_endpoint": apiEndpoint,

  };
}
