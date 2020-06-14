import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/constants.dart';
import 'package:newsapp/views/LocalGovernments.dart';
import 'package:newsapp/views/PastGovernors.dart';
import 'package:newsapp/views/gallery_view.dart';
import 'package:newsapp/views/tourism_view.dart';

class myDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(child: LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  DrawerHeader(
                    margin: EdgeInsets.all(0.0),
                    padding: EdgeInsets.zero,
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
//                              width: MediaQuery.of(context).size.width * 0.2,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Image.asset(
                                      "assets/fayemi.jpg",
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.6)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 5,
                                    right: 10.0,
                                    top: 10.0,
                                    bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Dr John Kayode Fayemi",
                                      style: GoogleFonts.quattrocentoSans(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      "Present Governor(Since 2018)",
                                      style: GoogleFonts.quattrocentoSans(
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
//                        child: Center(
//                          child: Image.asset("images/icons/isales.png", color: appOrange, height:70,),
//                        ),
                  ),
//                  ListTile(
////                    leading: ImageIcon(AssetImage("assets/culture.png")),
//                    leading: Icon(Icons.nature_people, color: Colors.deepOrangeAccent[400],),
//                    title: Text("Jobs"),
//                  ),
                SizedBox(height: MediaQuery.of(context).size.height/ 10,),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (coontext) => PastGovernors()));
                    },
                    child: ListTile(
//                      leading: ImageIcon(AssetImage("assets/culture.png")),

                      leading: Icon(Icons.directions_walk, color: Colors.deepOrangeAccent[400],),
                      title: Text("Past Governors", style: kDetailContent. copyWith(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (coontext) => MyApp()));
                    },
                    child: ListTile(
//                      leading: ImageIcon(AssetImage("assets/culture.png")),

                      leading: Icon(Icons.directions_walk, color: Colors.deepOrangeAccent[400],),
                      title: Text("Gallery", style: kDetailContent. copyWith(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
                    ),
                  ),
//                  ListTile(
////                    leading: ImageIcon(AssetImage("assets/culture.png")),
//                    leading: Icon(Icons.person, color: Colors.deepOrangeAccent[400],),
//                    title: Text("People and culture"),
//                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (coontext) => TourismView()));
                    },
                    child: ListTile(
//                    leading: ImageIcon(AssetImage("assets/culture.png")),
                      leading: Icon(Icons.person, color: Colors.deepOrangeAccent[400],),
                      title: Text("Tourism", style: kDetailContent. copyWith(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (coontext) => LocalGovernmentsView()));
                    },
                    child: ListTile(
                      leading: ImageIcon(AssetImage("assets/culture.png"), color: Colors.deepOrangeAccent[400],),
                      title: Text("Local Governments", style: kDetailContent. copyWith(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
                    ),
                  ),
//                  ListTile(
//                    leading: ImageIcon(AssetImage("assets/culture.png")),

//                    leading: Icon(Icons.location_city, color: Colors.deepOrangeAccent[400],),
//                    title: Text("Traditional Rulers"),
//                  ),
                  const Expanded(child: SizedBox()),
                  const Divider(
                    height: 1.0,
                    color: Colors.grey,
                  ),
                  ListTile(
//                        leading: Icon(Icons.exit_to_app),
                    title: Text("About",
                        style: kDetailContent. copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
//                        onTap: (){
//                          Navigator.of(context).push(
//                              new MaterialPageRoute(builder: (context) => About()));
//                        },
                  ),
                  ListTile(
//                        leading: Icon(Icons.exit_to_app),
                      title: Text("FeedBack",
                          style: kDetailContent. copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
                      onTap: () {
//                          Navigator.of(context).push(
//                              new MaterialPageRoute(builder: (context) => Feedback_()));
//
                      })
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
