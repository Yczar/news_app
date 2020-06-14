import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:newsapp/constants.dart';
import 'package:newsapp/models/governor.dart';
import 'package:newsapp/models/news.dart';
import 'package:newsapp/views/governor_details.dart';
import 'package:newsapp/widgets/pastGovernorsRow.dart';

class PastGovernors extends StatefulWidget {
  @override
  _PastGovernorsState createState() => _PastGovernorsState();
}

class _PastGovernorsState extends State<PastGovernors> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        bottomOpacity: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.deepOrangeAccent[400], size: 20,), onPressed: (){
          Navigator.pop(context);
        },),
        title: Text("Past Governors", style: kTitleCard,),
        centerTitle: true,

      ),
      body: ListView.builder(
      itemCount: governorsList.length,
    scrollDirection: Axis.vertical,
    physics: BouncingScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (context, index) {
        var trending = governorsList[index];
      return InkWell(
          onTap: (){
//            Navigator.push(
//                context,
//                MaterialPageRoute(
//                builder: (context) => GovernorDetails(
//                  governors: trending,
//                )));
          },
          child: PastGovRow(governors: trending,));
    }
    )

    );

  }
}
