

import 'dart:convert';

import 'package:mymain/app/app.router.dart';
import 'package:mymain/app/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/User.dart';

class UserService {
  static const String _userKey = 'user_data';
  Future<void> saveuser(User user) async {
    print("calling is save ");
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setString(_userKey,jsonEncode(user.toJson()));
    print("data saved::::::::${jsonEncode(user.toJson())} ");
  }

  Future<User?> getuser() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    var data=await pref.getString(_userKey);
    if (data == null) {return null;}
    else {
      var user= await User.fromJson(jsonDecode(data));
      return user;
    }

  }
  Future<bool> islogin() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    bool status=pref.containsKey(_userKey);
    print("calling is login $status");
    return status;
  }
  Future<String?> gettoken() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    var data=pref.getString(_userKey);
    var user=User.fromJson(data);
    return user.access;
  }

  Future<void> logout() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.remove(_userKey);
    pref.clear();
    navigationService.pushNamedAndRemoveUntil(Routes.loginView);
  }


}
