import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:newsapp/views/read_news_view.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          },
        ),
        title: Text("Search"),
        elevation: 0,
        bottomOpacity: 0,
      ),
      body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Politics"),
              subtitle: Text("23k"),
            );
          }),
    );
  }
}

class Datasearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return null;
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return null;
  }
}

class DataSearch extends SearchDelegate<String> {
  Future<QuerySnapshot> querySnapshot =
      Firestore.instance.collection("posts").getDocuments();
  final cities = ["Ondo", "Lagos", "Akure", "Ibadan", "lokoja", "benue"];
  final recentcities = ["Ondo", "Lagos", "Akure", "Ibadan", "benue"];

//  final List
  Future getPosts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection("posts")
        .orderBy("timestamp", descending: true)
        .getDocuments();
    return qn.documents;
  }

  Future getSuggestionPosts(search) async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection("posts").where("title", isEqualTo: search)
        .getDocuments();
    return qn.documents;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("posts").snapshots(),
        builder: (context, snapshots) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshots.hasError) {
            return Center(child: Text("${snapshots.error.toString()}"));
          } else if (!snapshots.hasData) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshots.hasData) {
            List cour = [];
            var title = snapshots.data.documents
                .map((DocumentSnapshot doc) => doc["title"])
                .toList();
            print(title);
//            print(title);
            final suggesstionList = query.isEmpty
                ? title
                : title
                    .where((p) => p.toString().toUpperCase().startsWith(query))
                    .toList();
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
                      itemBuilder: (context, index) {
//                        print(suggesstionList);
                        print(suggesstionList[index]);
                        return FutureBuilder(
                            future: getSuggestionPosts(suggesstionList[index]) ,
                            builder: (context, snapshotss) {
                              if (snapshotss.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshotss.hasError) {
                                return Center(
                                    child:
                                        Text("${snapshotss.error.toString()}"));
                              } else if (!snapshotss.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshotss.hasData) {
                                return ListTile(
                                  onTap: () {
                                    print(snapshotss.data[0]["title"].toString());
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => ReadNewsView(
                                                  title: "",
                                                  subtitle: "",
                                                  timestamp: "",
                                                  imageurl: "",
                                                  postid: "",
                                                  time: "",
                                                  userid: "",
                                                  seen: "",
                                                  favorite: "",
                                                  estimate: "",
                                                  content: "",
                                                  category: "",
                                                  author: "",
                                                  image: "",
                                                  ownerid: "",
                                                  username: "",
                                                ))));
                                  },
//                          leading: Image.network(imageurl[index]),
                                  title: RichText(
                                    text: TextSpan(
                                        text: suggesstionList[index]
                                            .toString()
                                            .substring(0, query.length),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                              text: suggesstionList[index]
                                                  .toString()
                                                  .substring(query.length),
                                              style:
                                                  TextStyle(color: Colors.grey))
                                        ]),
                                  ),
                                );
                              }
                            });
                      },
                      itemCount: suggesstionList.length,
                    );
                  }
                });
          }
        });
  }
}
