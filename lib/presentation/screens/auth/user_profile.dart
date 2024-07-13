import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn/data/controllers/auth_controller.dart';
import 'package:learn/presentation/dashboard.dart';

import '../../widgets/text_field.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late TextEditingController name;
  late TextEditingController email;

  @override
  void initState() {
    name = TextEditingController();
    email = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: Consumer(builder: (context, ref, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 24.sp,
                      horizontal: 24.sp,
                    ),
                    child: Text(
                      "Just a step away !",
                      style: TextStyle(
                        fontFamily: "Lex",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  CustomTextField(
                    hintText: "Full Name*",
                    controller: name,
                  ),
                  CustomTextField(
                    hintText: "Email ID*",
                    controller: email,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 18.sp),
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
                  onPressed: () {
                    //Here I want to update the name
                    ref
                        .read(authController.notifier)
                        .updateDisplayName(name.text)
                        .then(
                      (value) {
                        if (value) {
                          log("The name has been updated.");
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        }
                      },
                    );
                  },
                  child: const Text(
                    'Let\'s Start',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Lex",
                    ),
                  ),
                ),
              ),
            ],
          );
        }));
  }
}
