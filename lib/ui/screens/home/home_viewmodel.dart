import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:mymain/app/app.locator.dart';
import 'package:mymain/services/api_service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.router.dart';
import '../../../app/utils.dart';
import '../../../models/getallproduct/Data.dart';

class HomeViewModel extends BaseViewModel {
late String username;

HomeViewModel({required this.username});
List<Products>?plist=[];

final apiservice=locator<ApiService>();

Future<void> getproducts() async {

  plist=await apiservice.getAllProducts();
  notifyListeners();
}


}
