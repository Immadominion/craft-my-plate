import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultMenuPlate extends StatelessWidget {
  final int index;
  const DefaultMenuPlate({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 15.sp,
            ),
            Container(
              width: 155.sp,
              height: 149.sp,
              padding: EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 5.sp,
              ),
              margin: EdgeInsets.symmetric(vertical: 5.sp),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Default Menu ${index + 1}',
                    style: TextStyle(
                      fontFamily: 'Lex',
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 40.sp,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '3 Starters',
                            style: TextStyle(
                              fontFamily: "Lex",
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            '3 maincourse',
                            style: TextStyle(
                              fontFamily: "Lex",
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            '3 desserts',
                            style: TextStyle(
                              fontFamily: "Lex",
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            '3 drinks',
                            style: TextStyle(
                              fontFamily: "Lex",
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 1.sp),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(.5),
                        size: 13.sp,
                      ),
                      Text(
                        'Min 800',
                        style: TextStyle(
                          fontFamily: "Lex",
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(.5),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Starts at ₹${index == 0 ? 777 : index + 777}',
                    style: TextStyle(
                      fontFamily: "Lex",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          right: 110.sp,
          top: 18.sp,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Image.asset(
              'asset/pngs/plate.png',
              width: 100.sp,
              height: 75.sp,
            ),
          ),
        ),
      ],
    );
  }
}
