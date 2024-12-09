
import 'package:mymain/ui/screens/login/login_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/api_service.dart';
import '../services/db.dart';

import '../services/user_service.dart';
import '../ui/screens/home/home_view.dart';
import '../ui/screens/splash/splash_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: LoginView,),
    MaterialRoute(page: HomeView,),
  ],
  dependencies: [
    LazySingleton(classType: ApiService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: Db),
    LazySingleton(classType: BottomSheetService),
  ],
)
class AppSetup {}
