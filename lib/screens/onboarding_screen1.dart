
import 'package:ca_junction/components/rounded_button.dart';
import 'package:ca_junction/screens/signup.dart';
import 'package:ca_junction/theme/mytheme.dart';
import 'package:ca_junction/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:provider/provider.dart';

import '../components/content_model.dart';

class OnboardingScreen1 extends StatefulWidget {
  static const String id = 'onboarding_screen1';

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  // final themeprovider = Provider.of<ThemeProvider>(context);
  final int pageLength = 3;

  // Define the current page index
  int currentIndexPage = 0;
  late PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeprovider.getBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (value) {
                setState(() {
                  currentIndexPage = value;
                });
              },
              itemBuilder: (_, i) {
                return Column(
                  children: [
                    SizedBox(height: 194.0),
                    Expanded(
                      child: Image.asset(
                        contents[i].image,
                        // contents[i].image ?? "",
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      contents[i].title,
                      style: kOnboardingScreenTextColor(context),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      // height: 72.0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35.0),
                        child: Text(
                          textAlign: TextAlign.center,
                          contents[i].description,
                          style: kDescriptionColor(context),
                        ),
                      ),
                    ),
                  ],
                );
              }
            ), 
          ),
          DotsIndicator(
            decorator: DotsDecorator(
              color: themeprovider.getPurpleTextColor2, // Inactive color
              activeColor: themeprovider.getPurpleTextColor,
            ),
            dotsCount: pageLength,
            position: currentIndexPage,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                RoundedButton(
                  colour: const Color.fromRGBO(16, 13, 64, 1), 
                  onPressed: (){
                    // Navigator.pushNamed(context, OnboardingScreen2.id);
                    if(currentIndexPage == contents.length-1){
                      Navigator.of(context).pushNamed("signup_screen");
                    }
                    _controller.nextPage(
                      duration: Duration(milliseconds: 100), 
                      curve: Curves.bounceIn
                    );
                  }, 
                  title: 'Next Step',
                  textColor: Color.fromRGBO(255, 255, 255, 1),
                ),
                TextButton(
                  onPressed: () {
                    // Add your skip logic here
                    Navigator.of(context).pushNamed("signup_screen");
                  },
                  child: Text(
                    "Skip This Step",
                    style: TextStyle(
                      color: themeprovider.getPurpleTextColor,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}










// SafeArea(
//         child: Center(
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 30.0),
//             child: Column(
//               children: [
//                 SizedBox(height: 194.0),
//                 Expanded(
//                   child: Image(
//                     image: AssetImage("assets/images/Group 8902.png"),
//                     // fit: BoxFit.contain,
//                   ),
//                 ),
//                 SizedBox(height: 50),
//                 Text(
//                   widget.title,
//                   style: kOnboardingScreenTextColor(context),
//                 ),
//                 SizedBox(height: 20),
//                 Expanded(
//                   // height: 72.0,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 35.0),
//                     child: Text(
//                       textAlign: TextAlign.center,
//                       widget.description,
//                       style: kDescriptionColor(context),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 DotsIndicator(
//                   decorator: DotsDecorator(
//                     color: Color.fromRGBO(245, 245, 245, 1), // Inactive color
//                     activeColor: Color.fromRGBO(16, 13, 64, 1),
//                   ),
//                   dotsCount: pageLength,
//                   position: currentIndexPage,
//                 ),
//                 SizedBox(height: 30),
//                 RoundedButton(
//                   colour: const Color.fromRGBO(16, 13, 64, 1), 
//                   onPressed: (){
//                     Navigator.pushNamed(context, OnboardingScreen2.id);
//                   }, 
//                   title: 'Next Step',
//                   textColor: Color.fromRGBO(255, 255, 255, 1),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     // Add your skip logic here
//                     Navigator.pushNamed(context, SignUpScreen.id);
//                   },
//                   child: Text(
//                     "Skip This Step",
//                     style: TextStyle(
//                       color: themeprovider.getPurpleTextColor,
//                       fontFamily: "Poppins",
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16.0,
//                       decoration: TextDecoration.underline,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
    