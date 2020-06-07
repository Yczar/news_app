import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:newsapp/models/news.dart';
import 'package:newsapp/provider/user_provider.dart';
import 'package:newsapp/views/read_news_view.dart';
import 'package:newsapp/widgets/primary_card.dart';
import 'package:provider/provider.dart';

class TrendingTabView extends StatelessWidget {
  Future getPosts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection("posts")
        .where("viewscount", isGreaterThan: 1)
        .orderBy("viewscount", descending: true)
        .getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
            .collection("users")
            .document(user.user.uid)
            .snapshots(),
        builder: (context, snapshots) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshots.hasError) {
            return Center(child: Text("${snapshots.error.toString()}"));
          } else if (!snapshots.hasData) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshots.hasData) {
            return FutureBuilder(
                future: getPosts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("${snapshot.error.toString()}"));
                  } else if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
//            print('grower ${snapshot.data[index]['title']}');
                        var trending = trendingList[index];

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReadNewsView(
                                  title: snapshot.data[index]["title"],
                                  imageurl: snapshots.data["profileimage"],
                                  image: snapshot.data[index]["image"],
                                  subtitle: snapshot.data[index]["subtitle"],
                                  author: snapshot.data[index]["author"],
                                  category: snapshot.data[index]["category"],
                                  content: snapshot.data[index]["content"],
                                  estimate: snapshot.data[index]["estimate"],
                                  ownerid: snapshot.data[index]["ownerid"],
                                  timestamp: snapshot.data[index]["timestamp"],
                                  favorite: snapshot.data[index]["favorite"],
                                  userid: user.user.uid,
                                  seen:
                                      "${snapshot.data[index]["seen"].length}",
                                  time:
                                      "${Jiffy(snapshot.data[index]["timestamp"].toDate()).fromNow()}",
                                  postid: snapshot.data[index]["postid"],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 300.0,
                            margin: EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 12.0),
                            child: PrimaryCard(
                              title: snapshot.data[index]["title"],
                              image: snapshot.data[index]["image"],
                              subtitle: snapshot.data[index]["subtitle"],
                              author: snapshot.data[index]["author"],
                              category: snapshot.data[index]["category"],
                              content: snapshot.data[index]["content"],
                              estimate: snapshot.data[index]["estimate"],
                              favorite: snapshot.data[index]["favorite"],
                              seen: "${snapshot.data[index]["seen"].length}",
                              time:
                                  "${Jiffy(snapshot.data[index]["timestamp"].toDate()).fromNow()}",
                            ),
                          ),
                        );
                      },
                    );
                  }
                });
          }
        });
  }
}
