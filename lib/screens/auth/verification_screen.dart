import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tenantmodule/constants/app_theme.dart';

import '../home_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  static const routeName = 'verification-screen';

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();

  // OTP Fields' Controllers
  final _firstDigitController = TextEditingController();
  final _secondDigitController = TextEditingController();
  final _thirdDigitController = TextEditingController();
  final _fourthDigitController = TextEditingController();

  Widget _otpField(TextEditingController inputController) {
    return SizedBox(
      height: 68,
      width: 64,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        validator: (value) {
          if (value!.isEmpty) {
            return '';
          }
          return null;
        },
        onSaved: (value) {
          inputController.text = value!;
        },
        controller: inputController,
        decoration: const InputDecoration(
            hintStyle: TextStyle(
              color: Color.fromARGB(36, 71, 163, 94),
            ),
            hintText: "0"),
        style: Theme.of(context).textTheme.titleLarge,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }

  _submitOTP() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamedAndRemoveUntil(
          context, HomeScreen.routeName, (route) => false);
    }
  }

  _resendOTP() {
    print("Resending the OTP message");
  }

  @override
  void dispose() {
    _firstDigitController.dispose();
    _secondDigitController.dispose();
    _thirdDigitController.dispose();
    _fourthDigitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String phoneNumber = routeArguments['phoneNumber'] as String;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: kBodyColor,
          foregroundColor: kPrimaryColorDark,
        ),
        body: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.15, 20, 0),
            child: Column(
              children: [
                Text(
                  "Enter the verification code sent to: $phoneNumber",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _otpField(_firstDigitController),
                      _otpField(_secondDigitController),
                      _otpField(_thirdDigitController),
                      _otpField(_fourthDigitController)
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .7,
                  child: ElevatedButton(
                    onPressed: _submitOTP,
                    child: const Text('Verify'),
                  ),
                ),
                const SizedBox(height: 30),
                const Text("Didn't receive the code ?"),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: _resendOTP,
                  child: const Text(
                    "Resend it",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      color: kSecondaryColor,
                    ),
                  ),
                )
              ],
            )));
  }
}
