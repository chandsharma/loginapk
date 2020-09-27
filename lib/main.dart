import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start/setup/authentication.dart';
import 'package:start/setup/signin.dart';
import 'package:start/setup/signup.dart';
import 'package:start/welcome.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapu());
/**
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthenticationWrapper(),
      ) //Material App
  **/
}

class Myapu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
              create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
              create: (context) => context.read<AuthenticationService>().authStateChanges,)
        ],
      child: MaterialApp(
        title: 'something',
        home: AuthenticationWrapper(),
      ),
    );

  }
}

class AuthenticationWrapper extends StatelessWidget{
  const AuthenticationWrapper({
    Key key,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if(firebaseUser != null)
      {return MyApp(user: firebaseUser);}

    return HomePage();
  }
}