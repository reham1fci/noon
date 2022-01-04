
import 'package:flutter/material.dart';
import 'package:noon/Screens/NavigationDrawer.dart';
import 'package:noon/app_localizations.dart';
import 'package:noon/my_colors.dart';
class AccReceiptsPayments  extends StatefulWidget{
   AccReceiptsPayments({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }

}
class _State extends State<AccReceiptsPayments> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return  Scaffold(
        appBar:  AppBar(backgroundColor: MyColors.colorPrimary,
            title:Text( AppLocalizations.of(context)?.translate("receipts_payments") ?? "",)),
        drawer: NavigationDrawer(),

        backgroundColor: MyColors.white,
        body:  Table(
        border: TableBorder.all(color: MyColors.logRed),

    children: [
      TableRow(children: [
        Container(color: MyColors.colorPrimary, child:   Padding(padding:const EdgeInsets.all(10.0), child:
        Text(AppLocalizations.of(context)?.translate("cash_receipt") ?? "" , style: TextStyle(color: MyColors.white)))) ,
        const Padding(padding: EdgeInsets.all(10.0),child: Center( child:  Text("5000" ,   style: TextStyle(color: MyColors.logRed)) )),

            ]) ,
      TableRow(children: [
        Container(color: MyColors.colorPrimary, child:   Padding(padding:const EdgeInsets.all(10.0), child:
        Text(AppLocalizations.of(context)?.translate("cash_exchange") ?? "" , style: TextStyle(color: MyColors.white)))) ,
        const Padding(padding: EdgeInsets.all(10.0),child: Center( child:  Text("5000" ,   style: TextStyle(color: MyColors.logRed)) )),

      ]) ,
      TableRow(children: [
        Container(color: MyColors.colorPrimary, child:   Padding(padding:const EdgeInsets.all(10.0), child:
        Text(AppLocalizations.of(context)?.translate("checks_payable") ?? "" , style: TextStyle(color: MyColors.white)))) ,
        const Padding(padding: EdgeInsets.all(10.0),child: Center( child:  Text("5000" ,   style: TextStyle(color: MyColors.logRed)) )),

      ]) ,
      TableRow(children: [
        Container(color: MyColors.colorPrimary, child:   Padding(padding:const EdgeInsets.all(10.0), child:
        Text(AppLocalizations.of(context)?.translate("checks_receivable") ?? "" , style: TextStyle(color: MyColors.white)))) ,
        const Padding(padding: EdgeInsets.all(10.0),child: Center( child:  Text("5000" ,   style: TextStyle(color: MyColors.logRed)) )),

      ]) ,
    ]));
  }

}