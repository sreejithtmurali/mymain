import 'dart:async';

import 'package:stacked/stacked.dart';

import '../../../app/app.router.dart';
import '../../../app/utils.dart';

class SplashViewModel extends BaseViewModel {
 void startTimer(){
   Timer(Duration(seconds: 4),(){
     navigationService.pushNamedAndRemoveUntil(Routes.loginView);
   });
 }
}
