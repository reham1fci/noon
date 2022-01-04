
import 'package:flutter/material.dart';
import 'package:noon/Screens/NavigationDrawer.dart';
import 'package:noon/app_localizations.dart';
import 'package:noon/my_colors.dart';

class Main  extends StatefulWidget{
  const Main({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainState();
  }

}class MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
        appBar:  AppBar(backgroundColor: MyColors.colorPrimary,
            title:Text(AppLocalizations.of(context)?.translate("home") ?? "",)),

        backgroundColor: MyColors.white,
        drawer: NavigationDrawer(),
        body: Center(child: Text("This is home page")));
  }

}