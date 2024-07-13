import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/home/craft_cta.dart';

class StartCraftingSection extends StatelessWidget {
  const StartCraftingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Start crafting",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Lex",
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildImageTextContainer(
                'asset/pngs/craft-1.jpg',
                'Default Platters',
                context,
              ),
              buildImageTextContainer(
                'asset/jpgs/craft-2.jpg',
                'Craft Your Own',
                context,
              )
            ],
          )
        ],
      ),
    );
  }
}
