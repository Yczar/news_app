import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:newsapp/constants.dart';
import 'package:newsapp/widgets/FadeAnimation.dart';

class LocalGovernmentsView extends StatefulWidget {
  @override
  _LocalGovernmentsViewState createState() => _LocalGovernmentsViewState();
}

class _LocalGovernmentsViewState extends State<LocalGovernmentsView>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  int totalPage = 16;

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
              image: 'assets/fajuyi.jpg',
              title: 'Ado Local Government',
              description:
                  'Ado Ekiti local Government was carved out of the defunct Ekiti Central Local Government bi the Ibrahim Badamosi Babangida Administration in may 1989. Ado Ekiti Government could be regarded as a one town local government with many farm settlements such as Igirigiri, idwgw, Ilamuo, Ago Aduloju, Igimo-Kogo, Ago-Aso, Emirin, Temidire Esunmo, Ureje etc. Since the Lord Lugard reforms of 1916, Ado-Ekiti has been enjoying a unique political position as a linchpin of Administration when it was made the headquarters of Ekiti divisional Council, it maintained this position until 1952 when Ado-Ekiti District Council was created and started operating in this capacity in 1955.In 1996 when Ekiti State was created, Ado-Ekiti was made the state headquarters.'),
          makePage(
              page: 2,
              image: 'assets/EgbeDam.jpg',
              title: 'Ikole Local Government',
              description:
                  'Yosemite National Park is in California’s Sierra Nevada mountains. It’s famed for its giant, ancient sequoia trees, and for Tunnel View, the iconic vista of towering Bridalveil Fall and the granite cliffs of El Capitan and Half Dome.'),
          makePage(
              page: 3,
              image: 'assets/emure.jpg',
              title: 'Emure Local Government',
              description:
                  "Sedona is regularly described as one of America's most beautiful places. Nowhere else will you find a landscape as dramatically colorful."),
          makePage(
              page: 4,
              image: 'assets/emure.jpg',
              title: 'Efon Local Government',
              description:
                  "Sedona is regularly described as one of America's most beautiful places. Nowhere else will you find a landscape as dramatically colorful."),

          makePage(
              page: 5,
              image: 'assets/fajuyi.jpg',
              title: 'Ilejemeje Local Government',
              description:
                  "Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak."),
         makePage(
              page: 6,
              image: 'assets/fajuyi.jpg',
              title: 'Ido-Osi Local Government',
              description:
                  "Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak."),
         makePage(
              page: 7,
              image: 'assets/fajuyi.jpg',
              title: 'Irepodun/Ifelodun Local Government',
              description:
                  "Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak."),
         makePage(
              page: 8,
              image: 'assets/fajuyi.jpg',
              title: 'Ise/Orun Local Government',
              description:
                  "Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak."),
         makePage(
              page: 9,
              image: 'assets/fajuyi.jpg',
              title: 'Ijero Local Government',
              description:
                  "Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak."),
         makePage(
              page: 10,
              image: 'assets/fajuyi.jpg',
              title: 'Gboyin Local Government',
              description:
                  "Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak."),
         makePage(
              page: 11,
              image: 'assets/fajuyi.jpg',
              title: 'Ilejemeje Local Government',
              description:
                  "Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak."),
         makePage(
              page: 12,
              image: 'assets/fajuyi.jpg',
              title: 'Oye Local Government',
              description:
                  "Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak."),
         makePage(
              page: 13,
              image: 'assets/fajuyi.jpg',
              title: 'Moba Local Government',
              description:
                  "Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak."),
         makePage(
              page: 14,
              image: 'assets/fajuyi.jpg',
              title: 'Ikere Local government',
              description:
                  "Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak."),
         makePage(
              page: 15,
              image: 'assets/fajuyi.jpg',
              title: 'EKiti East Local Government',
              description:
                  "Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak."),
        makePage(
              page: 16,
              image: 'assets/fajuyi.jpg',
              title: 'Ekiti South West local government',
              description:
                  "Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak."),

        ],
      ),
    );
  }

  Widget makePage({image, title, description, page}) {
    bool readmore = false;

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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeAnimation(
                          1,
                          Text(
                            title,
                            style: kActiveTabStyle.copyWith(color: Colors.white, fontSize: 30),
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
                              style: kDetailContent.copyWith(color: Colors.white, fontSize: 15, ),
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
//                      FadeAnimation(
//                          2.5,
//                           Container(
//                              decoration: BoxDecoration(
//                                color: Colors.white,
//                              ),
//                              child: Padding(
//                                padding: const EdgeInsets.all(10.0),
//                                child: Text(
//                                  'READ MORE',
//                                  style: TextStyle(color: Colors.black),
//                                ),
//                              ),
//                            ),
//                          ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                         page == 1 ? Container() : Icon(LineAwesomeIcons.angle_double_left, color: Colors.white,),
                          Text("Swipe", style: kActiveTabStyle.copyWith(color: Colors.white),),
                          page == 16 ? Container() : Icon(LineAwesomeIcons.angle_double_right, color: Colors.white,),
                        ],
                      )
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
