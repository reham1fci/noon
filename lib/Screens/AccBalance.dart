
import 'package:flutter/material.dart';
import 'package:noon/Screens/NavigationDrawer.dart';
import 'package:noon/app_localizations.dart';
import 'package:noon/my_colors.dart';
class AccBalance extends StatefulWidget  {
   AccBalance({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BalanceState();
  }

}

class BalanceState extends State<AccBalance> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return  Scaffold(
        appBar:  AppBar(backgroundColor: MyColors.colorPrimary,title:Text( AppLocalizations.of(context)?.translate("balances") ?? "",)),

    backgroundColor: MyColors.white,
        drawer: NavigationDrawer(),

        body:  Table(
      border: TableBorder.all(color: MyColors.logRed),

      children: [
        TableRow(
decoration: BoxDecoration(color: MyColors.colorPrimary ),
          children: [
            Padding(padding:const EdgeInsets.all(10.0), child: Center(child:Text(AppLocalizations.of(context)?.translate("process") ?? "" ,   style: TextStyle(color: MyColors.white),) ,) ),
    Padding(padding:const EdgeInsets.all(10.0), child: Center(child:Text(AppLocalizations.of(context)?.translate("bank") ?? "" ,   style: TextStyle(color: MyColors.white),) ,) ),
    Padding(padding:const EdgeInsets.all(10.0), child: Center(child:Text(AppLocalizations.of(context)?.translate("fund") ?? "",  style: TextStyle(color: MyColors.white))) ),

          ]
        ),
        TableRow(
          children: [
        Container(color: MyColors.colorPrimary, child:   Padding(padding:const EdgeInsets.all(10.0), child:
           Text(AppLocalizations.of(context)?.translate("opening") ?? "" , style: TextStyle(color: MyColors.white)))) ,
          const Padding(padding: EdgeInsets.all(10.0),child: Center( child:  Text("5000" ,   style: TextStyle(color: MyColors.logRed)) )),
            const Padding(padding: EdgeInsets.all(10.0),child: Center( child:  Text("1000",   style: TextStyle(color: MyColors.logRed)) )),

          ]
        ),  TableRow(
          children: [
       Container(color: MyColors.colorPrimary, child: Padding(padding:const EdgeInsets.all(10.0),child:
    Text(AppLocalizations.of(context)?.translate("movement") ?? "" ,style: TextStyle(color: MyColors.white) ) ,)),
            const Padding(padding: EdgeInsets.all(10.0), child: Center(child:  Text("23455" , style: TextStyle(color: MyColors.logRed)) )),
            const Padding(padding: EdgeInsets.all(10.0), child: Center(child:  Text("67677" , style: TextStyle(color: MyColors.logRed))) ),

          ]
        ),  TableRow(
          children: [
        Container(color: MyColors.colorPrimary, child: Padding(padding:const EdgeInsets.all(10.0),child:
    Text(AppLocalizations.of(context)?.translate("final") ?? "" , style: TextStyle(color: MyColors.white)) )),
            const Padding(padding: EdgeInsets.all(10.0), child: Center( child:  Text("222" , style: TextStyle(color: MyColors.logRed)) )),
            const Padding(padding: EdgeInsets.all(10.0), child: Center(child:  Text("333" , style: TextStyle(color: MyColors.logRed)) )),

          ]
        ),
      ],
    )
    );

  }
}