import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../constants/assets.gen.dart';
import '../../tools/screen_size.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  late String username;
   HomeView({Key? key,required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onViewModelReady: (model) => {},
      builder: (BuildContext context, HomeViewModel model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Hai $username"),
          ),

        );
      },
      viewModelBuilder: () => HomeViewModel(username: username),
    );
  }
}
