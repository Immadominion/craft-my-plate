import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget services(
  BuildContext context, {
  required String mainImagePath,
  List<Map<String, String>> smallImagesWithText = const [],
  String? badgeText,
  bool showBadge = false,
}) {
  return Container(
    width: 310.sp,
    height: 347.sp,
    margin: EdgeInsets.only(top: 10.sp, left: 10.sp, right: 10.sp),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Stack(
      children: [
        Column(
          children: [
            // Main Image
            Container(
              width: 278.sp,
              height: 120.sp,
              margin: EdgeInsets.all(16.sp),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(mainImagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 10.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Row(
                children: [
                  Container(
                    width: 20.sp,
                    height: 20.sp,
                    margin: EdgeInsets.symmetric(horizontal: 1.sp),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("asset/pngs/signature.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Signature",
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: "Lex",
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: smallImagesWithText.map((item) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Row(
                    children: [
                      Container(
                        width: 11.sp,
                        height: 12.sp,
                        margin: EdgeInsets.symmetric(horizontal: 5.sp),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(item['imagePath']!),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          item['text']!,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: "Lex",
                            fontWeight: FontWeight.w300,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 10.sp),
              child: Text(
                "Know More",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Theme.of(context).colorScheme.primary,
                  fontFamily: "Lex",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        // Badge
        if (showBadge && badgeText != null)
          Positioned(
            right: 0.sp,
            top: 0.sp,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.sp,
                vertical: 4.sp,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                ),
              ),
              child: Text(
                badgeText,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                  fontFamily: "Lex",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
      ],
    ),
  );
}
