
import 'package:flutter/material.dart';
import 'package:noon/Screens/AccBalance.dart';
import 'package:noon/Screens/AccMonthReceiptsPayments.dart';
import 'package:noon/Screens/AccReceiptsPayments.dart';
import 'package:noon/Screens/Main.dart';
import 'package:noon/app_localizations.dart';
import 'package:noon/my_colors.dart';
class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color:  MyColors.colorPrimary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(
            context: context,
            icon: Icons.home,
            text: "home",
            onTap: () =>
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  Main()),
                ),),
        createDrawerBodyItemExpandedItems(
            icon: Icons.arrow_downward,
            text: "accounting",
            context: context

          ),
          createDrawerBodyItem(
              context: context,
              icon: Icons.arrow_downward,
              text: 'sales',
              onTap: (){
              } ),
          createDrawerBodyItem(
              context: context,

              icon: Icons.contact_phone,
              text: 'purchases',
              onTap: (){
              } ),
          createDrawerBodyItem(
              context: context,

              icon: Icons.contact_phone,
              text: 'stocks',
              onTap: (){
              } ),
          Divider(),
          createDrawerBodyItem(
              context: context,

              icon: Icons.notifications_active,
            text: 'notification',
            onTap: (){
             }
          ),
          createDrawerBodyItem(
              context: context,

              icon: Icons.contact_phone,
            text: 'contact',
              onTap: (){
              } ),
          createDrawerBodyItem(
              context: context,

              icon: Icons.contact_phone,
              text: 'logout',
              onTap: (){
              } ),
          ListTile(
            title:  const Text('App version 1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    ));
  }
  Widget createDrawerBodyItem( {required BuildContext context,
      required IconData icon, required String text, required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(AppLocalizations.of(context)?.translate(text) ?? "" , style: const TextStyle(color: MyColors.white),),
          )
        ],
      ),
      onTap: onTap,
    );
  } Widget createDrawerBodyItemExpandedItems(
      { required BuildContext context ,required IconData icon, required String text}){
    return
      ExpansionTile(
      
              title: Text( AppLocalizations.of(context)?.translate(text) ?? "" , style: const TextStyle(color: MyColors.white),),

              children: <Widget>[
            TextButton(child:Text(AppLocalizations.of(context)?.translate("balances") ?? "" ,style: const TextStyle(color: MyColors.white)),onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  AccBalance()));

                },),
    TextButton(child: Text(AppLocalizations.of(context)?.translate("receipts_payments") ?? "",style: const TextStyle(color: MyColors.white)),onPressed: (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>   AccReceiptsPayments()));

    },),
    TextButton(child:   Text(AppLocalizations.of(context)?.translate("month_receipts_payments") ?? "",style: const TextStyle(color: MyColors.white)),onPressed: (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  AccMonthReceiptsPayments()));

    }),
              ],
            );

  }
  Widget createDrawerHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image:  AssetImage('images/logo.png' ))),
        child:  Stack(children: const <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }
}