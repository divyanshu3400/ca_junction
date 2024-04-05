import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  const RoundedButton({required this.colour, required this.title, required this.onPressed});
  
  final Color colour;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Material(
            // elevation: 5.0,
            color: colour,
            // color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(8.0),
            child: MaterialButton(
              onPressed: (){
                onPressed();
              },
              minWidth: 200.0,
              height: 42.0,
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
