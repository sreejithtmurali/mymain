import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../constants/assets.gen.dart';
import '../../tools/screen_size.dart';
import 'myframe_viewmodel.dart';

class MyFrameView extends StatelessWidget {
  const MyFrameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyFrameViewModel>.reactive(
      onViewModelReady: (model) => {},
      builder: (context, model, child) {
        return Scaffold(

        );
      },
      viewModelBuilder: () => MyFrameViewModel(),
    );
  }
}
