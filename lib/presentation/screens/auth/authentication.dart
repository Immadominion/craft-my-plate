import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:learn/presentation/screens/auth/verify_code.dart';

import '../../../data/controllers/auth_controller.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          return Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SvgPicture.asset(
                      "asset/svgs/Component-1.svg",
                      width: MediaQuery.of(context).size.width,
                    ),
                    SizedBox(
                      height: 47.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 24.sp, bottom: 24.sp),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Login or Signup",
                          style: TextStyle(
                            fontFamily: "Lex",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(120, 120, 120, 1),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 327.sp,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.sp,
                          color: const Color.fromRGBO(215, 215, 215, 1),
                        ),
                        borderRadius: BorderRadius.circular(6.sp),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24.sp),
                      child: InternationalPhoneNumberInput(
                        inputDecoration: InputDecoration.collapsed(
                          hintText: "Enter Phone Number",
                          hintStyle: TextStyle(
                            fontFamily: "Lex",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onInputChanged: (PhoneNumber number) {
                          debugPrint("Number is ${number.phoneNumber}");
                          ref.read(authController.notifier).phone =
                              number.phoneNumber ?? "";
                        },
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.DIALOG,
                          useBottomSheetSafeArea: true,
                        ),
                        ignoreBlank: false,
                        selectorTextStyle: const TextStyle(color: Colors.black),
                        initialValue: number,
                        textFieldController: controller,
                        formatInput: true,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        inputBorder: const OutlineInputBorder(),
                        onSaved: (PhoneNumber number) {
                          debugPrint('On Saved: $number');
                          ref.read(authController.notifier).phone =
                              number.phoneNumber ?? "";
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    ElevatedButton(
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
                        ref.read(authController.notifier).verifyPhoneNumber(
                              ref.read(authController.notifier).phone,
                              context,
                              _navigateToVerifyCode,
                            );
                      },
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Lex",
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 24.sp),
                  child: SizedBox(
                    width: 250.sp,
                    height: 40.sp,
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: "By continuing, you agree to our \n",
                        style: TextStyle(
                          fontFamily: "Lex",
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(120, 120, 120, 1),
                        ),
                        children: [
                          TextSpan(
                            text: "Terms of Service Privacy Policy",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily: "Lex",
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      maxLines: 2,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void _navigateToVerifyCode(String verificationId, String phone) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => VerifyCode(
          phoneNumber: phone,
          verificationId: verificationId,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
