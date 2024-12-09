import 'Data.dart';
import 'dart:convert';

GetAllProducts getAllProductsFromJson(String str) => GetAllProducts.fromJson(json.decode(str));
String getAllProductsToJson(GetAllProducts data) => json.encode(data.toJson());
class GetAllProducts {
  GetAllProducts({
      this.msg, 
      this.data,});

  GetAllProducts.fromJson(dynamic json) {
    msg = json['Msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Products.fromJson(v));
      });
    }
  }
  String? msg;
  List<Products>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Msg'] = msg;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}