import 'package:cloud_firestore/cloud_firestore.dart';


import 'models/news.dart';

class PostDatabase {
  final DateTime timeStamp = DateTime.now();
  Future<void> addPosts(
      String ownerid,
      String postid,
      String title,
      String subtitle,
      String content,
      String category,
      String time,
      String author,
      String seen,
      String favorite,
      String image,
      String estimate) async {
    Firestore.instance
        .collection("posts")
        .document(postid)
        .setData({
      "ownerid" :ownerid,
      "postid" : postid,
      "title" : title,
      "subtitle" : subtitle,
      "content" : content,
      "category" : category,
      "time" : time,
      "viewscount":0,
      "timestamp" : timeStamp,
      "author" : author,
      "seen" : [],
      "favorite" : favorite,
      "image" : image,
      "estimate" : estimate
    });
  }

  Future<void> addComments(String ownerid, String postid, String commentid, String comment) async{
    Firestore.instance.collection("comments").document(postid).collection("mycomments").document(commentid).setData({
      "ownerid" : ownerid,
      "postid" : postid,
      "like" : [],
      "commentid" : commentid,
      "comment" : comment,
      "timestamp" : timeStamp
    });
  }
}

class SearchService{
  searchByName(String searchField){
    return Firestore.instance.collection("posts").where("title", isEqualTo: searchField.substring(0,1).toUpperCase()).getDocuments();
  }
}
