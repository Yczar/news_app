import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:newsapp/constants.dart';
import 'package:newsapp/provider/user_provider.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;

  SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _fullname = TextEditingController();
  TextEditingController _password = TextEditingController();

//  String _email;
//  String _password;
//  bool loading = false;
//  bool _autoValidate = false;
//  String email = "";
//  String password = "";
//  String error = "";
//  String errorMsg = "";
  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Curves.fastOutSlowIn, parent: animationController));
    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
        parent: animationController));
    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(
          0.8,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
        parent: animationController));
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final user = Provider.of<UserProvider>(context);
    animationController.forward();
    String quotes =
        "My business always bores me to death; I prefer other people's";
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              brightness: Brightness.light,
              bottomOpacity: 0,
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0, top: 50),
                      child: Icon(
                        Icons.ac_unit,
                        color: Colors.black,
                        size: 13,
                      ),
                    ),
//              Padding(
//                padding: const EdgeInsets.only(bottom: 28.0, left: 30),
//                child: Icon(Icons.blur_circular, color: Colors.white, size: 13,),
//              ),
                    Padding(
                      padding: const EdgeInsets.only(top: 48.0),
                      child: Icon(
                        Icons.ac_unit,
                        color: Colors.black,
                        size: 8,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Icon(
                        Icons.adjust,
                        color: Colors.black,
                        size: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: Container(
//        height: double.infinity,
//        width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Stack(
                children: <Widget>[
                  ListView(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Center(
                              child: Text(
                            "Ekiti News Hub",
                            style: GoogleFonts.reenieBeanie(
                                color: Colors.black,
//                                fontFamily: 'reenie',
                                letterSpacing: 3,
                                fontSize: 20),
                          )),
                          Transform(
                            transform: Matrix4.translationValues(
                                delayedAnimation.value * width, 0.0, 0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 28.0, top: 50),
                                  child: Icon(
                                    Icons.ac_unit,
                                    color: Colors.black,
                                    size: 13,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 28.0, left: 30),
                                  child: Icon(
                                    Icons.blur_circular,
                                    color: Colors.black,
                                    size: 13,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 48.0),
                                  child: Icon(
                                    Icons.ac_unit,
                                    color: Colors.black,
                                    size: 8,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 18.0),
                                  child: Icon(
                                    Icons.adjust,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            LineAwesomeIcons.hubspot,
                            color: Colors.deepOrangeAccent[400],
                            size: 50,
                          ),
                          Transform(
                            transform: Matrix4.translationValues(
                                animation.value * width, 0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Ekiti News Hub,",
                                    style: kActiveTabStyle.copyWith(
                                        color: Colors.black),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Text(
                                      "Please Sign Up",
                                      style: kDetailContent.copyWith(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
//  child:   Text("Please Sign in", style: kDetailContent.copyWith(color: Colors.white, fontSize: 25),),
                      ),
                      Transform(
                        transform: Matrix4.translationValues(
                            delayedAnimation.value * width, 0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Form(
                            key: _formKey,
//               autovalidate: _autoValidate,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: Theme(
                                    data: Theme.of(context)
                                        .copyWith(primaryColor: Colors.black),
                                    child: TextFormField(
                                      controller: _fullname,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter your fullname ';
                                        } else {
                                          return null;
                                        }
                                      },

//                                   },
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        labelText: 'Fullname',
                                        labelStyle: GoogleFonts.cantarell(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                  child: Theme(
                                    data: Theme.of(context)
                                        .copyWith(primaryColor: Colors.black),
                                    child: TextFormField(
                                      controller: _email,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          Pattern pattern =
                                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                          RegExp regex = new RegExp(pattern);
                                          if (!regex.hasMatch(value))
                                            return 'Please make sure your email address is valid';
                                          else
                                            return null;
                                        }
                                      },

//                                   },
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        labelText: 'Email',
                                        labelStyle: GoogleFonts.cantarell(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                Theme(
                                  data: Theme.of(context)
                                      .copyWith(primaryColor: Colors.black),
                                  child: TextFormField(
                                    controller: _password,
                                    obscureText: true,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "The password field cannot be empty";
                                      } else if (value.length < 6) {
                                        return "the password has to be at least 6 characters long";
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      labelText: 'Password',
                                      labelStyle: GoogleFonts.cantarell(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]
                      )
                    ],


              ),
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.white,
              child: Transform(
                transform: Matrix4.translationValues(
                    muchDelayedAnimation.value * width, 0.0, 0.0),
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              widget.toggleView();
                            },
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: "If you already have an account,\n",
                                  style: GoogleFonts.cantarell(
                                      color: Colors.black),
                                ),
                                TextSpan(
                                  text: "Sign In",
                                  style: GoogleFonts.cantarell(
                                      color: Colors.black,
                                      decoration: TextDecoration.underline),
                                ),
                              ]),
                            ),
                          ),
//              Text("boo", style: TextStyle(color: Colors.white),),
                          Material(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.deepOrangeAccent[400],
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: InkWell(
                                onTap: () async {
                                  if (_formKey.currentState.validate()) {
                                    if (!await user.signUp(_fullname.text,
                                        _email.text, _password.text))
                                      _key.currentState.showSnackBar(SnackBar(
                                          content: Text("Sign Up failed")));
                                  }
                                },
                                child: user.status == Status.Authenticating
                                    ? CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                        )
                                    : Icon(
                                        Icons.arrow_forward,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                              ),
                            ),
                          )
                        ])),
              ),
            ),
          );
        });
  }
}
