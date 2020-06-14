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
              image: 'assets/ado.jpg',
              title: 'Ado Local Government',
              description:
                  'Ado Ekiti local Government was carved out of the defunct Ekiti Central Local Government bi the Ibrahim Badamosi Babangida Administration in may 1989. Ado Ekiti Government could be regarded as a one town local government with many farm settlements such as Igirigiri, idwgw, Ilamuo, Ago Aduloju, Igimo-Kogo, Ago-Aso, Emirin, Temidire Esunmo, Ureje etc. Since the Lord Lugard reforms of 1916, Ado-Ekiti has been enjoying a unique political position as a linchpin of Administration when it was made the headquarters of Ekiti divisional Council, it maintained this position until 1952 when Ado-Ekiti District Council was created and started operating in this capacity in 1955.In 1996 when Ekiti State was created, Ado-Ekiti was made the state headquarters.'),
          makePage(
              page: 2,
              image: 'assets/ikole.jpg',
              title: 'Ikole Local Government',
              description: '''
              The Local Government is predominantly a homogenous society and carefully populated by Yoruba speaking people of the South West Zone of Nigeria. The Religious of the people are mainly Christian and Islamic religious while a percentage of the people are Traditional religion worshippers.

The thriving industries in the local government include Timber/Saw mills which include Olo Sawmill, Okejebu, Eleyero Sawmill, Ilamo and Ara Sawmill, Ara; Pharmacies which include Chuks Pharmacy and Okoli Pharmacy both located at Ikole.

The place in the Ikole Local Government that attracts tourists from all over is the Itapaji Water Dam, Itapaji-Ekiti.
              '''
          ),

                   makePage(
              page: 3,
              image: 'assets/emure.jpg',
              title: 'Emure Local Government',
              description:
                  "Sedona is regularly described as one of America's most beautiful places. Nowhere else will you find a landscape as dramatically colorful."),
          makePage(
              page: 4,
              image: 'assets/efon.jpg',
              title: 'Efon Local Government',
              description:
                  '''The Local Government now known as Efon Local Government has a long history of metamorphosis that dated back to pre- independence Nigeria. This is evident in the fact that the former Ekiti West District Council which was created in 1955 had its administrative headquarters in Efon Alaaye. Later for what was purely ascribed to administrative convenience; the District headquarters was moved to Ijero Ekiti in 1973 after 18 years.

Sequel to the creation of Local Governments in 1976, Ekiti West Local Government was created with headquarters in Aramoko Ekiti. Efon Alaaye belonged to the Local Government. History again was made when Efon Alaaye as a result of its quest for a local government was (later) granted Efon Native Authority in 1981.

At last, reprieve came on 4th December, 1996 when Efon Local Government was created with the headquaters in Efon Alaaye. The Local Government shares boundaries with Ijebu – Ijesa in Osun State in the west, Erio Ekiti in the east, Esa – Oke in Osun State in the north and in the south with Ogotun Ekiti.

 '''),

          makePage(
              page: 5,
              image: 'assets/ilejemeje.jpg',
              title: 'Ilejemeje Local Government',
              description:'''

              The Local Government is basically aganan with people cultivating root crops and grains e.g. yams, cassava, maize, rice e.t.c. There are a few cottage industries in the Local Government devoted primarily to processing of agricultural produce. Other Industrial undertakings are in the area of printing , bakeries, weaving, carpentry e.t.c.

          The thriving industries in the local government include Timber/Saw mills which include Ido-Ekiti Sawmill, Ora-Ekiti Sawmill, Usi-Ekiti Sawmill, and Osi-Ekiti Sawmill; Bakeries which include Negro Special Bread, Bejisko Bakery, Ona Ara Bakery, and Osi Ekiti Bakery; Banks which include UBA Usi-Ekiti, First Bank Ifaki-Ekiti, Harvest Bank Ido-Ekiti, Micro Bank Ayetoro, Skye Bank Ido-Ekiti and Enterprise Bank Ido-Ekiti; Printing Press which include Ade Commercial Press Ido-Ekiti, Jolayemi Printing Press Usi-Ekiti and Adedayo Printing Press Ifaki-Ekiti. All the towns in the Local Government enjoy electricity although very unreliable in supply.

          Each of the towns in the Local Government Area has cultural festivals which are celebrated at different times of the year. For instance, the Ifaki people have the Okorobo Festival.
          '''),
          makePage(
              page: 6,
              image: 'assets/fajuyi.jpg',
              title: 'Ido-Osi Local Government',
              description:
                  '''Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak.'''),
         makePage(
              page: 7,
              image: 'assets/fajuyi.jpg',
              title: 'Irepodun/Ifelodun Local Government',
           description: '''The Local Government is predominantly a homogenous society and carefully populated by Yoruba speaking people of the South West Zone of Nigeria. The Religious of the people are mainly Christian and Islamic religious while a percentage of the people are Traditional religion worshippers.

The thriving industries in the local government include Timber/Saw mills which include Mighty Sawmill at Igede-Ekiti, Ilamoye Sawmill at Igede-Ekiti, Olorunde Sawmill at Iyin-Ekiti, Okeorun Sawmill at Igbemo-Ekiti, Osalade Sawmil at Igbemo-Ekiti, Oke Uba Sawmill Awo-Ekiti and Iyedi Sawmill at Igbemo-Ekiti; Photo Studios; Hotels, some of which include CornerStone Hotel, God’s Health Hotel, Liberty Hotel and many more.

The places in the Irepodun Local Government that attract tourists from all over are the Osun Tourist Center and Elemi Tourist Center, both located at Igede-Ekiti.
 '''
         ),
          makePage(
              page: 8,
              image: 'assets/ise.jpg',
              title: 'Ise/Orun Local Government',
              description: ''' '''
         ),
          
          makePage(
              page: 9,
              image: 'assets/fajuyi.jpg',
              title: 'Ijero Local Government',
              description: ''' Ijero Local Government was created in 1976.It is situated in the North-Western part of Ekiti State with Ijero Ekiti as the headquarter. Other component towns are: Ikoro, Ipoti, Iloro, Odo-Owa, Ijurin, Ara, Epe, Araromi, Oke-oro, Iroko, Ayegunle, Temidire and Ilukuno.

The local government is bordered by Moba Local Government and Ido-Osi Local Government in the East, Irepodun/Ifelodun in the West, Ekiti West in the south and Ila Orangun Local Government Area ( in Osun State) in the North-West.
'''
         ),  makePage(
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
              image: 'assets/oye.jpg',
              title: 'Oye Local Government',
         description: '''
Oye Local Government Area was carved out from the defunct Ekiti North Local Government on 17th May, 1989.

Oye Local Government is bounded by Ilejemeje Local Government to the North, Irepodun/Ifelodun to the South, Ikole local Government to the East and Ido/Osi Local Government to the West.

It comprises of the following towns and villages: Oye Ekiti, Ilupeju Ekiti, Ayegbaju Ekiti, Ire Ekiti, Itapa Ekiti, Osin Ekiti, Ayede Ekiti, Itaji Ekiti, Imojo Ekiti, Ilafon Ekiti, Isan Ekiti, Ilemeso Ekiti, Omu Ekiti, Ijelu Ekiti, Oloje Ekiti and a host of others.

There are no distinctive ethnic groups in the Local Government as a greater percentage of the people resident are of the Yoruba Language race. Nearly all the people speak Yoruba Language with negligible dialectical variations.
 '''
         ),
           makePage(
              page: 13,
              image: 'assets/fajuyi.jpg',
              title: 'Moba Local Government',
              description: '''
              The Moba local government has about 110sq kilometers. According to the 2006 National Population Census, the population of the local government was put at one hundred and forty six thousand four hundred and ninety six (146,496).

There are several places of interests in the local government that could attract tourists and they include Ero Dam, Ikun; Oore Monumental Palace, Otun; Eywmojo Grave, Osan; Eegun Regalia Costumes, Ikun; and Egi Hill, Igogo.

There are several Co-operative socieites in the Local Government and also thriving industries which include Timber/Saw mills and Dairy Farms e.g. Ikun Dairy Farm.
              '''
         ),
          makePage(
              page: 14,
              image: 'assets/ikere.jpg',
              title: 'Ikere Local government',
            description: '''The local government has about 202.38sq kilometers shares boundaries in the east with Ise/Orun local Government; in the west with Ado local government; while it shares boundaries with Iju/Itaogbolu and Akure north local government in the south.

The total population of Ikere local government is put at one hundred and forty seven thousand three hundred and fifty five (147,355).

 '''
          ),

          makePage(
              page: 15,
              image: 'assets/fajuyi.jpg',
              title: 'EKiti East Local Government',
              description: '''Ekiti East Local Government was created under the Local Government Edict of 1979. This took place as a result of the creation of Ondo – state which has it’s headquarter at Ibadan under the administration of the late Head of State Gen. Murtala Ramat Muhammed. At its creation, the old Gbonyin District Council which has it’s headquarter at Aisegba-Ekiti and part of the then Ekiti North Division were carved to from Ekiti east Local Government with it’s headquarter located at Omuo-Ekiti.

However, with the creation of more Local Government in 1996 as a result of the creation of Ekiti state by late Gen. Sanni Abacha, Gbonyin Local Government has been carved out of Ekiti East Local Government.
 '''
         ),
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
                                child: Container(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Text(
                                      description,
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(.7),
                                        height: 1.9,
                                        fontSize: 15),
                                    ),
                                  ),
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
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
