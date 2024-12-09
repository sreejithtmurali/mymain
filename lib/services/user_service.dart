

import 'dart:convert';

import 'package:mymain/app/app.router.dart';
import 'package:mymain/app/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/User.dart';

class UserService {
  static const String _userKey = 'user_data';
  Future<void> saveuser(User user) async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setString(_userKey, jsonEncode({user.toJson()}));
  }

  Future<User?> getuser() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    var data=pref.getString(_userKey);
    var user=User.fromJson(data);
    if(user!=null){
      return user;
    }
    else{
      return null;
    }
  }
  Future<bool> islogin() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    bool status=pref.containsKey(_userKey);
    return status;
  }

  Future<void> logout() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.remove(_userKey);
    pref.clear();
    navigationService.pushNamedAndRemoveUntil(Routes.loginView);
  }


}
