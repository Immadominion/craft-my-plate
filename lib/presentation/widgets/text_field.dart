import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;

  const CustomTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 326.sp,
      height: 40.sp,
      margin: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 24.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.sp),
        border: Border.all(
          color: const Color.fromRGBO(201, 197, 201, 1),
          width: 1.sp,
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color.fromRGBO(201, 197, 201, 1),
            fontFamily: "Lex",
          ),
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 10.sp, vertical: 8.sp),
        ),
        style: const TextStyle(
          fontFamily: "Lex",
        ),
      ),
    );
  }
}
