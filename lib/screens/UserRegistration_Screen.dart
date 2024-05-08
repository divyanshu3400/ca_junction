import 'package:ca_junction/core/constant/text_style.dart';
import 'package:ca_junction/screens/Tasks/addTask_Screen.dart';
import 'package:ca_junction/theme/daytheme.dart';
import 'package:ca_junction/theme/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

class UserRegistrationScreen extends StatefulWidget {
  const UserRegistrationScreen({super.key});

  @override
  State<UserRegistrationScreen> createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  late String userPhoneNumber;
  String isoCode = 'IN';
  String countryCode = '+91';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: IconButton(
            color: AppColors.primaryColor,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              // Add your back button functionality here
            },
          ),
        ),
        title: Text('Add New User',
            style: const TextStyle(color: AppColors.primaryColor)),
        centerTitle: true,
        toolbarHeight: 80.0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // Adjust the height as needed
          child: Divider(
            thickness: 6.0,
            color: Color.fromRGBO(250, 246, 246, 1),
          ), // Change the color as needed
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // TextFormField(
              //   keyboardType: TextInputType.number,
              //   decoration: InputDecoration(
              //     labelText: 'GST Number',
              //   ),
              // ),
              Text("GST Number"),
              const SizedBox(height: 16.0),
              OtpForm2(),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: kinputBorderDecoration('Name of Firm'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: kinputBorderDecoration('Name of Person'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  labelStyle: const TextStyle(
                    color: Color.fromRGBO(2, 6, 20, 1),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(15, 13, 35, 1), width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  // suffixIcon: Image.asset('assets/images/Calendar.png'),
                ),
              ),
              const SizedBox(height: 16.0),

              // decoration: InputDecoration(labelText: 'Phone Number'),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(15, 13, 35, 1),
                    width: 1.0,
                  ), // Customize border properties as needed
                  borderRadius: BorderRadius.circular(
                      4), // Adjust border radius as needed
                  color: Color.fromRGBO(245, 245, 245, 1),
                ),
                child: InternationalPhoneNumberInput(
                  onInputChanged: (value) {
                    userPhoneNumber = value.phoneNumber!;
                  },
                  initialValue:
                      PhoneNumber(isoCode: isoCode, dialCode: countryCode),
                  keyboardType: TextInputType.phone,
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                  ),
                  cursorColor: Color.fromRGBO(15, 13, 35, 1),
                  inputBorder: OutlineInputBorder(),
                  inputDecoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: const TextStyle(
                      color: Color.fromRGBO(2, 6, 20, 1),
                    ),
                    border: InputBorder
                        .none, // Set input border to none to avoid duplication
                  ),
                ),
              ),

              const SizedBox(height: 16.0),
              TextFormField(
                decoration: kinputBorderDecoration('Email ID'),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      showCursor: false,
                      autofocus: true,
                      decoration: kinputBorderDecoration('State'),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      decoration: kinputBorderDecoration('District'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: kinputBorderDecoration('Pin Code'),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      decoration: kinputBorderDecoration('Admin ID'),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 255, 255, 255),
        child: RoundedButton2(
          colour: const Color.fromRGBO(255, 255, 255, 1),
          onPressed: () {
            // Navigator.of(context).pushNamed("phone_number");
            Navigator.pop(context);
          },
          title: 'Next',
          border: Color.fromRGBO(16, 13, 64, 1),
          textColor: Color.fromRGBO(16, 13, 64, 1),
        ),
      ),
    );
  }

  // InputDecoration kinputBorderDecoration(String hintText) {
  //   return InputDecoration(
  //     labelText: hintText,
  //     labelStyle: const TextStyle(
  //       color: Color.fromRGBO(2, 6, 20, 1),
  //     ),
  //     border: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(10.0),
  //     ),
  //     focusedBorder: OutlineInputBorder(
  //       borderSide:
  //           const BorderSide(color: Color.fromRGBO(15, 13, 35, 1), width: 1.0),
  //       borderRadius: BorderRadius.circular(10.0),
  //     ),
  //   );
  // }
}






class OtpForm2 extends StatefulWidget {
  @override
  _OtpForm2State createState() => _OtpForm2State();
}

class _OtpForm2State extends State<OtpForm2> {
  final FocusNode _firstFocusNode = FocusNode();
  final FocusNode _secondFocusNode = FocusNode();
  final FocusNode _thirdFocusNode = FocusNode();
  final FocusNode _fourthFocusNode = FocusNode();
  final FocusNode _fifthFocusNode = FocusNode();
  final FocusNode _sixthFocusNode = FocusNode();
  final FocusNode _seventhFocusNode = FocusNode();
  final FocusNode _eighthFocusNode = FocusNode();
  final FocusNode _ninthFocusNode = FocusNode();
  final FocusNode _tehthFocusNode = FocusNode();

  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _focusNodes = [
      _firstFocusNode,
      _secondFocusNode,
      _thirdFocusNode,
      _fourthFocusNode,
      _fifthFocusNode,
      _sixthFocusNode,
      _seventhFocusNode,
      _eighthFocusNode,
      _ninthFocusNode,
      _tehthFocusNode
    ];
  }

  @override
  void dispose() {
    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
    _fifthFocusNode.dispose();
    _sixthFocusNode.dispose();
    _seventhFocusNode.dispose();
    _eighthFocusNode.dispose();
    _ninthFocusNode.dispose();
    _tehthFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    

    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          10,
          (index) => SizedBox(
            height: 20,
            width: 25,
            child: TextField(
              autofocus: true,
              focusNode: _focusNodes[index],
              onChanged: (value) {
                if (value.isEmpty) {
                  // Move focus to the previous text field if the current one is empty
                  if (index > 0) {
                    FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                  }
                } else if (value.length == 1) {
                  // Move focus to the next text field if a digit is entered
                  if (index < 9) {
                    FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                  } else {
                    // If last text field, remove focus to hide the keyboard
                    _focusNodes[index].unfocus();
                  }
                }
              },
              style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ),
      ),
    );
  }
}



