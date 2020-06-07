import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/provider/user_provider.dart';
import 'package:newsapp/widgets/common.dart';
import 'package:provider/provider.dart';

import '../bottomNav.dart';

class SignupPage extends StatefulWidget {
  final Function toggleView;

  SignupPage({this.toggleView});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Create Account,",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Sign up to get started!",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade400),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: fullnameController,
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w600),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red),
                        ),
//                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        labelText: "Email ID",
                        labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w600),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red),
                        ),
//                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: passwordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          hasFloatingPlaceholder: true
//                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      child: FlatButton(
                        onPressed: () {},
                        padding: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xffff5f6d),
                                Color(0xffff5f6d),
                                Color(0xffffc371),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            constraints: BoxConstraints(
                                minHeight: 50, maxWidth: double.infinity),
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: FlatButton(
                        onPressed: () async {
                          print(passwordcontroller.text);
                          if(_formKey.currentState.validate()){
                            setState(() {
                              loading = true;
                            });
                          }
                          if(!await user.signUp(fullnameController.text, emailcontroller.text, passwordcontroller.text)){
                            print("failed");
                          }
//                          changeScreenReplacement(context, BottomNav());
                        },
                        color: Colors.indigo.shade50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "images/facebook.png",
                              height: 18,
                              width: 18,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Connect with Facebook",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "I'm already a member.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.toggleView();
                      },
                      child: Text(
                        "Sign in.",
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
    );
  }
}

//class SignupPage extends StatelessWidget {


//  bool isLoading = false;
//
//  @override
//  Widget build(BuildContext context) {
//
//}
