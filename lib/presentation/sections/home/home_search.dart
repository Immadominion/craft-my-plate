import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class SearchFood extends StatelessWidget {
  const SearchFood({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 24.sp, vertical: 24.sp),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search food or events',
            suffixIcon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.primary,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(16.0),
            hintStyle: TextStyle(
                fontFamily: "Lex",
                fontWeight: FontWeight.w300,
                fontSize: 14.sp),
          ),
        ),
      ),
    );
  }
}
