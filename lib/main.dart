import 'package:flutter/material.dart';
import 'package:newsapp/authenticate/login_page.dart';
import 'package:newsapp/authenticate/signup_page.dart';
import 'package:newsapp/bottomNav.dart';
import 'package:newsapp/provider/user_provider.dart';
import 'package:provider/provider.dart';

import 'authenticate/authenticate.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (_) => UserProvider.initialize(), child: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Room',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.deepOrangeAccent[400]
//        visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
      home: ScreensController(),
    );
  }
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch (user.status) {
      case Status.Uninitialized:
        return Authenticate();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return Authenticate();
      case Status.Authenticated:
        return BottomNav();
      default:
        return Authenticate();
    }
  }
}
