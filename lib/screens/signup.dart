import 'package:ca_junction/components/rounded_button.dart';
import 'package:ca_junction/screens/phone_number.dart';
import 'package:ca_junction/screens/signin.dart';
import 'package:ca_junction/theme/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../utility/constants.dart';


class SignUp_Screen extends StatefulWidget {
  static const String id = 'signup_screen';

  const SignUp_Screen({Key? key}) : super(key: key);

  @override
  State<SignUp_Screen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUp_Screen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordShow = true;
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeprovider.getBackgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 168.0),
              Text(
                'Welcome !',
                style: kTitleTextColor(context),
              ),
              SizedBox(height: 40.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Full Name field
                      Text(
                        'Full Name',
                        style: TextStyle(
                          color: themeprovider.getTitleTextColor,
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 7.0),
                      TextFormField(
                        controller: usernameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                        cursorColor: themeprovider.getSecondaryColor,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                          color: themeprovider.getTitleTextColor,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: themeprovider.getTextFieldColor,
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),

                      // Email Address field
                      Text(
                        'Email Address',
                        style: TextStyle(
                          color: themeprovider.getTitleTextColor,
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 7.0),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        cursorColor: themeprovider.getSecondaryColor,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: themeprovider.getTextFieldColor,
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                          color: themeprovider.getTitleTextColor,
                        ),
                      ),
                      const SizedBox(height: 10.0),

                      // Password field
                      Text(
                        'Password',
                        style: TextStyle(
                          color: themeprovider.getTitleTextColor,
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 7.0),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        cursorColor: themeprovider.getSecondaryColor,
                        obscureText: passwordShow,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                          color: themeprovider.getTitleTextColor,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: themeprovider.getTextFieldColor,
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.0),
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
                      SizedBox(height: 10.0),

                      // Terms and conditions checkbox
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return themeprovider.getCheckBoxColor;
                              }
                              return themeprovider.getCheckBoxColor;
                            }),
                            checkColor: Color.fromRGBO(16, 13, 64, 1),
                            value: _agreeToTerms,
                            onChanged: (newValue) {
                              setState(() {
                                _agreeToTerms = newValue!;
                              });
                            },
                          ),
                          Text(
                            'I agree to our Terms and Conditions',
                            style: TextStyle(
                              color: themeprovider.getTitleTextColor,
                              fontFamily: 'Poppins',
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0),

                      // Sign Up button
                      RoundedButton(
                        colour: const Color.fromRGBO(16, 13, 64, 1),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, proceed with signup logic
                            // Access fields with usernameController.text, emailController.text, passwordController.text
                          }
                        },
                        title: 'Sign Up',
                        textColor: Color.fromRGBO(255, 255, 255, 1),
                      ),

                      // Sign Up with Phone Number button
                      RoundedButton(
                        colour: const Color.fromRGBO(255, 255, 255, 1),
                        onPressed: () {
                          Navigator.of(context).pushNamed("phone_number");
                        },
                        title: 'With Phone Number',
                        border: Color.fromRGBO(16, 13, 64, 1),
                        textColor: Color.fromRGBO(16, 13, 64, 1),
                      ),
                    ],
                  ),
                ),
              ),

              // Already have an account? Sign In button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account ?',
                    style: TextStyle(
                      color: themeprovider.getTitleTextColor,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("signin_screen");
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: themeprovider.getPurpleTextColor,
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
    );
  }
}

















// class SignUp_Screen extends StatefulWidget {
//   static const String id = 'signup_screen';

//   const SignUp_Screen({Key? key}) : super(key: key);

//   @override
//   State<SignUp_Screen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUp_Screen> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   bool passwordShow = true;
//   bool _agreeToTerms = false;

//   @override
//   Widget build(BuildContext context) {
//     final themeprovider = Provider.of<ThemeProvider>(context);
//     return Scaffold(
//       backgroundColor: themeprovider.getBackgroundColor,
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               SizedBox(height: 168.0),
//               Text(
//                 'Welcome !',
//                 style: kTitleTextColor(context),
//               ),
//               SizedBox(height: 40.0),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 22),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Full Name field
//                       Text(
//                         'Full Name',
//                         style: TextStyle(
//                           color: themeprovider.getTitleTextColor,
//                           fontFamily: 'Poppins',
//                           fontSize: 12.0,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                       const SizedBox(height: 7.0),
//                       TextFormField(
//                         controller: usernameController,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your full name';
//                           }
//                           return null;
//                         },
//                         cursorColor: themeprovider.getSecondaryColor,
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w400,
//                           fontSize: 14.0,
//                           color: themeprovider.getTitleTextColor,
//                         ),
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: themeprovider.getTextFieldColor,
//                           border: InputBorder.none,
//                           enabledBorder: InputBorder.none,
//                           focusedBorder: InputBorder.none,
//                         ),
//                       ),
//                       const SizedBox(height: 10.0),

//                       // Email Address field
//                       Text(
//                         'Email Address',
//                         style: TextStyle(
//                           color: themeprovider.getTitleTextColor,
//                           fontFamily: 'Poppins',
//                           fontSize: 12.0,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                       const SizedBox(height: 7.0),
//                       TextFormField(
//                         controller: emailController,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your email';
//                           }
//                           return null;
//                         },
//                         cursorColor: themeprovider.getSecondaryColor,
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: themeprovider.getTextFieldColor,
//                           border: InputBorder.none,
//                           enabledBorder: InputBorder.none,
//                           focusedBorder: InputBorder.none,
//                         ),
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w400,
//                           fontSize: 14.0,
//                           color: themeprovider.getTitleTextColor,
//                         ),
//                       ),
//                       const SizedBox(height: 10.0),

//                       // Password field
//                       Text(
//                         'Password',
//                         style: TextStyle(
//                           color: themeprovider.getTitleTextColor,
//                           fontFamily: 'Poppins',
//                           fontSize: 12.0,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                       const SizedBox(height: 7.0),
//                       TextFormField(
//                         controller: passwordController,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your password';
//                           }
//                           return null;
//                         },
//                         cursorColor: themeprovider.getSecondaryColor,
//                         obscureText: passwordShow,
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w400,
//                           fontSize: 14.0,
//                           color: themeprovider.getTitleTextColor,
//                         ),
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: themeprovider.getTextFieldColor,
//                           border: InputBorder.none,
//                           enabledBorder: InputBorder.none,
//                           focusedBorder: InputBorder.none,
//                           suffixIcon: InkWell(
//                             onTap: () {
//                               setState(() {
//                                 passwordShow = !passwordShow;
//                               });
//                             },
//                             child: Icon(
//                               color: themeprovider.getPurpleTextColor,
//                               passwordShow == true ? Icons.visibility : Icons.visibility_off,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 10.0),

//                       // Terms and conditions checkbox
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Checkbox(
//                             fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
//                               if (states.contains(MaterialState.disabled)) {
//                                 return themeprovider.getCheckBoxColor;
//                               }
//                               return themeprovider.getCheckBoxColor;
//                             }),
//                             checkColor: Color.fromRGBO(16, 13, 64, 1),
//                             value: _agreeToTerms,
//                             onChanged: (newValue) {
//                               setState(() {
//                                 _agreeToTerms = newValue!;
//                               });
//                             },
//                           ),
//                           Text(
//                             'I agree to our Terms and Conditions',
//                             style: TextStyle(
//                               color: themeprovider.getTitleTextColor,
//                               fontFamily: 'Poppins',
//                               fontSize: 12.0,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 30.0),

//                       // Sign Up button
//                       RoundedButton(
//                         colour: const Color.fromRGBO(16, 13, 64, 1),
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             // If the form is valid, proceed with signup logic
//                             // Access fields with usernameController.text, emailController.text, passwordController.text
//                           }
//                         },
//                         title: 'Sign Up',
//                         textColor: Color.fromRGBO(255, 255, 255, 1),
//                       ),

//                       // Sign Up with Phone Number button
//                       RoundedButton(
//                         colour: const Color.fromRGBO(255, 255, 255, 1),
//                         onPressed: () {
//                           Navigator.of(context).pushNamed("phone_number");
//                         },
//                         title: 'With Phone Number',
//                         border: Color.fromRGBO(16, 13, 64, 1),
//                         textColor: Color.fromRGBO(16, 13, 64, 1),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               // Already have an account? Sign In button
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Already have an account ?',
//                     style: TextStyle(
//                       color: themeprovider.getTitleTextColor,
//                       fontFamily: "Poppins",
//                       fontWeight: FontWeight.w400,
//                       fontSize: 12.0,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pushNamed("signin_screen");
//                     },
//                     child: Text(
//                       "Sign In",
//                       style: TextStyle(
//                         color: themeprovider.getPurpleTextColor,
//                         fontFamily: "Poppins",
//                         fontWeight: FontWeight.w600,
//                         fontSize: 12.0,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



