import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newsapp/constants.dart';
import 'package:newsapp/database.dart';
import 'package:newsapp/models/news.dart';
import 'package:newsapp/provider/user_provider.dart';
import 'package:newsapp/widgets/circle_button.dart';
import 'package:newsapp/widgets/comments_widget.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ReadNewsView extends StatefulWidget {
  final String title;
  final String userid;
  String postid;
  final String subtitle;
  final String content;
  final String category;
  final String time;
  final String author;
  final String imageurl;
  final timestamp;
  final String username;
  final String seen;
  final String favorite;
  final String ownerid;
  final String image;
  final String estimate;
  ReadNewsView({this.username, this.timestamp, this.ownerid, this.image, this.imageurl, this.postid, this.time, this.estimate, this.favorite, this.seen, this.author, this.category, this.content, this.subtitle, this.title, this.userid});
  @override
  _ReadNewsViewState createState() => _ReadNewsViewState();
}

class _ReadNewsViewState extends State<ReadNewsView> {
  TextEditingController commentEditingController = TextEditingController();
  String commentid = Uuid().v4();
  void add() async{
    DocumentReference documentReference = Firestore.instance.collection("posts").document(widget.postid);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    List seen = documentSnapshot.data["seen"];
    if(seen.contains(widget.userid) == true){

    }else{
      documentReference.updateData({
        "seen" : FieldValue.arrayUnion([widget.userid]),
        "viewscount": FieldValue.increment(1)
      });
    }
  }
  bool ex = false;
  Future<bool> getDoc() async{
    var a = await Firestore.instance.collection('favorite').document(widget.userid).collection("myFavorite").document("${widget.postid}").get();
    if(a.exists){
      print('Exists');
//      setState(() {
//        ex = true;
//      });
      return true;
    }
    if(!a.exists){
      print('Not exists');
//      setState(() {
//        ex = false;
//      });
      return null;
    }

  }

  @override
  void initState() {
    // TODO: implement initState
//    getDoc();
   add();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserProvider>(context);
     final doc = getDoc();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(18.0, 15.0, 18.0, 0),
              child: Row(
                children: [
                  CircleButton(
                    icon: Icons.arrow_back_ios,
                    onTap: () => Navigator.pop(context),
                  ),
                  Spacer(),
                  CircleButton(
                    icon: Icons.share,
                    onTap: () {},
                  ),
                 StreamBuilder<DocumentSnapshot>(
                    stream: Firestore.instance.collection('favorite').document(widget.userid).collection("myFavorite").document("${widget.postid}").snapshots(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none: return new Text('Press button to start');
                        case ConnectionState.waiting: return new CircularProgressIndicator();
                        default:
                          if (snapshot.hasError)
                            return new Text('Error: ${snapshot.error}');
                          else if(!snapshot.data.exists){
                            return CircleButton(
                                icon: Icons.favorite_border,
                                onTap: () {
                              Firestore.instance.collection('favorite')
                                  .document(widget.userid).collection(
                                  "myFavorite").document("${widget.postid}")
                                  .setData({
                                "ownerid" : widget.ownerid,
                                "postid" : widget.postid,
                                "title" : widget.title,
                                "subtitle" : widget.subtitle,
                                "content" : widget.content,
                                "category" : widget.category,
                                "time" : widget.time,
                                "timestamp" : widget.timestamp,
                                "author" : widget.author,
                                "seen" : [],
                                "favorite" : widget.favorite,
                                "image" : widget.image,
                                "estimate" : widget.estimate
                              });
                            });
                          }
                          return CircleButton(icon: Icons.favorite,onTap: (){
                            Firestore.instance.collection('favorite').document(widget.userid).collection("myFavorite").document("${widget.postid}").delete();
                          },);
                      }

                    }
                  )
                      ]
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          children: [
            SizedBox(height: 12.0),
             Container(
                height: 220.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: NetworkImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            SizedBox(height: 15.0),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 15.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: kGrey3, width: 1.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 5.0,
                        backgroundColor: kGrey3,
                      ),
                      SizedBox(width: 6.0),
                      Text(
                        widget.category,
                        style: kCategoryTitle,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Status(
                  icon: Icons.remove_red_eye,
                  total: widget.seen,
                ),
                SizedBox(width: 15.0),
//                Status(
//                  icon: Icons.favorite_border,
//                  total: widget.favorite,
//                ),
              ],
            ),
            SizedBox(height: 12.0),
            SelectableText(widget.title, style: kTitleCard.copyWith(fontSize: 28.0)),
            SizedBox(height: 15.0),
            Row(
              children: [
                SelectableText(widget.time, style: kDetailContent),
                SizedBox(width: 5.0),
                SizedBox(
                  width: 10.0,
                  child: Divider(
                    color: kBlack,
                    height: 1.0,
                  ),
                ),
                SizedBox(width: 5.0),
                SelectableText(
                  widget.author,
                  style: kDetailContent.copyWith(color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            SelectableText(
              widget.content,
              style: descriptionStyle,
            ),
            SizedBox(height: 25.0),
            Text("Comments: "),
            SizedBox(height: 10,),
            CommentsWidget(postid: widget.postid,),
            Container(
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom:8.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(widget.imageurl),
                      radius: 20,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: TextField(
                        controller: commentEditingController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10.0),
                          labelText: "Add a comment",
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600),
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black),
                          ),
//                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      if(commentEditingController.text.isEmpty){
                        Fluttertoast.showToast(msg: "Comments can't be emepty");
                      }else {
                        sendComments(user.user.uid);
                        commentEditingController.clear();
                        setState(() {
                          commentid = new Uuid().v4();
                        });
                      }
                    },
                    icon: Icon(Icons.send),
                  )
                ],
              ),

            ),
          ],
        ),
      ),
//      bottomNavigationBar: BottomAppBar(
//        child: ,
//      ),
    );
  }
  sendComments(String ownerid,){
    PostDatabase postDatabase = PostDatabase();
    postDatabase.addComments(ownerid, widget.postid, commentid, commentEditingController.text);


  }
}

class Status extends StatelessWidget {
  final IconData icon;
  final String total;
  Status({this.icon, this.total});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.deepOrangeAccent[400], size: 15,),
        SizedBox(width: 4.0),
        Text(total, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ],
    );
  }
}



