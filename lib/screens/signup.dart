import 'package:ca_junction/components/rounded_button.dart';
import 'package:ca_junction/core/router/routers.dart';
import 'package:ca_junction/theme/daytheme.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/constant/text_style.dart';
import '../input_form_field.dart';
import '../utility/constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordShow = true;
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 168.0),
              Text(
                'Welcome !',
                style: kTitleTextColor(context),
              ),
              const SizedBox(height: 40.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Full Name field
                      const Text(
                        'Full Name',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 7.0),
                      InputFormField(
                        borderRadius: BorderRadius.circular(10),
                        fillColor: const Color(0xfffafafa),
                        textEditingController: usernameController,
                        validator: Validators.isValidName,
                        hintTextStyle: AppTextStyle.textStyleOne(
                          const Color(0xffC4C5C4),
                          14,
                          FontWeight.w400,
                        ),
                        hintText: 'Enter your name',
                        borderType: BorderType.none,
                      ),
                      const SizedBox(height: 10.0),

                      // Email Address field
                      const Text(
                        'Email Address',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 7.0),
                      InputFormField(
                        borderRadius: BorderRadius.circular(10),
                        fillColor: const Color(0xfffafafa),
                        textEditingController: emailController,
                        validator: Validators.isValidEmail,
                        hintTextStyle: AppTextStyle.textStyleOne(
                          const Color(0xffC4C5C4),
                          14,
                          FontWeight.w400,
                        ),
                        hintText: 'Enter your Email Address',
                        borderType: BorderType.none,
                      ),
                      const SizedBox(height: 10.0),

                      // Password field
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 7.0),
                      InputFormField(
                        borderRadius: BorderRadius.circular(10),
                        fillColor: const Color(0xfffafafa),
                        password: EnabledPassword(),
                        obscuringCharacter: '*',
                        validator: Validators.isValidPassword,
                        hintTextStyle: AppTextStyle.textStyleOne(
                          const Color(0xffC4C5C4),
                          14,
                          FontWeight.w400,
                        ),
                        hintText: 'Enter Account Password',
                        borderType: BorderType.none,
                        textEditingController: passwordController,
                      ),
                      const SizedBox(height: 10.0),

                      // Terms and conditions checkbox
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return AppColors.mutedTextColor;
                              }
                              return AppColors.white;
                            }),
                            checkColor: const Color.fromRGBO(16, 13, 64, 1),
                            value: _agreeToTerms,
                            onChanged: (newValue) {
                              setState(() {
                                _agreeToTerms = newValue!;
                              });
                            },
                          ),
                          const Text(
                            'I agree to our Terms and Conditions',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontFamily: 'Poppins',
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30.0),

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
                        textColor: const Color.fromRGBO(255, 255, 255, 1),
                      ),

                      // Sign Up with Phone Number button
                      RoundedButton(
                        colour: const Color.fromRGBO(255, 255, 255, 1),
                        onPressed: () {
                          context.go('/${Routers.phoneSignUp}');
                        },
                        title: 'With Phone Number',
                        border: AppColors.primaryColor,
                        textColor: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              // Already have an account? Sign In button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account ?',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go('/${Routers.signIn}');
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: AppColors.primaryColor,
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
