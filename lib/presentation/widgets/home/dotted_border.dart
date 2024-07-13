import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DottedBorderContainer extends StatelessWidget {
  final String text;

  const DottedBorderContainer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 138.w,
      height: 33.h,
      alignment: Alignment.center,
      decoration: DottedDecoration(
        shape: Shape.box,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13.sp,
          fontFamily: "Lex",
          fontWeight: FontWeight.w400,
          color: const Color.fromRGBO(247, 229, 193, 1),
        ),
      ),
    );
  }
}
