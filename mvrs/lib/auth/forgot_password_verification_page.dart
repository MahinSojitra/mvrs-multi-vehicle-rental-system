import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvrs/auth/validators/auth_input_validation_mixin.dart';

class ForgotPasswordVerificationPage extends StatefulWidget {
  const ForgotPasswordVerificationPage({super.key});

  @override
  State<ForgotPasswordVerificationPage> createState() =>
      _ForgotPasswordVerificationPageState();
}

class _ForgotPasswordVerificationPageState
    extends State<ForgotPasswordVerificationPage>
    with AuthInputValidationMixin {
  final _forgotPasswordVerificationFormGlobalKey = GlobalKey<FormState>();
  final TextEditingController _otpCodeController = TextEditingController();

  bool _isOtpCodeValid = true;

  @override
  void dispose() {
    _otpCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            elevation: 7,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(
                color: Colors.purple,
                width: 3.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 0,
                left: 30.0,
                right: 30.0,
                bottom: 30.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Placeholder for the image
                    Container(
                      child: SvgPicture.asset(
                        'assets/svg-images/otp-verification-banner.svg',
                        width: 800,
                        height: 300,
                      ),
                    ),
                    Text(
                      "Verify it's you",
                      style: TextStyle(
                        fontSize: 45,
                        fontFamily: "Cookie",
                      ),
                    ),
                    Text(
                      "We’ll text you a code on your email to verify it's actually you trying to reset your password.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Resend code if not received.",
                        style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Form(
                      key: _forgotPasswordVerificationFormGlobalKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            controller: _otpCodeController,
                            maxLength: 6,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'OTP Code',
                              labelStyle: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey[800]!),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              suffixIcon: _isOtpCodeValid
                                  ? null
                                  : Icon(Icons.error_outline_outlined),
                            ),
                            validator: (otpCode) {
                              String? message =
                                  AuthInputValidationMixin.isOtpCodeValid(
                                      otpCode);
                              if (message == null) {
                                setState(() {
                                  _isOtpCodeValid = true;
                                });
                                return null;
                              } else {
                                setState(() {
                                  _isOtpCodeValid = false;
                                });
                                return message;
                              }
                            },
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              // Handle sign in
                              if (_forgotPasswordVerificationFormGlobalKey
                                  .currentState!
                                  .validate()) {
                                Navigator.pushReplacementNamed(
                                    context, "/reset-password");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shadowColor: Colors.blue,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.blueAccent, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 15),
                              textStyle: TextStyle(fontSize: 18),
                            ),
                            child: Text('Verify'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
