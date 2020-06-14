import 'dart:async';
import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:newsapp/provider/user_provider.dart';
import 'package:newsapp/widgets/profile_list_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';

class AccountView extends StatefulWidget {
  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  File fileImage;
  final StorageReference storageReference =
  FirebaseStorage.instance.ref().child("user images");
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    Future<String> uploadPhoto(mfile) async {
      StorageUploadTask mstorageUploadTask =
      storageReference.child("user${user.user.uid}.jpg").putFile(mfile);
      StorageTaskSnapshot storageTaskSnapshot =
      await mstorageUploadTask.onComplete;
      String downloadURL = await storageTaskSnapshot.ref.getDownloadURL();
      return downloadURL;
    }

    controlUploadAndSave(imagefile) async {
      setState(() {
        loading = true;
      });
      String downloadurl = await uploadPhoto(imagefile);
      Firestore.instance.collection("users").document(user.user.uid).updateData({
        "profileimage" : downloadurl
      });
      Fluttertoast.showToast(
          msg: "Updated Successfully", toastLength: Toast.LENGTH_SHORT);


      setState(() {
        fileImage = null;
        loading = false;
      });
    }
    captureImageWithCamera() async {
      Navigator.pop(context);
      File imagefile = await ImagePicker.pickImage(
          source: ImageSource.camera, maxHeight: 680, maxWidth: 970);
      controlUploadAndSave(imagefile);
//      setState(() {
//        this.fileImage = imagefile;
//      });
    }
    pickImageFromGallery() async {
      Navigator.pop(context);
      File imagefile = await ImagePicker.pickImage(
        source: ImageSource.gallery,
      );
      controlUploadAndSave(imagefile);
//      setState(() {
//        this.fileImage = imagefile;
//      });
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
                      Text("Select image from",
                        style: TextStyle(fontWeight: FontWeight.bold),),
                      Divider(),
                      InkWell(
                        onTap: pickImageFromGallery,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Icon(Icons.add_photo_alternate,
                                color: Colors.deepOrangeAccent[400],),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text("Gallery", style: TextStyle(
                                  color: Colors.black, fontSize: 18),),
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
                              child: Icon(Icons.camera,
                                color: Colors.deepOrangeAccent[400],),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text("Camera", style: TextStyle(
                                  color: Colors.black, fontSize: 18),),
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

    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);
    var geolocator = Geolocator();
    var locationOptions = LocationOptions(
        accuracy: LocationAccuracy.high, distanceFilter: 10);
    StreamSubscription<Position> positionStream = geolocator.getPositionStream(
        locationOptions).listen(
            (Position position) async {
          List<Placemark> placemarks = await Geolocator()
              .placemarkFromCoordinates(position.latitude, position.longitude);
          Placemark mPlaceMark = placemarks[0];
          print("${mPlaceMark.subAdministrativeArea}");
          Firestore.instance.collection("users")
              .document(user.user.uid)
              .updateData({
            "Location": mPlaceMark.subAdministrativeArea,
          });
          print(position == null ? 'Unknown' : position.latitude.toString() +
              ', ' + position.longitude.toString());
        });

    profileInfo(profileimage, displayname) {
      return Expanded(
        child: Column(
          children: <Widget>[
            Container(
              height: kSpacingUnit.w * 10,
              width: kSpacingUnit.w * 10,
              margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: kSpacingUnit.w * 5,
                    backgroundImage: NetworkImage(profileimage),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        takeImage(context);
                      },
                      child: Container(
                        height: kSpacingUnit.w * 2.5,
                        width: kSpacingUnit.w * 2.5,
                        decoration: BoxDecoration(
                          color: Theme
                              .of(context)
                              .accentColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          heightFactor: kSpacingUnit.w * 1.5,
                          widthFactor: kSpacingUnit.w * 1.5,
                          child: Icon(
                            LineAwesomeIcons.pen,
                            color: Colors.white,
                            size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: kSpacingUnit.w * 2),
            Text(
              "${displayname}",
              style: kTitleTextStyle,
            ),
            SizedBox(height: kSpacingUnit.w * 0.5),
            Text(
              "${user.user.email}",
              style: kDetailContent,
            ),
            SizedBox(height: kSpacingUnit.w * 2),
//          Container(
//            height: kSpacingUnit.w * 4,
//            width: kSpacingUnit.w * 20,
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
//              color: Theme.of(context).accentColor,
//            ),
//            child: Center(
//              child: Text(
//                'Upgrade to PRO',
//                style: kButtonTextStyle,
//              ),
//            ),
//          ),
          ],
        ),
      );
    }

//    var themeSwitcher = ThemeSwitcher(
//      builder: (context) {
//        return AnimatedCrossFade(
//          duration: Duration(milliseconds: 200),
//          crossFadeState:
//          ThemeProvider.of(context).brightness == Brightness.dark
//              ? CrossFadeState.showFirst
//              : CrossFadeState.showSecond,
//          firstChild: GestureDetector(
//            onTap: () =>
//                ThemeSwitcher.of(context).changeTheme(theme: kLightTheme),
//            child: Icon(
//              LineAwesomeIcons.sun,
//              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
//            ),
//          ),
//          secondChild: GestureDetector(
//            onTap: () =>
//                ThemeSwitcher.of(context).changeTheme(theme: kDarkTheme),
//            child: Icon(
//              LineAwesomeIcons.moon,
//              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
//            ),
//          ),
//        );
//      },
//    );
    header(profileimage, displayname) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(width: kSpacingUnit.w * 3),
          Icon(
            LineAwesomeIcons.user,
            color: Colors.deepOrangeAccent[400],
            size: ScreenUtil().setSp(kSpacingUnit.w * 3),
          ),
          profileInfo(profileimage, displayname),
//        themeSwitcher,
          SizedBox(width: kSpacingUnit.w * 3),
          SizedBox(width: kSpacingUnit.w * 3),
        ],
      );
    }

//    return ThemeSwitchingArea(
//      child: Builder(
//        builder: (context) {
    return StreamBuilder(
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
              body: Column(
                children: <Widget>[
                  SizedBox(height: kSpacingUnit.w * 2),
                  header(
                      snapshot.data["profileimage"], snapshot.data["fullname"]),
                  SizedBox(height: kSpacingUnit.w * 2),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        InkWell(
                          onTap: (){
                  updateData(context, "Occupation", user.user.uid);
                  },
                          child: ProfileListItem(
                            icon: LineAwesomeIcons.user_shield,
                            text: 'Occupation: ${snapshot.data["Occupation"]}',
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            updateData(context, "LGA", user.user.uid);
                          },
                          child: ProfileListItem(
                            icon: LineAwesomeIcons.city,
                            text: 'LGA of origin: ${snapshot.data["LGA"] ==
                                null ? "Unknown" : snapshot.data["LGA"]}',
                          ),
                        ),
                        ProfileListItem(
                          icon: LineAwesomeIcons.search_location,
                          text: 'Location: ${snapshot.data["Location"]}',
                        ),
                        ProfileListItem(
                          icon: LineAwesomeIcons.user_plus,
                          text: 'Invite a Friend',
                        ),
                        ProfileListItem(
                          icon: LineAwesomeIcons.question_circle,
                          text: 'Help & Support',
                        ),
                        InkWell(
                          onTap: () {
                            user.signOut();
                          },
                          child: ProfileListItem(
                            icon: LineAwesomeIcons.alternate_sign_out,
                            text: 'Logout',
                            hasNavigation: false,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        });
  }
  updateData(mcontext, data, uid) {
    TextEditingController textEditingController = TextEditingController();
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
                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.s,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Update your $data", style: kActiveTabStyle,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                          labelText: "$data",
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
                    ),
                    FlatButton(
                      onPressed: (){
                        Firestore.instance.collection("users").document(uid).updateData({
                          data : textEditingController.text
                        });
                        Navigator.pop(context);
                      },
                      color: Colors.deepOrangeAccent[400],
                      child: Text("Update"),
                    )
              ],
              ),
              )
          );
        }
    );


  }
}

