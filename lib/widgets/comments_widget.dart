import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jiffy/jiffy.dart';
import 'package:newsapp/constants.dart';
import 'package:newsapp/provider/user_provider.dart';
import 'package:provider/provider.dart';

class CommentsWidget extends StatefulWidget {
  String postid;
  CommentsWidget({this.postid});
  @override
  _CommentsWidgetState createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  Future getComments() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection("comments")
        .document(widget.postid)
        .collection("mycomments").orderBy("timestamp", descending: true)
        .getDocuments();
    return qn.documents;
  }
  bool Liked;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    bool isLiked;
    return FutureBuilder(
        future: getComments(),
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
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return StreamBuilder<DocumentSnapshot>(
                          stream: Firestore.instance.collection("users").document(snapshot.data[index]["ownerid"]).snapshots(),
                          builder: (context, snapshots) {
                            if (snapshots.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshots.hasError) {
                              return Center(child: Text("${snapshots.error.toString()}"));
                            } else if (!snapshots.hasData) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshots.hasData) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(snapshots.data["profileimage"]),
                                        radius: 20,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 3.0),
                                                child: Text(snapshots.data["fullname"], style: TextStyle(fontSize: 15, color: kBlack, fontWeight: FontWeight.bold),),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 3.0),
                                                child: Text("${snapshot.data[index]["comment"]}", style: TextStyle(fontSize: 13), overflow: TextOverflow.ellipsis, maxLines: 2,),
                                              ),

                                              Text("${Jiffy(snapshot.data[index]["timestamp"].toDate()).fromNow()}", style: TextStyle(fontSize: 12, color: kGrey2)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () async{
                                          await like(user.user.uid, "${snapshot.data[index]["commentid"]}");
                                        },
                                        icon: Icon(Icons.favorite_border, size: 15,),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }

                    });
              }
            );
          }

        });

  }
  isLiked(String uid, String commentid) async{
    DocumentReference documentReference = Firestore.instance.collection("comments").document(widget.postid).collection("mycomments")
        .document(commentid);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    List seen = documentSnapshot.data["like"];
    if (seen.contains(uid) == true) {
      setState(() {
        Liked == true;
      });

    } else {
      Liked == false;
    }
  }

 like(String uid, String commentid) async {
    DocumentReference documentReference = Firestore.instance.collection("comments").document(widget.postid).collection("mycomments")
        .document(commentid);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    List seen = documentSnapshot.data["like"];
    if (seen.contains(uid) == true) {
      documentReference.updateData({
        "like": FieldValue.arrayRemove([uid])
      });
      Fluttertoast.showToast(msg: "removed");

    } else {
      documentReference.updateData({
        "like": FieldValue.arrayUnion([uid])
      });
      Fluttertoast.showToast(msg: "added");
    }
  }
}

