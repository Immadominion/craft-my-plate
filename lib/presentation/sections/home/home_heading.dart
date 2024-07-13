import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeading extends StatelessWidget {
  final String userName;
  const HomeHeading({
    super.key,
    this.userName = "User",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi ${userName.isNotEmpty ? userName : "Fren"}!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Lex",
              fontSize: 22.sp,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Current location",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Lex",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(.5),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Iconsax.location_copy,
                        size: 16.sp,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(
                        width: 2.sp,
                      ),
                      Text(
                        "Hyderabad",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Lex",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Iconsax.play_circle_copy,
                    size: 24.sp,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Text(
                    "How it works?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Lex",
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
