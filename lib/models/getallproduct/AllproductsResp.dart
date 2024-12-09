import 'Data.dart';
import 'dart:convert';

AllproductsResp allproductsRespFromJson(String str) => AllproductsResp.fromJson(json.decode(str));
String allproductsRespToJson(AllproductsResp data) => json.encode(data.toJson());
class AllproductsResp {
  AllproductsResp({
      this.msg, 
      this.data,});

  AllproductsResp.fromJson(dynamic json) {
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