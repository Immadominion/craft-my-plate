import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> foodCategories = [
      "Starters",
      "Drinks",
      "Rice",
      "Curry",
      "Desserts",
      "Starters",
    ];

    List<String> foodImageCategories = [
      "asset/pngs/burito.png",
      "asset/pngs/cocktail.png",
      "asset/pngs/rice.png",
      "asset/pngs/soup.png",
      "asset/pngs/cake.png",
      "asset/pngs/fries.png",
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp),
          child: Text(
            "Top Categories",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Lex",
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        SizedBox(
          height: 100.sp,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodCategories.length,
            padding: EdgeInsets.only(left: 24.sp, right: 24.sp),
            itemBuilder: (context, index) => TopCategoriesItem(
              imagePath: foodImageCategories[index],
              text: foodCategories[index],
            ),
          ),
        )
      ],
    );
  }
}

class TopCategoriesItem extends StatelessWidget {
  final String imagePath;
  final String text;

  const TopCategoriesItem(
      {super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            width: 70.sp,
            height: 70.sp,
          ),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Lex',
              fontWeight: FontWeight.w300,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
