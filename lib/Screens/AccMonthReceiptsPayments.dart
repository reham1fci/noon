
import 'package:flutter/material.dart';
import 'package:noon/Screens/NavigationDrawer.dart';
import 'package:noon/app_localizations.dart';
import 'package:noon/my_colors.dart';
class AccMonthReceiptsPayments extends StatefulWidget  {
   AccMonthReceiptsPayments({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }

}

class _State extends State<AccMonthReceiptsPayments> {
  final rows = <TableRow>[];
  final months = ["1" , "2" , "3" , "4" , "5" , "6" , "7" , "8" , "9" , "10" , "11" , "12"];
 int start = 1 ;
 int end   = 5  ;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    rows.add( TableRow(
        decoration: const BoxDecoration(color: MyColors.colorPrimary ),
        children: [
          Padding(padding:const EdgeInsets.all(10.0), child: Center(child:Text(AppLocalizations.of(context)?.translate("month") ?? "" ,   style: TextStyle(color: MyColors.white),) ,) ),
          Padding(padding:const EdgeInsets.all(10.0), child: Center(child:Text(AppLocalizations.of(context)?.translate("receipts") ?? "" ,   style: TextStyle(color: MyColors.white),) ,) ),
          Padding(padding:const EdgeInsets.all(10.0), child: Center(child:Text(AppLocalizations.of(context)?.translate("payments") ?? "",  style: TextStyle(color: MyColors.white))) ),

        ]
    ));
    for (int i = start  ;  i <= end  ; i++ ) {
      rows.add(monthTableRow(i)
      );
    }
    return  Scaffold(
        appBar:  AppBar(backgroundColor: MyColors.colorPrimary,title:Text( AppLocalizations.of(context)?.translate("month_receipts_payments") ?? "",)),
        backgroundColor: MyColors.white,
        drawer: NavigationDrawer(),

        body: Column(children: [
         Container (color: MyColors.colorPrimary,
     // child:Padding(padding: const EdgeInsets.only(left: 10 , right: 10) ,
          child:Row(
       // mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children:[

fromItem() , toItem()
    ]
    )
    )
    ,
        Table(
            border: TableBorder.all(color: MyColors.logRed),

            children: rows,
          )
        ],)


    );

  }
  Widget fromItem(){
   return    Flexible(child:
   Padding( padding:EdgeInsets.all(5),
       child: Container(
           decoration:
           BoxDecoration(
             border: Border.all(color: MyColors.logRed),) ,
           padding: EdgeInsets.only(left: 5 ,right: 5),
           child:  Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(AppLocalizations.of(context)?.translate("from") ?? "",style: TextStyle(color: MyColors.white)) ,
               DropdownButton<String>(
                 //  isExpanded: true,
                 hint: Text(start.toString() , style: TextStyle(color: MyColors.white)),
                 items: months.map((String value) {
                   return DropdownMenuItem<String>(
                     value: value,
                     child: Text(value),
                   );
                 }).toList(),
                 onChanged: (v) {
                   setState(() {
                     start = int.parse(v!) ;

                   });
                 },
               ),],))),flex: 1,);
  }
   Widget toItem(){
   return
     Flexible(child:
     Padding( padding:EdgeInsets.all(5)
         ,child:  Container(
             decoration:
             BoxDecoration(
               border: Border.all(color: MyColors.logRed),) ,
             padding: EdgeInsets.only(left: 5 ,right: 5),
             child:  Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(AppLocalizations.of(context)?.translate("to") ?? "",style: TextStyle(color: MyColors.white)) ,

                 DropdownButton<String>(
                   //  isExpanded: true,
                   hint: Text(end.toString() , style: TextStyle(color: MyColors.white)),
                   items: months.map((String value) {
                     return DropdownMenuItem<String>(
                       value: value,
                       child: Text( value),
                     );
                   }).toList(),
                   onChanged: (v) {
                     setState(() {
                       end = int.parse(v!) ;

                     });
                   },
                 ),
               ],)
         ))
       ,flex: 1,) ;
   }
    onChangeFrom(){
   setState(() {

   });
    }
  TableRow monthTableRow( int month){
   return TableRow(
        children: [
            Container(color: MyColors.colorPrimary,
                child: Padding(
                    padding: const EdgeInsets.all(10.0), child:
                Text( month.toString(),
                    style: const TextStyle(color: MyColors.white)))),
          const Padding(padding: EdgeInsets.all(10.0),
              child: Center(child: Text(
                  "5000", style: TextStyle(color: MyColors.logRed)))),
          const Padding(padding: EdgeInsets.all(10.0),
              child: Center(child: Text(
                  "1000", style: TextStyle(color: MyColors.logRed)))),

        ]
    )
     ;
  }
}