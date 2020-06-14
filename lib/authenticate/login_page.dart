import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:newsapp/authenticate/signup_page.dart';
import 'package:newsapp/constants.dart';
import 'package:newsapp/provider/user_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final Function toggleView;

  LoginPage({this.toggleView});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    TextEditingController emailTextEditingController = TextEditingController();
    TextEditingController passwordTextEditingController =
        TextEditingController();
    final _formKey = GlobalKey<FormState>();
    bool loading = false;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
//                image: DecorationImage(image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken)),

              ),
              padding: EdgeInsets.only(left: 16, right: 16),
              child: ListView(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height / 8,),
//              Padding(
//                padding: const EdgeInsets.only(top: 10.0),
                     Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Icon(LineAwesomeIcons.hubspot, color: Colors.deepOrangeAccent[400], size: 50,),
                        Text("Ekiti News Hub", style: kActiveTabStyle.copyWith(fontSize: 30, color: Colors.white)),
                      ],
                    ),
//              ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Welcome,",
                        style: kTitleCard.copyWith(fontSize: 30, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Sign in to continue!",
                        style: kDetailContent.copyWith(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 50,),
                  Column(
                    children: <Widget>[
                      TextField(
                        controller: emailTextEditingController,
                        decoration: InputDecoration(
                          labelText: "Email Address",
                          labelStyle:
                              TextStyle(fontSize: 14, color: Colors.grey.shade400),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.red,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: passwordTextEditingController,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle:
                              TextStyle(fontSize: 14, color: Colors.grey.shade400),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.red,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Forgot Password ?",
                          style:
                              TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      loading ? CircularProgressIndicator() : Container(),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              loading = true;
                            });
                            user.signIn(emailTextEditingController.text,
                                passwordTextEditingController.text);
                            setState(() {
                              loading = true;
                            });
                          },
                          padding: EdgeInsets.all(0),
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
color: Colors.deepOrangeAccent[400]
//                          gradient: LinearGradient(
//                            begin: Alignment.centerLeft,
//                            end: Alignment.centerRight,
//                            colors: [
//                              Color(0xffff5f6d),
//                              Color(0xffff5f6d),
//                              Color(0xffffc371),
//                            ],
//                          ),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              constraints: BoxConstraints(
                                  maxWidth: double.infinity, minHeight: 50),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
//                  Container(
//                    height: 50,
//                    width: double.infinity,
//                    child: FlatButton(
//                      onPressed: () {},
//                      color: Colors.indigo.shade50,
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(6),
//                      ),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          Image.asset(
//                            "images/facebook.png",
//                            height: 18,
//                            width: 18,
//                          ),
//                          SizedBox(
//                            width: 10,
//                          ),
//                          Text(
//                            "Connect with Facebook",
//                            style: TextStyle(
//                                color: Colors.indigo,
//                                fontWeight: FontWeight.bold),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "I'm a new user.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.toggleView();
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
//    return Scaffold(
//      body: Stack(
//        children: <Widget>[
//          Container(
//            decoration: BoxDecoration(
//                image: DecorationImage(
//                    image: AssetImage('assets/news.png'),
//                    fit: BoxFit.cover,
//                    alignment: Alignment.topCenter
//                )
//            ),
//          ),
//          Container(
//            width: MediaQuery.of(context).size.width,
//            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3.5),
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(20),
//              color: Colors.white,
//            ),
//            child: Padding(
//              padding: EdgeInsets.all(23),
////              child: Form(
////                key: _formKey,
//                child: ListView(
//                  children: <Widget>[
//                    Row(
//                      children: <Widget>[
//                        Icon(LineAwesomeIcons.hubspot, color: Colors.deepOrangeAccent[400], size: 50,),
//                        Text("Ekiti News Hub", style: kActiveTabStyle.copyWith(fontSize: 30)),
//                      ],
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(top: 15.0),
//                      child: Text("Please Sign In", style: kDetailContent.copyWith(fontSize: 20, fontWeight: FontWeight.w100)),
//                    ),
//                    Padding(
//                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
//                      child: Container(
//                        color: Color(0xfff5f5f5),
//                        child: TextFormField(
//                          controller: emailTextEditingController,
//                          style: TextStyle(
//                              color: Colors.black,
//                              fontFamily: 'SFUIDisplay'
//                          ),
//                          decoration: InputDecoration(
//                              border: OutlineInputBorder(),
//                              labelText: 'Username',
//                              prefixIcon: Icon(Icons.person_outline, color: Colors.deepOrangeAccent[400],),
//                              labelStyle: TextStyle(
//                                  fontSize: 15
//                              ),
//                              hasFloatingPlaceholder: true
//                          ),
//                        ),
//                      ),
//                    ),
//                    Container(
//                      color: Color(0xfff5f5f5),
//                      child: TextField(
////                        controller: passwordTextEditingController,
//                        obscureText: true,
//                        style: TextStyle(
//                            color: Colors.black,
//                            fontFamily: 'SFUIDisplay'
//                        ),
//                        decoration: InputDecoration(
//                            border: OutlineInputBorder(),
//                            labelText: 'Password',
//                            prefixIcon: Icon(Icons.lock_outline, color: Colors.deepOrangeAccent[400],),
//                            labelStyle: TextStyle(
//                                fontSize: 15
//                            )
//                        ),
//                      ),
//                    ),
//                    Padding(
//                      padding: EdgeInsets.only(top: 20),
//                      child: MaterialButton(
//                        onPressed: (){
//                          user.signIn(emailTextEditingController.text, passwordTextEditingController.text);
//                        },
//                        child: Text('SIGN IN',
//                          style: TextStyle(
//                            fontSize: 15,
//                            fontFamily: 'SFUIDisplay',
//                            fontWeight: FontWeight.bold,
//                          ),
//                        ),
//                        color: Colors.deepOrangeAccent[400],
//                        elevation: 0,
//                        minWidth: 400,
//                        height: 50,
//                        textColor: Colors.white,
//                        shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.circular(10)
//                        ),
//                      ),
//                    ),
//                    Padding(
//                      padding: EdgeInsets.only(top: 20),
//                      child: Center(
//                        child: Text('Forgot your password?',
//                          style: TextStyle(
//                              fontFamily: 'SFUIDisplay',
//                              fontSize: 15,
//                              fontWeight: FontWeight.bold
//                          ),
//                        ),
//                      ),
//                    ),
//                    Padding(
//                      padding: EdgeInsets.only(top: 30),
//                      child: Center(
//                        child: RichText(
//                          text: TextSpan(
//                              children: [
//                                TextSpan(
//                                    text: "Don't have an account?",
//                                    style: GoogleFonts.openSans(
////                                    fontFamily: 'SFUIDisplay',
//                                      color: Colors.black,
//                                      fontSize: 15,
//                                    )
//                                ),
//                                TextSpan(
//                                  text: " sign up",
//                                  style: kDetailContent.copyWith(color: Colors.deepOrangeAccent[400], fontSize: 15),
//                                )
//                              ]
//                          ),
//                        ),
//                      ),
//                    )
//                  ],
//                ),
////              ),
//            ),
//          )
//        ],
//      ),
//    );
  }
}

//class LoginPage extends StatelessWidget{

//  }
//}
