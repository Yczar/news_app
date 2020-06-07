import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:newsapp/constants.dart';
import 'package:newsapp/models/governor.dart';

class GovernorDetails extends StatelessWidget {
  final Governors governors;
  GovernorDetails({this.governors});
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white.withOpacity(0.7));
    return Scaffold(
      body: SafeArea(child: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                                        height: MediaQuery.of(context).size.height/2.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35)),
                    image: DecorationImage(image: NetworkImage(governors.imageurl,),
                      fit: BoxFit.cover)
                  ),
                ),
//                Image.network(
//
//                ),

                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        // Box decoration takes a gradient
                        gradient: LinearGradient(
                          // Where the linear gradient begins and ends
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          // Add one stop for each color. Stops should increase from 0 to 1
                          colors: [
                            // Colors are easy thanks to Flutter's Colors class.
                            Colors.white.withOpacity(0.7),
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.07),
                            Colors.white.withOpacity(0.05),
                            Colors.white.withOpacity(0.025),
                          ],
                        ),
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35))
                      ),

                      child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container()
                      )),
                ),



                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: MediaQuery.of(context).size.height/2,
                      decoration: BoxDecoration(
                        // Box decoration takes a gradient
                        gradient: LinearGradient(
                          // Where the linear gradient begins and ends
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          // Add one stop for each color. Stops should increase from 0 to 1
                          colors: [
                            // Colors are easy thanks to Flutter's Colors class.
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.07),
                            Colors.black.withOpacity(0.05),
                            Colors.black.withOpacity(0.025),
                          ],
                        ),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35))
                      ),

                      child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container()
                      )),
                ),
                Positioned(
                    bottom: 25,
                    left: 20,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(governors.posts),
                            ),
                          ),
//                          Padding(
//                            padding: const EdgeInsets.all(10.0),
//                            child: Text('Product Blazer', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300,fontSize: 20),),
//                          ),

                        ],
                      ),
                    )),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(governors.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      ],
                    )
                  ],
//                color: Colors.white,

                ),
              ),
            )

          ],
        ),
      )),
    );
  }
}
