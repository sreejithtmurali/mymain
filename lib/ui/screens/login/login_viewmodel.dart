import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.router.dart';
import '../../../app/utils.dart';

class LoginViewModel extends BaseViewModel {
  TextEditingController name=TextEditingController();
  TextEditingController password=TextEditingController();
  final formkey=GlobalKey<FormState>();

  void login(){
    if(formkey.currentState!.validate()){
      navigationService.navigateTo(Routes.homeView,arguments: HomeViewArguments(username: name.text));
    }

  }

}
