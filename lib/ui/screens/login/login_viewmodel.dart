import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:mymain/app/app.locator.dart';
import 'package:mymain/services/api_service.dart';
import 'package:mymain/services/user_service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.router.dart';
import '../../../app/utils.dart';
import '../../../models/User.dart';

class LoginViewModel extends BaseViewModel {
  TextEditingController name=TextEditingController();
  TextEditingController password=TextEditingController();
  final formkey=GlobalKey<FormState>();
  final apiservice=locator<ApiService>();
  final userservice=locator<UserService>();

  Future<void> login() async {
    if(formkey.currentState!.validate()){
    User? user=await  apiservice.login(email: name.text, password: password.text);
          if(user!=null) {

            userservice.saveuser(user);

            navigationService.navigateTo(
                Routes.homeView, arguments: HomeViewArguments(username: user.name!));
          }
    }

  }

}
