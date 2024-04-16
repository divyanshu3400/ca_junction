
import 'package:ca_junction/screens/accontcreated_screen.dart';
import 'package:ca_junction/screens/changePassword_screen.dart';
import 'package:ca_junction/screens/forgotPassword_screen.dart';
import 'package:ca_junction/screens/onboarding_screen1.dart';
import 'package:ca_junction/screens/phone_number.dart';
import 'package:ca_junction/screens/signin.dart';
import 'package:ca_junction/screens/signup.dart';
import 'package:ca_junction/screens/splash_screen.dart';
import 'package:ca_junction/screens/verification_screen.dart';
import 'package:ca_junction/theme/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ca_junction/utility/shared_pref.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized(); // Ensure WidgetsBinding is initialized
  await SharedPref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        
        home: SplashScreen(),
        routes: {
          // ChangePassword_Screen.id :(context) => ChangePassword_Screen(),
          

          "splash_screen": (context) =>  SplashScreen(),
          "onboarding_screen1": (context) => OnboardingScreen1(),
          "signup_screen": (context) => SignUp_Screen(),
          "phone_number": (context) => PhoneNumber_Screen(),
          "signin_screen": (context) => SignIn_Screen(),
          "verification_screen": (context) => Vereification_Screen(),
          "accontcreated_screen": (context) => AccountCreated_Screen(),
          "forgotPassword_screen": (context) => ForgotPassword_Screen(),
          "changePassword_screen": (context) => ChangePassword_Screen(),

          // "sign": (context) => harshit(),
          // "signin": (context) => aman(),
          // "signup": (context) => Signup(),
          // "TextPost": (context) => TextPost(),
          // "rollno": (context) => Rollno(),
          // "grid": (context) => game(),
          // "post": (context) => post(),
          // "preveiw":(context) => preveiw(),
          // "marketPlace":(context) => Home(),
          // "homeScreen":(context) => HomeScreen(),
          // "homeScreenText":(context) => HomeScreenText(),
          
        }
      ),
    );
  }
}

// class CaJunction extends StatefulWidget {
//   const CaJunction({super.key});

//   @override
//   State<CaJunction> createState() => _CaJunctionState();
// }

// class _CaJunctionState extends State<CaJunction> {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => ThemeProvider(),
//         ),
//       ],
//       child: MaterialApp(
        
//         initialRoute: SplashScreen.id,
//         routes: {
//           SplashScreen.id :(context) =>const SplashScreen(),
//           OnboardingScreen1.id :(context) =>  OnboardingScreen1(),
//           SignUpScreen.id :(context) =>   SignUpScreen(),
//           PhoneNumber.id :(context) => PhoneNumber(),
//           Vereification_Screen.id :(context) => Vereification_Screen(),
//           AccountCreated_Screen.id :(context) => AccountCreated_Screen(),
//           SignIn_Screen.id :(context) => SignIn_Screen(),
//           ForgotPassword_Screen.id :(context) => ForgotPassword_Screen(),
//           // UserListScreen.id:(context) => UserListScreen(),//2
//           // UserChatScreen.id :(context) => UserChatScreen(senderId: SharedPref.getString(Constants.UUID)!, receiverId: SharedPref.getString(Constants.clickedUser)!, isGroupChat: false),
//         }
//       ),
//     );
//   }
// }


