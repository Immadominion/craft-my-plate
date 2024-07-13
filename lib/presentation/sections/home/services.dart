import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn/presentation/widgets/home/services.dart';

class Services extends StatelessWidget {
  const Services({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Sample data for small images with text
    List<Map<String, String>> smallImagesWithText = [
      {
        "imagePath": "asset/pngs/Icon.png",
        "text": "High Quality Disposable Cutlery"
      },
      {
        "imagePath": "asset/pngs/Icon.png",
        "text": "Elegant Decorations & Table Settings"
      },
      {"imagePath": "asset/pngs/Icon.png", "text": "Served by Waitstaff"},
      {
        "imagePath": "asset/pngs/Icon.png",
        "text": "Best for Weddings, Corporate Events etc"
      },
    ];

    List<List<Map<String, String>>> myServices = [
      smallImagesWithText,
      smallImagesWithText,
      smallImagesWithText,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp),
          child: Text(
            "Services",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Lex",
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        SizedBox(
          height: 320.sp,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            padding: EdgeInsets.only(left: 14.sp, right: 14.sp),
            itemBuilder: (context, index) => services(
              context,
              mainImagePath: "asset/pngs/starters/Image-1.png",
              showBadge: index == 0 ? true : false,
              badgeText: "Recommended",
              smallImagesWithText: myServices[index],
            ),
          ),
        )
      ],
    );
  }
}
