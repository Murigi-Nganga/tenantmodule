// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './verification_screen.dart';
import '../../constants/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // AuthProvider auth = Provider.of<AuthProvider>(context);

    _doLogin() {
      // if(_formKey.currentState!.validate()) {
      //   auth.login(email: emailController.text,
      //       password: passwordController.text).then((response) {
      //     if (response["status"] == true) {
      //       showSnackBar(context, response["message"], Icons.task_alt, kPrimaryColorLight);
      //       Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
      //     } else {
      //       showSnackBar(context, response["message"], Icons.info_outlined, kAccentColor);
      //     }
      //   });
      // }
      if (_formKey.currentState!.validate()) {
        Navigator.pushNamed(context, VerificationScreen.routeName,
            arguments: {'phoneNumber': phoneNumberController.text});
      }
    }

    return Scaffold(
      body: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.15, 20, 0),
          child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              const Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      height: 50,
                      child: Icon(
                        Icons.home,
                        color: kSecondaryColor,
                        size: 50.0,
                      ))),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.center,
                child: SizedBox(
                  child: Text(
                    "Log In",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Enter your phone number to receive a sign-in code',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 35),
              TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your phone number";
                    }
                    if (value.length < 10) {
                      return "Phone number should be a minimum of 10 digits";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    phoneNumberController.text = value!.trim();
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(15),
                  ],
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone_rounded),
                    hintText: 'Phone Number',
                  )),
              const SizedBox(height: 35),
              // auth.loggedInStatus == Status.authenticating ?
              // const CircularProgressIndicator(strokeWidth: 6,) :
              SizedBox(
                  width: MediaQuery.of(context).size.width * .7,
                  child: ElevatedButton(
                    onPressed: _doLogin,
                    child: const Text(
                      "Log In",
                    ),
                  )),
            ]),
          )),
    );
  }
}
