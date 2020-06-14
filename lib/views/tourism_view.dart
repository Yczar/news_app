import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:newsapp/constants.dart';
import 'package:newsapp/widgets/FadeAnimation.dart';

class TourismView extends StatefulWidget {
  @override
  _TourismViewState createState() => _TourismViewState();
}

class _TourismViewState extends State<TourismView>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  int totalPage = 4;

  void _onScroll() {}

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage(
              page: 1,
              image: 'assets/ikogosi.jpg',
              title: 'Ikogosi Warm Spring',
              description:
                  'The meeting point of warm and cold spring\nThe Haven of tourists in Nigeria. Ekiti State is richly endowed with tourism potentials. Tourists to the state would be irresistibly charmed with the beauties of Ikogosi where warm and cold water oozing from different sources flowing separately to join in a pool but each retaining its thermal identity.'),
          makePage(
              page: 2,
              image: 'assets/EgbeDam.jpg',
              title: 'Egbe Dam',
              description: 'This Dam is constructed on Ose River at Egbe Ekiti in Ekiti East Local Government. The dam supplies the whole Local Government regular pipe-borne water.\nBoth fishing and irrigation systems of farming are practise by the villagers. People go to Egbe Ekiti from all over the state to purchase fresh and smoked fish for their local consumption.\nBoth dams and lakes are good resort centres for tourists coming to Ekiti on a visit.'),
//          makePage(
//              page: 3,
//              image: 'assets/ijesha.jpg',
//              title: 'Erin Ijesha Waterfall',
//              description:
//                  "Sedona is regularly described as one of America's most beautiful places. Nowhere else will you find a landscape as dramatically colorful."),
          makePage(
              page: 3,
              image: 'assets/fajuyi.jpg',
              title: 'Fajuyi Park',
              description:
                  "It is a triangular park where the late Colonel Adekunle Fajuyi was buried. This park is at Ado Ekiti, the heart of Ekiti-land in Ekiti State. Colonel Adekunle Fajuyi was the Governor of the Old Western State. He was swept off by the coup of 1966 but accorded a heroic burial for his sacrifice and patriotism."),
        makePage(
              page: 4,
              image: 'assets/olosunta.jpg',
              title: 'Olosunta hills',
              description:
                  "These two hills are located at Northern and southern parts of the town (Ikere Ekiti) respectively. They are both steep-sided hills. These are good resort centres for Tourists to visit and see for themselves what God has done for the State of Honour, Fountain of Knowledge. There are deities in charge of these two hills. Both are worshipped accordingly. In line with the belief of the people of this town the Olosunta and Orole deities reside in the hills respectively. Both deities are credited with some feats such as provision of children to barren women and protection of Ikere from warfare. They are believe to be responsible for the welfare of the town. Ikere Ekiti is usually described as the only unconquered town in Ekiti during the popular inter-tribal wars.")],
      ),
    );
  }

  Widget makePage({image, title, description, page}) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
          0.3,
          0.9
        ], colors: [
          Colors.black.withOpacity(.9),
          Colors.black.withOpacity(.2),
        ])),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(icon: Icon(Icons.close, color: Colors.white,), onPressed: (){
                  Navigator.pop(context);
                },),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    FadeAnimation(
                        2,
                        Text(
                          page.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )),
                    Text(
                      '/' + totalPage.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FadeAnimation(
                              1,
                              Text(
                                title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    height: 1.2,
                                    fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            height: 20,
                          ),
//                      FadeAnimation(
//                          1.5,
//                          Row(
//                            children: <Widget>[
//                              Container(
//                                margin: EdgeInsets.only(right: 3),
//                                child: Icon(
//                                  Icons.star,
//                                  color: Colors.yellow,
//                                  size: 15,
//                                ),
//                              ),
//                              Container(
//                                margin: EdgeInsets.only(right: 3),
//                                child: Icon(
//                                  Icons.star,
//                                  color: Colors.yellow,
//                                  size: 15,
//                                ),
//                              ),
//                              Container(
//                                margin: EdgeInsets.only(right: 3),
//                                child: Icon(
//                                  Icons.star,
//                                  color: Colors.yellow,
//                                  size: 15,
//                                ),
//                              ),
//                              Container(
//                                margin: EdgeInsets.only(right: 3),
//                                child: Icon(
//                                  Icons.star,
//                                  color: Colors.yellow,
//                                  size: 15,
//                                ),
//                              ),
//                              Container(
//                                margin: EdgeInsets.only(right: 5),
//                                child: Icon(
//                                  Icons.star,
//                                  color: Colors.grey,
//                                  size: 15,
//                                ),
//                              ),
//                              Text(
//                                '4.0',
//                                style: TextStyle(color: Colors.white70),
//                              ),
//                              Text(
//                                '(2300)',
//                                style: TextStyle(
//                                    color: Colors.white38, fontSize: 12),
//                              )
//                            ],
//                          )),
                          SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                              2,
                              Padding(
                                padding: const EdgeInsets.only(right: 50),
                                child: Text(
                                  description,
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(.7),
                                      height: 1.9,
                                      fontSize: 15),
                                ),
                              )),
//                      SizedBox(
//                        height: 20,
//                      ),
//                      FadeAnimation(
//                          2.5,
//                          Text(
//                            'READ MORE',
//                            style: TextStyle(color: Colors.white),
//                          )),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    page == 1 ? Container() : Icon(LineAwesomeIcons.angle_double_left, color: Colors.white,),
                    Text("Swipe", style: kActiveTabStyle.copyWith(color: Colors.white),),
                    page == 16 ? Container() : Icon(LineAwesomeIcons.angle_double_right, color: Colors.white,),
                  ],
                )
              ]
          ),
        ),
      ),
    );
  }
}
