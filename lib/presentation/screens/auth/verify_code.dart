// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn/presentation/screens/auth/user_profile.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn/data/controllers/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyCode extends StatefulWidget {
  final String phoneNumber;
  String verificationId; // Make verificationId non-final

  VerifyCode({
    super.key,
    required this.phoneNumber,
    required this.verificationId,
  });

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  String verificationCode = '';

  void _resendCode() {
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        log('Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) async {
        setState(() {
          widget.verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> _saveLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(
            "OTP Verification",
            style: TextStyle(
              fontFamily: "Lex",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(120, 120, 120, 1),
            ),
          ),
        ),
        body: Consumer(builder: (context, ref, child) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.sp),
                child: Column(
                  children: [
                    Text(
                      "We have sent a verification code to",
                      style: TextStyle(
                        fontFamily: "Lex",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(84, 84, 84, 1),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          formatPhoneNumber(widget.phoneNumber),
                          style: TextStyle(
                            fontFamily: "Lex",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(1, 15, 7, 1),
                          ),
                        ),
                        Image.asset(
                          "asset/pngs/verification.png",
                          width: 22.sp,
                          height: 22.sp,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 44.sp),
                child: OtpTextField(
                  numberOfFields: 6, // Adjust this based on the OTP length
                  borderColor: Theme.of(context).colorScheme.primary,
                  showFieldAsBox: false,
                  fieldWidth: 50.sp,
                  onCodeChanged: (String code) {
                    // handle validation or checks here
                  },
                  onSubmit: (String code) {
                    setState(() {
                      verificationCode = code;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.sp),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    maximumSize: Size(327.sp, 44.sp),
                    minimumSize: Size(327.sp, 44.sp),
                    padding: EdgeInsets.symmetric(horizontal: 24.sp),
                    backgroundColor: const Color.fromRGBO(99, 24, 175, 1),
                    textStyle: TextStyle(
                      fontFamily: "Lex",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                  ),
                  onPressed: () async {
                    ref.read(authController.notifier).verificationId =
                        widget.verificationId;
                    await ref.read(authController.notifier).verifyCode(
                      verificationCode,
                      context,
                      () async {
                        //Save state as logged in here
                        //Use shared preferences to save the user as logged in.
                        await _saveLoginState();

                        //Navigate to tell us more about yourself
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserProfile(),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Lex",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.sp),
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: "Didn't receive the code? ",
                    style: TextStyle(
                      fontFamily: "Lex",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: "Resend Again",
                        style: TextStyle(
                          fontFamily: "Lex",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await ref
                                .read(authController.notifier)
                                .resendCode(widget.phoneNumber);
                          },
                      ),
                    ],
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          );
        }));
  }
}

String formatPhoneNumber(String phoneNumber) {
  phoneNumber = phoneNumber.substring(1);
  String countryCode = phoneNumber.substring(0, 2);
  String maskedNumber = "$countryCode-XXXXXX${phoneNumber.substring(8)}";
  return "+$maskedNumber";
}
