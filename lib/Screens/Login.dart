import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:noon/ApiConnection/Api.dart';
import 'package:noon/Model/User.dart';
import 'package:noon/Screens/Main.dart';
import 'package:noon/Tools/Methods.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_localizations.dart';
import '../my_colors.dart';

class Login  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return   LoginState()  ;
  }

}
class LoginState  extends State<Login>{
  TextEditingController userNameEd  =  TextEditingController()  ;
  TextEditingController passEd  =  TextEditingController()  ;
  TextEditingController orgEd  =  TextEditingController()  ;
  String nameError ="" , passError = ""  , orgIdError="" ;
  late SharedPreferences sharedPrefs ;
  bool loading = false ;
  Api api  =  Api();
  bool invoicesFound  = false  ;
  Methods methodsTool = Methods() ;
  late User  user;
  bool  loginDataEnable  = true ;
  bool  connectionData  = false ;
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar:  AppBar(backgroundColor: MyColors.colorPrimary,),
backgroundColor: MyColors.white,
      body:   Center(

          child:   Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              loading? const Center(
                child: CircularProgressIndicator(),
              ): const SizedBox(),
            Padding(padding: const EdgeInsets.only(bottom: 20.0) , child: Image.asset('images/logo.png'  , height: 170, )),
              orgIdEdFun(),
              userNameEdFun(),
              passEdFun(),
              loginBtn(),


            ],)),
    )  ;
  }
  void onLoginBtn() {
    methodsTool.checkInternet(onConnect: () {
      setState(() {
        String userId  = userNameEd.text ;
        String password  = passEd.text ;
        String orgId     =  orgEd.text ;
        setState(() {
          bool isValidate =   loginValidation(userId ,password , orgId)  ;
          if(isValidate){
            loading = true  ;
            api.login(userId:userId , orgId:orgId , onError:  (String errorMsg
                ){
              methodsTool.Dialog(context: context  , title: AppLocalizations.of(context)?.translate("error")??"error"
                  , isCancelBtn: false ,message:errorMsg  , onOkClick: (){} ) ;
            }

                , onLogin:
            onLogin, password: password) ;
          }
          else{
            methodsTool.Dialog(context: context  , title: AppLocalizations.of(context)?.translate("error")??"error"
          , isCancelBtn: false ,message:AppLocalizations.of(context)?.translate("fill_data")??"error"  , onOkClick: (){} ) ;
          }
        });

      });
    },notConnect: (){
      methodsTool.Dialog(context: context  , title: AppLocalizations.of(context)?.translate("error")??"error"
          , isCancelBtn: false ,message:AppLocalizations.of(context)?.translate("no_internet")??"No Internet Connection"  , onOkClick: (){} ) ;

  });


  }
  void onLogin (User  user ) {
    setState(() {
      loading = false ;
      print(user.toString());
      saveUserData(user);
      Navigator.pushReplacement( context,
          MaterialPageRoute(builder: (context) => Main())) ;
    });
  }
  void saveUserData (User user )async {
    sharedPrefs = await SharedPreferences.getInstance();
   // Setting setting  = Setting(currency:"ريال"  , discountIsPer: true , priceWTax:false , taxPer:15.0 ) ;
    //sharedPrefs.setString("setting", json.encode(setting.toJsonShared()) );
    sharedPrefs.setString("user", json.encode(user.toJson()) );
  }

  bool loginValidation (String name  , String password , String orgId){
    if(name.isEmpty) {
      return false  ;
    }
    else if(password.isEmpty){
      return false  ;
    }
    else if(orgId.isEmpty){
      return false  ;
    }
    else{
      return true ;}

  }



  Padding loginBtn() {
    return  Padding (padding: const EdgeInsets.only(bottom: 8.0 , left: 40.0  , right: 40.0 , top: 8.0),child: Container(
      decoration:  const BoxDecoration(color:MyColors.colorPrimary
          , borderRadius:   BorderRadius.all(
            Radius.circular(8.0),)
      ),
      width  :   double.infinity,
      child  :    TextButton(
        onPressed: onLoginBtn ,
        child:  Text(AppLocalizations.of(context)?.translate("login") ??"", style:   const TextStyle(color: Colors.white),),
      ) ,
    ) )
    ;
  }

  Padding userNameEdFun() {
    return  Padding(padding: const EdgeInsets.only(bottom: 8.0 , left: 30.0  , right: 30.0 , top: 8.0) ,
      child:   TextField(controller:  userNameEd,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)?.translate("user_id") ,
            fillColor: Colors.white,
            filled: false,
            enabled: loginDataEnable,
            errorText: nameError,
            prefixIcon:Image.asset('images/user_icon.png',color: MyColors.colorPrimary) ,
          )
      ),)

    ;
  }
  Padding orgIdEdFun() {
    return  Padding(padding: const EdgeInsets.only(bottom: 8.0 , left: 30.0  , right: 30.0 , top: 30.0) ,
      child:   TextField(controller:  orgEd,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)?.translate("org_id") ,
            fillColor: Colors.white,
            filled: false,
            enabled: loginDataEnable,
            errorText: orgIdError,
            prefixIcon:Image.asset('images/user_icon.png',color: MyColors.colorPrimary) ,
          )
      ),)

    ;
  }
  Padding passEdFun() {
    return   Padding(padding:const EdgeInsets.only(bottom: 8.0 , left: 30.0  , right: 30.0 , top: 8.0) ,
        child:
        TextField(controller:  passEd,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)?.translate("password"),
            fillColor: Colors.white,
            filled: false,
            errorText: passError,
            enabled: loginDataEnable,
            prefixIcon:Image.asset('images/pass_icon.png' ,color: MyColors.colorPrimary,) ,
          ) ,) )
    ;
  }

}