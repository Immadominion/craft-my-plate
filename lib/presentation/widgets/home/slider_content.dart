import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/home/dotted_border.dart';

class SliderContent extends StatelessWidget {
  final String bgImage;
  final String text;
  final String containerText;

  const SliderContent({
    super.key,
    required this.bgImage,
    required this.text,
    required this.containerText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 7.sp),
        margin: EdgeInsets.symmetric(horizontal: 5.sp),
        height: 130.sp,
        width: 330.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.sp),
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage(
              bgImage,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 12.sp),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 165.sp,
                height: 120.sp,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Text(
                        text,
                        softWrap: true,
                        textAlign: TextAlign.left,
                        maxLines: 3,
                        style: TextStyle(
                          fontFamily: "Lex",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onInverseSurface,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: DottedBorderContainer(
                          text: containerText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
