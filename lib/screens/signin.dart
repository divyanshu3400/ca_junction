import 'package:ca_junction/components/rounded_button.dart';
import 'package:ca_junction/screens/forgotPassword_screen.dart';
import 'package:ca_junction/theme/mytheme.dart';
import 'package:ca_junction/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn_Screen extends StatefulWidget {
  static const String id = 'signin_screen';

  @override
  State<SignIn_Screen> createState() => _SignIn_ScreenState();
}

class _SignIn_ScreenState extends State<SignIn_Screen> {

  final _formKey = GlobalKey<FormState>(); // Declare _formKey here

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool passwordShow = true;

  @override

  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: themeprovider.getBackgroundColor),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 288,
                decoration: BoxDecoration(color: Color(0xFF100D40)),
              ),
            ),
            Positioned(
              left: 0,
              top: 320,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    key: _formKey, // Assign the key to the Form widget
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'Welcome Back!',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: themeprovider.getTitleTextColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Email Address',
                          style: TextStyle(
                            color: themeprovider.getTitleTextColor,
                            fontFamily: 'Poppins',
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 7.0),
                        TextFormField(
                          controller: emailController,
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
                          decoration: kTextFieldDecoration(context),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Password',
                          style: TextStyle(
                            color: themeprovider.getTitleTextColor,
                            fontFamily: 'Poppins',
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 7.0),
                        TextFormField(
                          controller: passwordController,
                          cursorColor: themeprovider.getSecondaryColor,
                          obscureText: passwordShow,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: themeprovider.getTitleTextColor,
                          ),
                          decoration: InputDecoration(
                            fillColor: themeprovider.getTextFieldColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: themeprovider.getEnabledBorderColor, width: 1.0),
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: themeprovider.getFocusedBorderColor, width: 2.0),
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  passwordShow = !passwordShow;
                                });
                              },
                              child: Icon(
                                color: themeprovider.getPurpleTextColor,
                                passwordShow == true ? Icons.visibility : Icons.visibility_off,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 7.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed("forgotPassword_screen");
                              },
                              child: Text(
                                'Forgot Password ?',
                                style: TextStyle(
                                  color: Color.fromRGBO(196, 196, 196, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.0),
                        RoundedButton(
                          colour: const Color.fromRGBO(16, 13, 64, 1),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, proceed with signin logic
                              // Access email and password with emailController.text and passwordController.text
                            }
                          },
                          title: 'Sign In',
                          textColor: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account ?',
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0,
                                color: themeprovider.getTitleTextColor,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed("signup_screen");
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: themeprovider.getTitleTextColor,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 24,
              top: 92,
              child: Text(
                'CA Junction',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 146,
              child: Image(
                color: Color.fromRGBO(255, 255, 255, 1),
                image: AssetImage('assets/images/Layer 3.png'),
              ),
            ),
            Positioned(
              right: 0,
              top: 85.0,
              child: Image(
                color: Color.fromRGBO(255, 255, 255, 1),
                image: AssetImage('assets/images/Layer 2.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }

}




