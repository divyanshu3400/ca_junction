import 'package:ca_junction/components/rounded_button.dart';
import 'package:ca_junction/theme/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePassword_Screen extends StatefulWidget {
  static const String id = 'changePassword_screen';

  @override
  State<ChangePassword_Screen> createState() => _ChangePassword_ScreenState();
}

class _ChangePassword_ScreenState extends State<ChangePassword_Screen> {
  bool passwordShow = true;

  TextEditingController passwordController = TextEditingController();
  TextEditingController new_passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);
  return Scaffold(
    backgroundColor: themeprovider.getBackgroundColor,
    body: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        // color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 70), // Adjust height as needed
            Text(
              'Change Password',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: themeprovider.getTitleTextColor,
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 162), // Adjust height as needed
            TextField(
              controller: passwordController,
              obscureText: passwordShow,
              cursorColor: themeprovider.getSecondaryColor,
              style: TextStyle(
                color: themeprovider.getTitleTextColor, // Use the theme provider for input text color
              ),
              decoration: InputDecoration(
                hintText: 'Enter new password',
                hintStyle: TextStyle(
                  color: themeprovider.getChangePasswordThemeColor, // Use the theme provider for hint text color
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(231, 232, 234, 1)), // Set the color to black
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(231, 232, 234, 1)), // Set the color to black
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
            SizedBox(height: 20), // Adjust height as needed
            TextField(
              controller: new_passwordController,
              obscureText: passwordShow,
              cursorColor: themeprovider.getSecondaryColor,
              style: TextStyle(
                color: themeprovider.getTitleTextColor, // Use the theme provider for input text color
              ),
              decoration: InputDecoration(
                hintText: 'Re-Enter new password',
                hintStyle: TextStyle(
                  color: themeprovider.getChangePasswordThemeColor, // Use the theme provider for hint text color
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(231, 232, 234, 1)), // Set the color to black
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(231, 232, 234, 1)), // Set the color to black
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    ),
    bottomNavigationBar: Container(
      padding: EdgeInsets.symmetric(horizontal: 23.0),
      // color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RoundedButton(
            colour: const Color.fromRGBO(16, 13, 64, 1), 
            onPressed: (){
              // Perform sign up action
            }, 
            title: 'Save',
            textColor: Color.fromRGBO(255, 255, 255, 1),
          ),
          SizedBox(height: 10), // Add spacing between buttons
          RoundedButton(
            colour: const Color.fromRGBO(255, 255, 255, 1), 
            onPressed: (){
              // Perform action with phone number
              
            }, 
            title: 'Cancel',
            border: Color.fromRGBO(16, 13, 64, 1),
            textColor: Color.fromRGBO(16, 13, 64, 1),
          ),
          SizedBox(height: 10.0,),
        ],
      ),
    ),
  );
}

}



// Positioned(
//                 left: 24,
//                 top: 644,
//                 child: Container(
//                   width: 327,
//                   height: 128,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           width: double.infinity,
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           decoration: ShapeDecoration(
//                             color: Color(0xFF100D40),
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                           ),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Save',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontFamily: 'Poppins',
//                                   fontWeight: FontWeight.w600,
//                                   height: 0,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       Expanded(
//                         child: Container(
//                           width: double.infinity,
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           decoration: ShapeDecoration(
//                             shape: RoundedRectangleBorder(
//                               side: BorderSide(width: 1, color: Color(0xFF100D40)),
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                           ),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'Cancel',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   color: Color(0xFF100D40),
//                                   fontSize: 16,
//                                   fontFamily: 'Poppins',
//                                   fontWeight: FontWeight.w600,
//                                   height: 0,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
              