import 'dart:async';

import 'package:mymain/app/app.locator.dart';
import 'package:mymain/services/user_service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.router.dart';
import '../../../app/utils.dart';
import '../../../models/User.dart';

class SplashViewModel extends BaseViewModel {
  final userservice=locator<UserService>();
 Future<void> startTimer() async {
  var user=  await userservice.getuser();
   Timer(Duration(seconds: 4),() async {
     if(await userservice.islogin()){


       navigationService.pushNamedAndRemoveUntil(Routes.homeView,arguments: HomeViewArguments(username: "${user!.name!}"));
     }
     else{

       navigationService.pushNamedAndRemoveUntil(Routes.loginView);

     }


   });
 }
}
