import 'dart:async';


import 'package:eventgo/View/MainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


/// This is a reimplementation of the default Flutter application using provider + [ChangeNotifier].
var emaill;

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner:false,
      home: SplashScreen(),
    ),
  );
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    final _auth= FirebaseAuth.instance;
    final user= _auth.currentUser;
    if(user !=null) {
      Timer(Duration(seconds: 2), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>SignInOrRegister()));
      });

    }else{
      Timer(Duration(seconds: 2), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  SignInOrRegister()));
      });
    }
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
              height: 800,
              width: 400,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 400,
                    width: 400,
                    child:Image.asset('assets/images/Property_logo.png')
                  ),
                  Text(" PropertyPro",
                  style: TextStyle(
                    fontSize: 50,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.green
                  ),),
                ],
              )
          ),

        ],
      ),
    );
  }
}




