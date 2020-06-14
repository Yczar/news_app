import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:newsapp/constants.dart';
import 'package:newsapp/database.dart';
import 'package:newsapp/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:stringprocess/stringprocess.dart';
import 'package:uuid/uuid.dart';

class AddView extends StatefulWidget {
  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  String postid = Uuid().v4();
  File fileImage;
  final StorageReference storageReference =
  FirebaseStorage.instance.ref().child("Post images");
  bool loading = false;
  PostDatabase postDatabase = PostDatabase();
  String _currentCategory;
  String time_ago = "2hours";
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController subtitleEditingController = TextEditingController();
  TextEditingController contentEditingController = TextEditingController();
  final List<String> newsTags = [
    'Health',
    'Tech',
    'Politics',
    'Business',
    'Fashion',
    'Food',
    'Education',
    'Celebrities',
    'Lifestyle',
    'Religion',
    'Sports'];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    int read_time = 10;
    return StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
            .collection("users")
            .document(user.user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error.toString()}"));
          } else if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: Icon(LineAwesomeIcons.plus_circle, color: Colors.deepOrangeAccent[400],),
                elevation: 0,
                title: Text("Add News", style: kActiveTabStyle,),
                bottomOpacity: 0,
              ),
              body: loading? Center(child: CircularProgressIndicator()) : Container(
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView(
                      children: <Widget>[
                        InkWell(
                          onTap: (){
                            takeImage(context);
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height/3,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)) ,
                              border: new Border.all(
                                style: BorderStyle.solid,
                                color: Colors.grey.shade400,
                                width: 0.5,
                              ),
                            ),
                            child: fileImage != null ? Image.file(fileImage, fit: BoxFit.cover,) : Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.add, color: Colors.deepOrangeAccent[400],),
                                  Text("Tap to add an Image")
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextField(
                          controller: titleEditingController,
                          decoration: InputDecoration(
                            labelText: "Title",
                            labelStyle: TextStyle(
                                fontSize: 14, color: Colors.grey.shade400),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextField(
                          controller: subtitleEditingController,
                          decoration: InputDecoration(
                            labelText: "Subtitle",
                            labelStyle: TextStyle(
                                fontSize: 14, color: Colors.grey.shade400),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextField(
                          controller: contentEditingController,
                          maxLines: 3000,
                          minLines: 12,
                          decoration: InputDecoration(
                            labelText: "Content",
                            labelStyle: TextStyle(
                              fontSize: 14, color: Colors.grey.shade400,),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        DropdownButtonFormField(
                          value: _currentCategory,
                          iconEnabledColor: Colors.black,
                          hint: (Text(
                            'Select your News Category',
                            style: TextStyle(
                                fontFamily: 'cantarell',
                                fontSize: 15,),
                          )),
                          decoration: InputDecoration(
                            labelText: "Tag",
                            labelStyle: TextStyle(
                              fontSize: 14, color: Colors.grey.shade400,),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                )),
                          ),
                          items: newsTags.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                '$value',
                                style: TextStyle(
                                    fontFamily: 'cantarell',
                                    fontSize: 15,),
                              ),
                            );
                          }).toList(),
                          onChanged: (val) =>
                              setState(() => _currentCategory = val),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        InkWell(
                          onTap: (){
                            StringProcessor tps = new StringProcessor();
                            double readtime = (tps.getWordCount(contentEditingController.text) / 200);
                            String reade;
                            print(tps.getWordCount(contentEditingController.text));
                            if(readtime.round() < 1){
                              reade = "${(readtime * 60).round()} sec read";
                            }else if(readtime.round() > 1){
                              reade = "${readtime.round()} min read";
                            }
                            controlUploadAndSave(user.user.uid, snapshot.data["fullname"], reade);
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.deepOrangeAccent[400]
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              constraints: BoxConstraints(maxWidth: double.infinity,minHeight: 50),
                              child: Text("Upload",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
//              Container(
//              child: Center(
//                child: FlatButton(
//                  onPressed: () {
//                    postDatabase.addPosts(
//                      user.user.uid,
//                        postid,
//                        "title",
//                        "subtitle",
//                        "content",
//                        "category",
//                        "time",
//                        snapshot.data["fullname"],
//                        "seen",
//                        "favorite",
//                        "image",
//                        "estimate");
//                  },
//                  child: Text("add"),
//                ),
//              ),
//            );
          }
        });
  }

  controlUploadAndSave(String uid, String author, String read) async {
    setState(() {
      loading = true;
    });
    String downloadurl = await uploadPhoto(fileImage);
    postDatabase.addPosts(uid, postid, titleEditingController.text, subtitleEditingController.text, contentEditingController.text, _currentCategory, time_ago, author, "4.5k", "45", downloadurl, read);
    Fluttertoast.showToast(
        msg: "Added Successfully", toastLength: Toast.LENGTH_SHORT);


    setState(() {
      fileImage = null;
      loading = false;
      postid = Uuid().v4();
    });
  }
  Future<String> uploadPhoto(mfile) async {
    StorageUploadTask mstorageUploadTask =
    storageReference.child("post$postid.jpg").putFile(mfile);
    StorageTaskSnapshot storageTaskSnapshot =
    await mstorageUploadTask.onComplete;
    String downloadURL = await storageTaskSnapshot.ref.getDownloadURL();
    return downloadURL;
  }
  takeImage(mcontext) {
    return showDialog(
        context: mcontext,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
//            side: BorderSide(color: appBlack),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              height: 200,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),

              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Select image from", style: TextStyle(fontWeight: FontWeight.bold),),
                    Divider(),
                    InkWell(
                      onTap: pickImageFromGallery,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Icon(Icons.add_photo_alternate, color: Colors.deepOrangeAccent[400],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text("Gallery", style: TextStyle(color: Colors.black, fontSize: 18),),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: captureImageWithCamera,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Icon(Icons.camera, color: Colors.deepOrangeAccent[400],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text("Camera", style: TextStyle(color: Colors.black, fontSize: 18),),
                          ),
                        ],
                      ),
                     ),

                  ],
                ),
              ),
            ),
          );
        });
  }
  captureImageWithCamera() async {
    Navigator.pop(context);
    File imagefile = await ImagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 680, maxWidth: 970);
    setState(() {
      this.fileImage = imagefile;
    });
  }
  pickImageFromGallery() async {
    Navigator.pop(context);
    File imagefile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      this.fileImage = imagefile;
    });
  }
}


