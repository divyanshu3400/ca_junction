import 'package:ca_junction/components/rounded_button.dart';
import 'package:ca_junction/theme/daytheme.dart';
import 'package:ca_junction/theme/mytheme.dart';
import 'package:ca_junction/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});


  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeprovider.getBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              height: 812,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(color: themeprovider.getBackgroundColor),
              child: Stack(
                children: [
                  Positioned(
                    left: 86,
                    top: 108,
                    child: Text(
                      'Forgot Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: themeprovider.getTitleTextColor,
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 98,
                    top: 207,
                    height: 179,
                    child: Image(image: AssetImage('assets/images/Forget Password.png'),),
                  ),
                  Positioned(
                    left: 24,
                    top: 440,
                    height: 48,
                    width: 307,
                    child: Text(
                      'Enter your registered email below to receive password reset instruction',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: themeprovider.getDescriptionColor,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 528,
                    child: Form(
                      child: Text(
                        'Email Address',
                        style: TextStyle(
                          color: themeprovider.getTitleTextColor,
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        )
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 558,
                    width: 327,
                    child: TextFormField(
                      controller: emailController,
                      decoration: kTextFieldDecoration(context),
                      cursorColor: themeprovider.getSecondaryColor,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: themeprovider.getTitleTextColor,
                      ),

                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 716,
                    width: 327,
                    child: Form(
                      child: RoundedButton(
                        colour: AppColors.primaryColor,
                        onPressed: (){
                          //Add skip logic here
                          Navigator.of(context).pushNamed("changePassword_screen");
                        },
                        title: 'Send Verification Code',
                        textColor: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}







