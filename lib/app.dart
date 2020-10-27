import 'package:flutter/material.dart';
import 'package:pill_project_app/pages/reviewPage.dart';
import 'package:pill_project_app/pages/home.dart';

import 'login/login.dart';
import 'login/signin_page.dart';
import 'medicineInfoNreview/phil_info.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IYMY',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      //home: Home() ,
      initialRoute: '/signIn', //############CONNECT
      routes: {
        '/login': (context) => LogInPage(),
        '/home': (context) => HomePage(),
        '/review': (context) => ReviewPage(),
        '/pillInfo': (context) => PhilInfoPage(),
        '/signIn': (context) => SignInPage(),
//        '/favoriteHotel': (context) => FavoriteHotelPage(),
//        '/website': (context) => WebsitePage(),
//        '/myPage': (context) => MyPage(),
      }
    );
  }

}