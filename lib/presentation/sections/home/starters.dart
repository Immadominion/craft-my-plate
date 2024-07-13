import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/home/craft_cta.dart';

class Starters extends StatelessWidget {
  const Starters({
    super.key,
    List<String>? starterText,
    List<String>? starterImageCategories,
    this.title = "Starters",
    this.subTitle = "More Starters",
  })  : starterText = starterText ??
            const [
              "Grill Chicken",
              "Mashroom Fry",
              "Veggies Fry",
              "Curry",
              "Desserts",
              "Starters"
            ],
        starterImageCategories = starterImageCategories ??
            const [
              "asset/pngs/starters/Image-1.png",
              "asset/pngs/starters/Image-2.png",
              "asset/pngs/starters/Image-1.png",
              "asset/pngs/starters/Image-2.png",
              "asset/pngs/starters/Image-1.png",
              "asset/pngs/starters/Image-2.png",
            ];

  final List<String> starterText;
  final List<String> starterImageCategories;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Lex",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Lex",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 130.sp,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: starterText.length,
              padding: EdgeInsets.only(left: 19.sp, right: 19.sp),
              itemBuilder: (context, index) => buildImageTextContainer(
                starterImageCategories[index],
                starterText[index],
                context,
                width: 120.sp,
                height: 110.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
