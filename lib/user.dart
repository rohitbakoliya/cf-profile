import 'dart:convert';
import 'package:http/http.dart';
class User{
  String username;
  bool isItOk = true;
  Map data = {};
  User({this.username});
  Future<void> getInfo() async{
    try{
      Response response = await get('https://codeforces.com/api/user.info?handles=$username');
      data = jsonDecode(response.body);
      if(data['status']!='OK'){
        isItOk = false;
      }
    }
    catch(e){
      print(e.toString());
    }
  }
}