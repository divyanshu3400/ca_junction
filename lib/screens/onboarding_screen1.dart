
import 'package:ca_junction/components/rounded_button.dart';
import 'package:ca_junction/theme/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:provider/provider.dart';

class OnboardingScreen1 extends StatefulWidget {
  static const String id = 'onboarding_screen1';
  // final String imageAsset;
  final String title;
  final String description;


  OnboardingScreen1(
    {
      super.key,
      // required this.imageAsset, 
      required this.description, 
      required this.title
    }
  );

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  // final themeprovider = Provider.of<ThemeProvider>(context);
  final int pageLength = 3;

  // Define the current page index
  final int currentIndexPage = 0;

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              SizedBox(height: 194.0),
              Image(
                image: AssetImage("assets/images/Group 8902.png"),
              ),
              SizedBox(height: 50),
              Text(
                widget.title,
                style: TextStyle(
                  color: themeprovider.getTitleTextColor,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 20),
              Container(
                // height: 72.0,
                padding: EdgeInsets.symmetric(horizontal: 35.0),
                child: Text(
                  textAlign: TextAlign.center,
                  widget.description,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
                ),
              ),
              SizedBox(height: 30),
              DotsIndicator(
                dotsCount: pageLength,
                position: currentIndexPage,
              ),
              SizedBox(height: 50),
              RoundedButton(
                colour: const Color.fromRGBO(16, 13, 64, 1), 
                onPressed: (){}, 
                title: 'Next Step',
              ),
              TextButton(
                onPressed: () {
                  // Add your skip logic here
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
      ),
    );
  }
}



