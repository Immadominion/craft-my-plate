import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn/data/controllers/auth_controller.dart';
import 'package:learn/presentation/sections/home/services.dart';
import 'package:learn/presentation/sections/home/starters.dart';
import 'package:learn/presentation/widgets/home/default_menu_container.dart';
import 'package:learn/presentation/sections/home/top_categories.dart';

import '../../sections/home/home_heading.dart';
import '../../sections/home/home_search.dart';
import '../../widgets/home/slider_content.dart';
import '../../sections/home/start_crafting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            return ListView(
              children: [
                Column(
                  children: [
                    HomeHeading(
                      userName: ref
                              .read(authController.notifier)
                              .currentUser
                              ?.displayName ??
                          "",
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 130.sp,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 18.sp),
                            child: const SliderContent(
                              bgImage: "asset/jpgs/slider-img-1.jpg",
                              text:
                                  "Enjoy your first order, the taste of our delicious food!",
                              containerText: 'FirstPlate01',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 18.sp),
                            child: const SliderContent(
                              bgImage: "asset/jpgs/slider-img-2.jpeg",
                              text: "Delicious food for happy life",
                              containerText: 'FirstPlate01',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SearchFood(),
                    const StartCraftingSection(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.sp),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 137.sp,
                        child: ListView.builder(
                          itemCount: 10,
                          itemExtent: 180.sp,
                          padding: EdgeInsets.only(left: 24.sp, right: 24.sp),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => DefaultMenuPlate(
                            index: index,
                          ),
                        ),
                      ),
                    ),
                    const TopCategories(),
                    const Starters(),
                    const Starters(
                      title: "Main Course",
                      subTitle: "More Main Courses",
                      starterImageCategories: [
                        "asset/pngs/starters/image-3.png",
                        "asset/pngs/starters/Image-4.png",
                        "asset/jpgs/craft-2.jpg",
                        'asset/pngs/craft-1.jpg',
                        "asset/pngs/starters/Image-1.png",
                        "asset/pngs/starters/Image-2.png",
                      ],
                      starterText: [
                        "Biryani",
                        "Bread",
                        "Plain Rice",
                        "Grill Chicken",
                        "Grill Chicken",
                        "Grill Chicken",
                      ],
                    ),
                    const Services(),
                    SvgPicture.asset(
                      "asset/svgs/description.svg",
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 132.sp,
                      color: const Color.fromRGBO(248, 248, 248, 1),
                      child: Padding(
                        padding: EdgeInsets.only(left: 24.sp, top: 24.sp),
                        child: Text(
                          "Delicious food with professional service !",
                          style: TextStyle(
                            fontFamily: "Lex",
                            fontWeight: FontWeight.w400,
                            fontSize: 25.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:learn/presentation/sections/home/services.dart';
// import 'package:learn/presentation/sections/home/starters.dart';
// import 'package:learn/presentation/widgets/home/default_menu_container.dart';
// import 'package:learn/presentation/sections/home/top_categories.dart';

// import '../../sections/home/home_heading.dart';
// import '../../sections/home/home_search.dart';
// import '../../widgets/home/slider_content.dart';
// import '../../sections/home/start_crafting.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   ScrollController _scrollController = ScrollController();
//   bool _isStartCraftingVisible = true;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_scrollListener);
//   }

//   void _scrollListener() {
//     if (_scrollController.offset > 200.sp) {
//       // Adjust the offset value as needed
//       if (_isStartCraftingVisible) {
//         setState(() {
//           _isStartCraftingVisible = false;
//         });
//       }
//     } else {
//       if (!_isStartCraftingVisible) {
//         setState(() {
//           _isStartCraftingVisible = true;
//         });
//       }
//     }
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Consumer(
//           builder: (context, ref, child) {
//             return CustomScrollView(
//               controller: _scrollController,
//               slivers: [
//                 SliverAppBar(
//                   pinned: true,
//                   floating: false,
//                   expandedHeight: 200.sp,
//                   backgroundColor:
//                       Theme.of(context).colorScheme.onInverseSurface,
//                   flexibleSpace: FlexibleSpaceBar(
//                     background: Column(
//                       children: [
//                         const HomeHeading(),
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: 130.sp,
//                           color: Theme.of(context).colorScheme.surface,
//                           child: ListView(
//                             scrollDirection: Axis.horizontal,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(left: 18.sp),
//                                 child: const SliderContent(
//                                   bgImage: "asset/jpgs/slider-img-1.jpg",
//                                   text:
//                                       "Enjoy your first order, the taste of our delicious food!",
//                                   containerText: 'FirstPlate01',
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(right: 18.sp),
//                                 child: const SliderContent(
//                                   bgImage: "asset/jpgs/slider-img-2.jpeg",
//                                   text: "Delicious food for happy life",
//                                   containerText: 'FirstPlate01',
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SliverPersistentHeader(
//                   pinned: true,
//                   delegate: _SliverAppBarDelegate(
//                     minHeight: 100.sp,
//                     maxHeight: 100.sp,
//                     child: Container(
//                         color: Theme.of(context).colorScheme.surface,
//                         child: const SearchFood()),
//                   ),
//                 ),
//                 SliverPersistentHeader(
//                   pinned: true,
//                   delegate: _SliverAppBarDelegate(
//                     minHeight: 60.sp,
//                     maxHeight: 60.sp,
//                     child: Container(
//                       color: Theme.of(context).colorScheme.surface,
//                       child: Center(
//                         child: Text(
//                           'Start Crafting Now >>',
//                           style: TextStyle(
//                             fontSize: 18.sp,
//                             fontWeight: FontWeight.bold,
//                             color: Theme.of(context).primaryColor,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SliverList(
//                   delegate: SliverChildListDelegate(
//                     [
//                       const StartCraftingSection(),
//                       Padding(
//                         padding: EdgeInsets.symmetric(vertical: 20.sp),
//                         child: SizedBox(
//                           width: MediaQuery.of(context).size.width,
//                           height: 137.sp,
//                           child: ListView.builder(
//                             itemCount: 10,
//                             itemExtent: 180.sp,
//                             padding: EdgeInsets.only(left: 24.sp, right: 24.sp),
//                             scrollDirection: Axis.horizontal,
//                             itemBuilder: (context, index) => DefaultMenuPlate(
//                               index: index,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const TopCategories(),
//                       const Starters(),
//                       const Starters(
//                         title: "Main Course",
//                         subTitle: "More Main Courses",
//                         starterImageCategories: [
//                           "asset/pngs/starters/image-3.png",
//                           "asset/pngs/starters/Image-4.png",
//                           "asset/jpgs/craft-2.jpg",
//                           'asset/pngs/craft-1.jpg',
//                           "asset/pngs/starters/Image-1.png",
//                           "asset/pngs/starters/Image-2.png",
//                         ],
//                         starterText: [
//                           "Biryani",
//                           "Bread",
//                           "Plain Rice",
//                           "Grill Chicken",
//                           "Grill Chicken",
//                           "Grill Chicken",
//                         ],
//                       ),
//                       const Services(),
//                       SvgPicture.asset(
//                         "asset/svgs/description.svg",
//                         width: MediaQuery.of(context).size.width,
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: 132.sp,
//                         color: const Color.fromRGBO(248, 248, 248, 1),
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 24.sp, top: 24.sp),
//                           child: Text(
//                             "Delicious food with professional service !",
//                             style: TextStyle(
//                               fontFamily: "Lex",
//                               fontWeight: FontWeight.w400,
//                               fontSize: 25.sp,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   final double minHeight;
//   final double maxHeight;
//   final Widget child;

//   _SliverAppBarDelegate({
//     required this.minHeight,
//     required this.maxHeight,
//     required this.child,
//   });

//   @override
//   double get minExtent => minHeight;

//   @override
//   double get maxExtent => maxHeight;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return SizedBox.expand(child: child);
//   }

//   @override
//   bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
//     return maxHeight != oldDelegate.maxHeight ||
//         minHeight != oldDelegate.minHeight ||
//         child != oldDelegate.child;
//   }
// }
