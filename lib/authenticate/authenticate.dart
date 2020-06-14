import 'package:flutter/material.dart';
import 'package:newsapp/views/gallery_view.dart';
import 'package:newsapp/authenticate/login_page.dart';
import 'package:newsapp/authenticate/signin.dart';
import 'package:newsapp/authenticate/signup.dart';


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
      return SignUp(toggleView: toggleView,);
    } else {
      return SignIn(toggleView: toggleView);
    }
  }
////    return Container();
//  }
}
