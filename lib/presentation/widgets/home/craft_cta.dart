import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildImageTextContainer(
  String imagePath,
  String text,
  BuildContext context, {
  double width = 155,
  double height = 120,
}) {
  return Container(
    width: width.sp,
    height: height.sp,
    margin: EdgeInsets.only(
      top: 10.sp,
      left: width == 155 ? 0 : 7.sp,
      right: width == 155 ? 0 : 7.sp,
      bottom: width == 155 ? 0 : 4.sp,
    ),
    decoration: BoxDecoration(
      borderRadius: width == 155
          ? BorderRadius.circular(12.r)
          : BorderRadius.circular(8.r),
      color: Theme.of(context).colorScheme.surfaceContainerLowest,
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      children: [
        Container(
          width: 155.sp,
          height: 120 * 3 / 4,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: width == 155 ? BoxFit.fitWidth : BoxFit.cover,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: width == 155 ? Alignment.center : Alignment.centerLeft,
            child: Padding(
              padding: width == 155
                  ? EdgeInsets.zero
                  : EdgeInsets.only(left: 8.0.sp),
              child: Text(
                text,
                textAlign: width == 155 ? TextAlign.center : TextAlign.left,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "Lex",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
