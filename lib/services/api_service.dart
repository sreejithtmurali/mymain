import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mymain/app/app.locator.dart';
import 'package:mymain/models/getallproduct/AllproductsResp.dart';
import 'package:mymain/models/getallproduct/Data.dart';
//import 'package:mymain/models/getallproduct/GetAllProducts.dart';
import 'package:mymain/services/user_service.dart';
//import 'package:mymain/service/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/User.dart';
import '../models/errorresp.dart';
import '../models/getallproduct/Data.dart';
import '../models/login_response.dart';
import '../models/successresponsemodel.dart';



class ApiService {
  final String _baseUrl = 'https://freeapi.luminartechnohub.com';

   final userPreferences=locator<UserService>();

  final headers = {
    'accept': 'application/json',
    'Content-Type': 'application/json',
  };
  //final authheaders = {
  //     'accept': 'application/json',
  //     'Content-Type': 'application/json',
  //     'Authorization':'Bearer ${user.access!}'
  //   };

  Future<User> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$_baseUrl/login');

    final body = jsonEncode({
      "email": email,
      "password": password,
    });


    try {
      final response = await http.post(
          url,
          headers: headers,
          body: body
      );

      if (response.statusCode>=200 && response.statusCode<=299)
      {
        print(response.body);
        return User.fromJson(jsonDecode(response.body));
      }
      else
      {
        throw Exception('Failed to login. Please check your credentials.');
      }
    } catch (error) {
      throw Exception('Failed to login: $error');
    }
  }

  Future<List<Products>?> getAllProducts()  async {
    final url = Uri.parse('$_baseUrl/my-products/');
     var user=await userPreferences.getuser();
     print("Name:::::::::::${user!.name}");

   if(user!=null){
     final header={
       'accept': 'application/json',
       'Content-Type': 'application/json',
       'Authorization': 'Bearer ${user?.access}'
     };
     print(header.toString());
     print(url.toString());
     try{
       final response=await http.get(url,headers: header);
       print("response:${response.body}");
       if(response.statusCode>=200 && response.statusCode<=299){
         var json=jsonDecode(response.body);

         return AllproductsResp.fromJson(json).data;

       }

     }catch(e){

     }
   }

  }













  Future<dynamic> registerUser({
    required String name,
    required int phone,
    required String place,
    required int pincode,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$_baseUrl/registration/');

    final body = jsonEncode({
      "name": name,
      "phone": phone,
      "place": place,
      "pincode": pincode,
      "email": email,
      "password": password,
    });

    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    print("body:${body},headers:${headers}");

    try {
      final response = await http.post(url, headers: headers, body: body);
      print(response.body);
      if (response.statusCode>=200 && response.statusCode<=299) {
        return SuccessResponse.fromJson(jsonDecode(response.body));
      } else {
        return ErrorResponse.fromJson(jsonDecode(response.body));
      }
    } catch (error) {
      // Handle other exceptions such as network errors
      throw Exception('Failed to register user: $error');
    }
  }





















  Future<SuccessResponse?> reguser({required String name,
    required int phone, required String place,
    required int pin, required String email,
    required String password}) async {

    final url = Uri.parse('$_baseUrl/registration');
    final Map<String,String> headers={
      'accept': 'application/json',
      'Content-Type': 'application/json'
    };
    final body=jsonEncode({
      "name": "$name",
      "phone": phone,
      "place": "$place",
      "pincode": pin,
      "email": "$email",
      "password": "$password"
    });

    try{
      final response=await http.post(url,headers:headers ,body:body );
      if(response.statusCode>=200 && response.statusCode<=299){
        return SuccessResponse.fromJson(jsonDecode(response.body));
      }

    }catch(e){
      print("Error:$e");
    }
  }


}
