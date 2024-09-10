
import 'package:fushati/src/splash/domain/entities/min_version_response.dart';

class MinVersionResponseModel extends MinVersionResponse{

  MinVersionResponseModel({
    required super.minVersion,
    required super.storeId,
    required super.storeUrl,
  });

  factory MinVersionResponseModel.fromJson(Map<String, dynamic> json) => MinVersionResponseModel(
    minVersion: json["min_version"]??"1.0.0",
    storeId: json["store_id"]??"",
    storeUrl: json["store_url"]??"",
  );

}
