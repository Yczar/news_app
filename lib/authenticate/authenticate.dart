import 'package:flutter/material.dart';
import 'package:newsapp/authenticate/login_page.dart';
import 'package:newsapp/authenticate/signup_page.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (!showSignIn) {
      return SignupPage(toggleView: toggleView);
    } else {
      return LoginPage(toggleView: toggleView);
    }
  }
////    return Container();
//  }
}
