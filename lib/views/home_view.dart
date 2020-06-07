import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/constants.dart';
import 'package:newsapp/provider/user_provider.dart';
import 'package:newsapp/views/popular_tab_view.dart';
import 'package:newsapp/views/recent_tab_view.dart';
import 'package:newsapp/views/trending_tab_view.dart';
import 'package:newsapp/widgets/myDrawer.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: IconButton(
                  icon: Icon(
                    Icons.format_align_left,
                    color: Colors.deepOrangeAccent[400],
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                title: Text(
                  "",
                  textAlign: TextAlign.end,
                  style: kNonActiveTabStyle,
                ),
                subtitle: Text(
                  "Ekiti News Hub",
                  textAlign: TextAlign.end,
                  style: kActiveTabStyle,
                ),
                trailing: InkWell(
                  onTap: () {
                    user.signOut();
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage("assets/logo_ekiti.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: kGrey1,
                  unselectedLabelStyle: kNonActiveTabStyle,
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  labelStyle: kActiveTabStyle.copyWith(fontSize: 25.0),
                  tabs: [
                    Tab(text: "Popular"),
                    Tab(text: "Trending"),
                    Tab(text: "Recent"),
                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: myDrawer(),
        body: TabBarView(
          children: [
            PopularTabView(),
            TrendingTabView(),
            RecentTabView(),
          ],
        ),
      ),
    );
  }
}
