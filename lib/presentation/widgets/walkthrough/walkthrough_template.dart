import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget walkthroughTemplate(
    {required String image, required String title, required String subtitle}) {
  return Padding(
    padding: const EdgeInsets.all(24.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: SvgPicture.asset(
            image,
            height: 200,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w400,
              fontFamily: "Lex",
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey,
              fontWeight: FontWeight.w300,
              fontFamily: "Lex",
            ),
          ),
        ),
      ],
    ),
  );
}
