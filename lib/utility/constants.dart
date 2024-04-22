
import 'package:ca_junction/theme/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

kOnboardingScreenTextColor(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);
  Color textColor = themeProvider.getPrimaryColor;
  return TextStyle(
    color: textColor,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
  );
}

kTitleTextColor(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);
  Color textColor = themeProvider.getTitleTextColor;
  return TextStyle(
    color: textColor,
    fontFamily: "Poppins",
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
  );
}


kDescriptionColor(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);
  Color descriptionTextColor = themeProvider.getDescriptionColor;
  return TextStyle(
    color: descriptionTextColor,
    fontFamily: "Poppins",
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
  );
}

// const kTextFieldDecoration = InputDecoration(
//   fillColor: Color.fromRGBO(247, 247, 247, 1), // Set your desired color here
//   filled: true,
//   border: OutlineInputBorder(
//     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//   ),
//   enabledBorder: OutlineInputBorder(
//     borderSide: BorderSide(color: Color.fromRGBO(196, 196, 196, 1), width: 1.0),
//     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//   ),
//   focusedBorder: OutlineInputBorder(
//     borderSide: BorderSide(color: Color.fromRGBO(15, 13, 35, 1), width: 2.0),
//     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//   ),
// );


InputDecoration kTextFieldDecoration(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);
  Color fillColor = themeProvider.getTextFieldColor;
  Color enabledBorderColor = themeProvider.getEnabledBorderColor;
  Color focusedBorderColor = themeProvider.getFocusedBorderColor;

  return InputDecoration(
    fillColor: fillColor,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: enabledBorderColor, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: focusedBorderColor, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
  );
}
