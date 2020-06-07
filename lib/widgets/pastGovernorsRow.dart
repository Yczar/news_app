import 'package:flutter/material.dart';
import 'package:newsapp/models/governor.dart';

import '../constants.dart';

class PastGovRow extends StatefulWidget {
  Governors governors;
  PastGovRow({this.governors});
  @override
  _PastGovRowState createState() => _PastGovRowState();
}

class _PastGovRowState extends State<PastGovRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(widget.governors.imageurl),
              radius: 50,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3.0),
                      child: Text(widget.governors.name, style: TextStyle(fontSize: 15, color: kBlack, fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3.0),
                      child: Text(widget.governors.posts, style: TextStyle(fontSize: 13), overflow: TextOverflow.ellipsis, maxLines: 2,),
                    ),

                    Text(widget.governors.date, style: TextStyle(fontSize: 12, color: kGrey2)),
                    Divider()
                  ],
                ),
              ),
            ),
//          IconButton(
//            onPressed: () async{
////              await like(user.user.uid, "${snapshot.data[index]["commentid"]}");
//            },
//            icon: Icon(Icons.favorite_border, size: 15,),
//          ),
          ],
        ),
      ),
    );
  }
}
