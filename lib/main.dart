import 'package:flutter/material.dart';
import 'package:ta_caro/modules/login/login_page.dart';
import 'package:ta_caro/modules/login/pages/creat_account/create_account_page.dart';
import 'package:ta_caro/modules/splash/splash_page.dart';

void main() {
  runApp(TaCaroApp());
}

class TaCaroApp extends StatelessWidget {
  const TaCaroApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ta Caro App',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/login',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/login': (context) => LoginPage(),
        '/login/create-account': (context) => CreateAccountPage(),
      },
    );
  }
}
