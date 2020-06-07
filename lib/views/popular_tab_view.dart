import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:newsapp/constants.dart';
import 'package:newsapp/models/news.dart';
import 'package:newsapp/provider/user_provider.dart';
import 'package:newsapp/views/read_news_view.dart';
import 'package:newsapp/widgets/primary_card.dart';
import 'package:newsapp/widgets/secondary_card.dart';
import 'package:provider/provider.dart';

class PopularTabView extends StatelessWidget {
  Future getPosts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection("posts")
        .where("viewscount", isGreaterThan: 1)
        .orderBy("viewscount", descending: true)
        .getDocuments();
    return qn.documents;
  }

  Future getReadPosts(String userid) async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection("posts")
        .where("seen", arrayContains: userid)
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
            return Center(
                child: CircularProgressIndicator(
              strokeWidth: 4,
            ));
          } else if (snapshots.hasError) {
            return Center(child: Text("${snapshots.error.toString()}"));
          } else if (!snapshots.hasData) {
            return Center(
                child: CircularProgressIndicator(
              strokeWidth: 4,
            ));
          } else if (snapshots.hasData) {
            return FutureBuilder(
                future: getPosts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 4,
                    ));
                  } else if (snapshot.hasError) {
                    return Center(child: Text("${snapshots.error.toString()}"));
                  } else if (!snapshot.hasData) {
                    return Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 4,
                    ));
                  } else if (snapshot.hasData) {
                    return Container(
                      child: ListView(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 300.0,
                            padding: EdgeInsets.only(left: 18.0),
                            child: ListView.builder(
                              itemCount: snapshot.data.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var news = popularList[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ReadNewsView(
                                          title: snapshot.data[index]["title"],
                                          imageurl:
                                              snapshots.data["profileimage"],
                                          image: snapshot.data[index]["image"],
                                          subtitle: snapshot.data[index]
                                              ["subtitle"],
                                          author: snapshot.data[index]
                                              ["author"],
                                          category: snapshot.data[index]
                                              ["category"],
                                          content: snapshot.data[index]
                                              ["content"],
                                          estimate: snapshot.data[index]
                                              ["estimate"],
                                          ownerid: snapshot.data[index]
                                              ["ownerid"],
                                          timestamp: snapshot.data[index]
                                              ["timestamp"],
                                          favorite: snapshot.data[index]
                                              ["favorite"],
                                          userid: user.user.uid,
                                          seen:
                                              "${snapshot.data[index]["seen"].length}",
                                          time:
                                              "${Jiffy(snapshot.data[index]["timestamp"].toDate()).fromNow()}",
                                          postid: snapshot.data[index]
                                              ["postid"],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 12.0),
                                    child: PrimaryCard(
                                      title: snapshot.data[index]["title"],
                                      image: snapshot.data[index]["image"],
                                      subtitle: snapshot.data[index]
                                          ["subtitle"],
                                      author: snapshot.data[index]["author"],
                                      category: snapshot.data[index]
                                          ["category"],
                                      content: snapshot.data[index]["content"],
                                      estimate: snapshot.data[index]
                                          ["estimate"],
                                      favorite: snapshot.data[index]
                                          ["favorite"],
                                      seen:
                                          "${snapshot.data[index]["seen"].length}",
                                      time:
                                          "${Jiffy(snapshot.data[index]["timestamp"].toDate()).fromNow()}",
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 25.0),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 19.0),
                              child: Text("BASED ON YOUR READING HISTORY",
                                  style: kNonActiveTabStyle),
                            ),
                          ),
                          FutureBuilder(
                              future: getReadPosts(user.user.uid),
                              builder: (context, snapshotss) {
                                if (snapshotss.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator(
                                    strokeWidth: 4,
                                  ));
                                } else if (snapshotss.hasError) {
                                  return Center(
                                      child: Text(
                                          "${snapshotss.error.toString()}"));
                                } else if (!snapshotss.hasData) {
                                  return Center(
                                      child: CircularProgressIndicator(
                                    strokeWidth: 4,
                                  ));
                                } else if (snapshotss.hasData) {
                                  return ListView.builder(
                                    itemCount: snapshotss.data.length,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    itemBuilder: (context, index) {
//                                      var recent = recentList[index];
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ReadNewsView(
                                                title: snapshotss.data[index]
                                                    ["title"],
                                                imageurl: snapshots
                                                    .data["profileimage"],
                                                image: snapshotss.data[index]
                                                    ["image"],
                                                subtitle: snapshotss.data[index]
                                                    ["subtitle"],
                                                author: snapshotss.data[index]
                                                    ["author"],
                                                category: snapshotss.data[index]
                                                    ["category"],
                                                content: snapshotss.data[index]
                                                    ["content"],
                                                estimate: snapshotss.data[index]
                                                    ["estimate"],
                                                ownerid: snapshotss.data[index]
                                                    ["ownerid"],
                                                timestamp: snapshotss
                                                    .data[index]["timestamp"],
                                                favorite: snapshotss.data[index]
                                                    ["favorite"],
                                                userid: user.user.uid,
                                                seen:
                                                    "${snapshotss.data[index]["seen"].length}",
                                                time:
                                                    "${Jiffy(snapshotss.data[index]["timestamp"].toDate()).fromNow()}",
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 135.0,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 18.0, vertical: 8.0),
                                          child: SecondaryCard(
                                            title: snapshotss.data[index]
                                                ["title"],
                                            image: snapshotss.data[index]
                                                ["image"],
                                            subtitle: snapshotss.data[index]
                                                ["subtitle"],
                                            author: snapshotss.data[index]
                                                ["author"],
                                            category: snapshotss.data[index]
                                                ["category"],
                                            content: snapshotss.data[index]
                                                ["content"],
                                            estimate: snapshotss.data[index]
                                                ["estimate"],
                                            favorite: snapshotss.data[index]
                                                ["favorite"],
                                            seen:
                                                "${snapshotss.data[index]["seen"].length}",
                                            time:
                                                "${Jiffy(snapshotss.data[index]["timestamp"].toDate()).fromNow()}",
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              })
                        ],
                      ),
                    );
                  }
                });
          }
        });
  }
}
