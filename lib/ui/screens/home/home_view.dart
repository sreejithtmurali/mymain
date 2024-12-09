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
      onViewModelReady: (model)  {
        model.getproducts();
      },
      builder: (BuildContext context, HomeViewModel model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Hai $username"),
          ),
          body: ListView.builder(itemCount: model.plist!.length,
            itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Text("${index}"),
              title: Text("${model.plist![index].name}"),
              subtitle: Text("${model.plist![index].description}"),
            );
            },),

        );
      },
      viewModelBuilder: () => HomeViewModel(username: username),
    );
  }
}
