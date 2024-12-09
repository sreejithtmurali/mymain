import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../constants/assets.gen.dart';
import '../../tools/screen_size.dart';
import '../../widgets/shared.dart';
import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      onViewModelReady: (model) => {},
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(leading: backButton(color: Colors.red,onPressed: (){}),),
          body: Form(
            key: model.formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: model.name,
                    validator: (value){
                      if(value!.length==0){
                        return "must fill username";
                      }
                      else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "username",
                      prefixIcon: Icon(Icons.email)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: model.password,
                    validator: (value){
                      if(value!.length==0){
                        return "must fill username";
                      }
                      else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "username",
                        prefixIcon: Icon(Icons.email)
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                    child: TextButton(onPressed: (){}, child: Text("Forgot Password?"))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: ScreenSize.width,
                      height: 50,
                      child: ElevatedButton(onPressed: (){
                        model.login();
                      }, child: Text("Login"),
                      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )),)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Dont have account?"),
                TextButton(onPressed: (){}, child: Text("Sign Up"))],)

              ],
            ),
          ),


        );
      },
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
