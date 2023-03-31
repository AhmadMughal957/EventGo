import 'package:eventgo/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;
  bool loading=false;
  late String email;
  late String password;
  bool _passwordVisible=true;

  void initState() {
    _passwordVisible = false;
  }
  @override
  Widget build(BuildContext context) {


    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: 830,
          width: 450,
          child: Stack(
            children: <Widget>[

              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(.9),
                          Colors.black.withOpacity(.1),
                        ])),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 27.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      //TODO update this
                      'Join Your Event',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 22,
                                  width: 22,
                                  child: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            height: 50,
                            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Colors.white70
                                  )
                              ),
                              style: TextStyle(fontSize: 16,
                                  color: Colors.white),
                              onChanged: (value) {
                                email=value;
                              },
                            )),
                      ],
                    ),
                    //city
                    SizedBox(
                      height: 16,
                    ),
                    //TODO remove unwanted containers
                    Stack(
                      children: <Widget>[
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 22,
                                  width: 22,
                                  child: Icon(
                                    Icons.home,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            height: 50,
                            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  hintText: 'City',
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Colors.white70
                                  )
                              ),
                              style: TextStyle(fontSize: 16,
                                  color: Colors.white),
                            )),
                      ],
                    ),
                    //phonenumber
                    SizedBox(
                      height: 16,
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 22,
                                  width: 22,
                                  child: Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            height: 50,
                            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  hintText: 'Mobile Number',
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Colors.white70
                                  )
                              ),
                              style: TextStyle(fontSize: 16,
                                  color: Colors.white),
                            )),
                      ],
                    ),
                    //college
                    SizedBox(
                      height: 16,
                    ),

                    Stack(
                      children: <Widget>[
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 22,
                                  width: 22,
                                  child: Icon(
                                    Icons.vpn_key,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            height: 50,
                            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: Colors.white70
                                ),
                              ),
                              style: TextStyle(fontSize: 16,
                                  color: Colors.white),
                              onChanged: (value) {
                                password=value;
                              },
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Signin(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)
                      ),
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Center(
                          child: Text(
                            "Already have an account",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white),
                          )),
                    ),
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget Signin(){
    return loading?CircularProgressIndicator(strokeWidth: 3,color: Colors.black,):ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black
        ),
        onPressed: (){
          setState(() {
            loading=true;
            _auth.createUserWithEmailAndPassword(email: email, password: password).then((value){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreen()));
              setState(() {
                loading=false;
              });
            }).onError((error, stackTrace){

              setState(() {
                loading=false;
              });
              final snackBar=SnackBar(
                content:  Text('${error.toString()}'),
                backgroundColor: (Colors.black),
                action: SnackBarAction(
                  label: 'dismiss',
                  onPressed: () {
                  },
                ),

              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            });
          });

        },
        child: Text('Sign up'));
  }
}