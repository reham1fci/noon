
import 'dart:convert';

import 'package:noon/Model/User.dart';
import 'package:noon/Tools/Constant.dart';
import 'package:http/http.dart'  as http ;

class Api {
  Future login({  required String userId ,  required String password  ,  required String orgId, required Function  onLogin  ,
    required Function onError}  )async{
    User mUser =  User.login(userId , password , orgId) ;
    //String mobileMacID  = await _getId();
    http.post(Uri.parse(USERS_URL) ,body  : mUser.toMap() ) .then((http.Response response) {
      print(response)  ;
      print(response.statusCode)  ;
      print(response.body)  ;
      if(response.statusCode == 200) {
        String jsonStr = json.decode(response.body);
        var jsonObj = json.decode(jsonStr);
        String  msg  = jsonObj['Msg']  ;
        print(msg)  ;
        if(msg  == "Success") {
          print(jsonObj) ;
          User c = User.fromJson(jsonObj,userId , password , orgId ) ;
          onLogin(c)  ;
          return c ;
        }
        else
        {
          onError(msg) ;
          return null  ;
        }
      }
      else {
        onError("Connection Error") ;
        return null ;
      }

    }
    );

  }}