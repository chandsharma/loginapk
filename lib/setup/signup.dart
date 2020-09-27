import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:start/Animation/FadeAnimation.dart';
import 'package:start/setup/signin.dart';

import '../welcome.dart';

class  Signup extends StatefulWidget {

  @override
  _State createState() => _State();
}
///////////////////////////////////////////////////

class Signuphere extends StatefulWidget {
  @override
  _SignuphereState createState() => _SignuphereState();
}

class _SignuphereState extends State<Signuphere> {

  String _email, _password;
  final _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _formKey,
      body: Container(
        //padding: EdgeInsets.symmetric(vertical: 30),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/pexels-photo-323682.jpeg"),
                fit: BoxFit.cover
              //fit: BoxFit.cover
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 80,),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(.5, Text("Dealicious", style: TextStyle(color: Colors.white, fontSize: 40),)),
                    //SizedBox(height: 10,),
                    //FadeAnimation(.8, Text("Welcome", style: TextStyle(color: Colors.white, fontSize: 20),)),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Form(
                key: _formKey,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(100, 100, 255, .4),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(90), topRight: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 1,),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FadeAnimation(.5, Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 30),)),
                              //SizedBox(height: 10,),
                              //FadeAnimation(.8, Text("Welcome", style: TextStyle(color: Colors.white, fontSize: 20),)),
                            ],
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(25, 95, 225, .3),
                                  blurRadius: 20,
                                  offset: Offset(0,10)
                              )]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.black))
                                  ),
                                  child: FadeAnimation(1.1, TextFormField(
                                    validator: (input) {
                                      if(input.isEmpty){
                                        return 'Please type an email';
                                      }
                                      //return 'enter email';
                                    },
                                    onSaved: (input) => _email = input,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Email or Phone number',
                                      //hintText: "Email or Phone number",
                                      hintStyle: TextStyle(color: Colors.black54),
                                      border: InputBorder.none,
                                    ),
                                    controller:  _phoneController,
                                  ))
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.black))
                                  ),
                                  child: FadeAnimation(1.4,TextFormField(
                                    validator: (input) {
                                      if(input.length < 4) {
                                        return 'Minimum 4 characters';
                                      }
                                    },
                                    onSaved: (input) => _password = input,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        labelText: 'Password',
                                        //hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.black54),
                                        border: InputBorder.none
                                    ),
                                  ))
                              )
                            ],
                          ),
                        ),
                        //SizedBox(height: 2,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Forgot Password?", style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold),),
                          ],
                        ),
                        //Text("Forgot Password?", style: TextStyle( color: Colors.white)),
                        SizedBox(height: 20,),
                        FadeAnimation(1.7, GestureDetector(
                            onTap: () {
                              signup();
                            },
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.indigo[900],
                                  boxShadow: [BoxShadow(
                                      color: Color.fromRGBO(25, 95, 225, .3),
                                      blurRadius: 20,
                                      offset: Offset(0,10)
                                  )]
                              ),
                              child: Center(
                                  child: Text("Sign Up", style: TextStyle(color : Colors.white, fontWeight: FontWeight.bold),)
                              ),
                            )
                        ),),/**
                            FadeAnimation(1.7, Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.indigo[900],
                            boxShadow: [BoxShadow(
                            color: Color.fromRGBO(25, 95, 225, .3),
                            blurRadius: 20,
                            offset: Offset(0,10)
                            )]
                            ),
                            child: GestureDetector(
                            onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewScreen()));
                            },
                            child: Center(
                            child: Text("Login", style: TextStyle(color : Colors.white, fontWeight: FontWeight.bold),)),
                            ),
                            )),**/
                        SizedBox(height: 30,),
                        Text("Continue with Social Media", style: TextStyle(color : Colors.black, fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        OutlineButton(
                          splashColor: Colors.grey,
                          onPressed: () {
                          },
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                          highlightElevation: 0,
                          borderSide: BorderSide(color: Colors.grey),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(image: AssetImage("assets/images/google_logo.png"), height: 25.0),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    'Sign Up with Google',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black54,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        OutlineButton(
                          splashColor: Colors.grey,
                          onPressed: () {},
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                          highlightElevation: 0,
                          borderSide: BorderSide(color: Colors.grey),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(image: AssetImage("assets/images/facebook-logo-png-38347.png"), height: 25.0),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    'Sign Up with Facebook',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black54,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        /**FadeAnimation(2,Row(
                            children: <Widget>[
                            Expanded(
                            child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                            image: DecorationImage(
                            image: AssetImage("assets/images/google_logo.png"),
                            fit: BoxFit.fitHeight
                            //fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.deepOrange.withOpacity(0),
                            boxShadow: [BoxShadow(
                            color: Color.fromRGBO(25, 95, 225, .3),
                            blurRadius: 20,
                            offset: Offset(0,10)
                            )]
                            ),
                            /**child: Center(
                            child: Text("Google", style: TextStyle(color : Colors.white, fontWeight: FontWeight.bold)),
                            ),**/
                            ),
                            ),
                            //SizedBox(width: 10,),
                            Expanded(
                            child: Container(

                            height: 50,
                            decoration: BoxDecoration(
                            image: DecorationImage(
                            image: AssetImage("assets/images/facebook-logo-png-38347.png"),
                            fit: BoxFit.fitHeight
                            //fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.deepOrange.withOpacity(0),
                            boxShadow: [BoxShadow(
                            color: Color.fromRGBO(25, 95, 225, .3),
                            blurRadius: 20,
                            offset: Offset(0,10)
                            )]
                            ),
                            ),
                            )
                            ],
                            )
                            )**/
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
  Future <void> signup() async{
    final formState = _formKey.currentState;


    if(formState.validate()) {
      formState.save();
      try{
        UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        user.user.updateProfile(displayName: 'chandan');
        user.user.sendEmailVerification();
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp(user: user.user)));
        //print("chandan\n\n\n");
        print(user.toString());
      }catch(e){
        print(e.message);
      }
      //Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
    }
  }
}


////////////////////////////////////////////////////
class _State extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(onPressed: navtosignin,child: Text('sign in'),
          ),
          RaisedButton(onPressed: navtosignup,
          child: Text('Signup'),)
        ],
      ),
    );
  }

  void navtosignin() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),fullscreenDialog: true));
  }
  void navtosignup() {

    Navigator.push(context, MaterialPageRoute(builder: (context) => Signuphere()));
  }
}
