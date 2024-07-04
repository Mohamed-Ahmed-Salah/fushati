import 'dart:convert';


import '../../domain/entities/user.dart';


class UserModel extends User {


  UserModel({
    required super.customerStatus,
    required super.apiToken,
    required super.customer,
  });

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    customerStatus: json["customer_status"],
    apiToken: json["api-token"],
    customer: CustomerModel.fromJson(json["customer"]),
  );

  Map<String, dynamic> toJson() => {
    "customer_status": customerStatus,
    "api-token": apiToken,
    "customer": customer.toJson(),
  };

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CustomerModel extends Customer{


  CustomerModel({
    required super.id,
    required super.username,
    required super.birthdate,
    required super.gender,
    required super.walletAmount,
    required super.email,
    required super.phone,
    required super.workplace,
  });

  factory CustomerModel.fromRawJson(String str) => CustomerModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
    id: json["id"],
    username: json["username"]??"",
    birthdate: DateTime.parse(json["birthdate"]??DateTime.now().toString()),
    gender: json["gender"]??"",
    walletAmount: json["wallet_amount"]??"",
    email: json["email"]??"",
    phone: json["phone"]??"",
    workplace: json["workplace"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "birthdate": birthdate.toIso8601String(),
    "gender": gender,
    "wallet_amount": walletAmount,
    "email": email,
    "phone": phone,
    "workplace": workplace,
  };
}

//
//
// class UserModel extends User {
//   UserModel({
//     required super.id,
//     required super.name,
//     required super.customerStatus,
//     required super.apiToken,
//   });
//
//   UserModel.empty()
//       : this(id: 0, customerStatus: 0, apiToken: "Test String", name: "name");
//
//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         customerStatus: json["customer_status"],
//         apiToken: json["api-token"],
//         id: json["customer_id"],
//         name: json["customer_name"]??"",
//       );
//
//   UserModel copyWith(
//       {int? id, int? customerStatus, String? apiToken, String? name}) {
//     return UserModel(
//         id: id ?? this.id,
//         apiToken: apiToken ?? this.apiToken,
//         customerStatus: customerStatus ?? this.customerStatus,
//         name: name ?? this.name);
//   }
//
//   DataMap toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'customer_status': customerStatus,
//       'api-token': apiToken,
//       "customer_name": name
//     };
//   }
//
//   String toJson() => jsonEncode(toMap());
// }
