import 'package:ca_junction/components/rounded_button.dart';
import 'package:ca_junction/theme/mytheme.dart';
import 'package:ca_junction/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountCreatedScreen extends StatelessWidget {
  const AccountCreatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeprovider.getBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: 194.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children:  [
                Text(
                  'Account Created',
                  style: kTitleTextColor(context),
                ),
                SizedBox(height: 15.0),
                Text(
                  'Your account has been created successfully. Press continue to continue using the app',
                  textAlign: TextAlign.center,
                  style: kDescriptionColor(context),
                ),
                SizedBox(height: 100.0,),
                Image(
                  image: AssetImage('assets/images/Account Created.png')
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RoundedButton(
                    colour: const Color.fromRGBO(16, 13, 64, 1), 
                    onPressed: (){
                      // Add skip logic here
                    }, 
                    title: 'Continue',
                    textColor: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  SizedBox(height: 8.0,),
                  Text(
                    'By clicking continue, you agree to our',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: themeprovider.getPurpleTextColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Add your Terms and Condition logic here
                    },
                    child: Text(
                      "Terms and Conditions",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontFamily: 'Poppins',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: themeprovider.getPurpleTextColor,
                      ),
                      
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.0,),
        ],
      ),
    );
  }
}