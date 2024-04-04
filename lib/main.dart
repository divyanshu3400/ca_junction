
import 'package:ca_junction/screens/onboarding_screen1.dart';
import 'package:ca_junction/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: CaJunction(),
    );
  }
}

class CaJunction extends StatefulWidget {
  const CaJunction({super.key});

  @override
  State<CaJunction> createState() => _CaJunctionState();
}

class _CaJunctionState extends State<CaJunction> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id :(context) =>const SplashScreen(),
        OnboardingScreen1.id :(context) => const OnboardingScreen1(),
        // LoginScreen.id :(context) => LoginScreen(),
        // RegistrationScreen.id :(context) => RegistrationScreen(),
        // UserListScreen.id:(context) => UserListScreen(),//2
        // UserChatScreen.id :(context) => UserChatScreen(senderId: SharedPref.getString(Constants.UUID)!, receiverId: SharedPref.getString(Constants.clickedUser)!, isGroupChat: false),
      }
    );;
  }
}