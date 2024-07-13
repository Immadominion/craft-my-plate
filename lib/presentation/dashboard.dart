import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn/data/controllers/dashboard_controller.dart';
import 'package:learn/presentation/screens/home/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  final String asset1 = 'asset/svgs/dashboard-items/dash-item-1.svg';
  final String asset2 = 'asset/svgs/dashboard-items/dash-item-2.svg';
  final String asset3 = 'asset/svgs/dashboard-items/dash-item-3.svg';
  final String asset4 = 'asset/svgs/dashboard-items/dash-item-4.svg';
  final String asset5 = 'asset/svgs/dashboard-items/dash-item-5.svg';

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final data = ref.watch(dashboardProvider.notifier);
        final selectedIndex = ref.watch(dashboardProvider).selectedIndex;

        return Stack(
          children: [
            Scaffold(
              body: _pages[selectedIndex],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedFontSize: 10.sp,
                unselectedFontSize: 10.sp,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      asset1,
                      semanticsLabel: 'Home',
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      asset2,
                      semanticsLabel: 'Wishlist',
                    ),
                    label: 'Wishlist',
                  ),
                  const BottomNavigationBarItem(
                    icon: SizedBox.shrink(),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      asset4,
                      semanticsLabel: 'Orders',
                    ),
                    label: 'Orders',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      asset5,
                      semanticsLabel: 'Profile',
                    ),
                    label: 'Profile',
                  ),
                ],
                currentIndex: selectedIndex,
                selectedItemColor: Colors.deepPurple,
                onTap: (index) {
                  data.setActiveTab(index);
                },
              ),
            ),
            Positioned(
              bottom: 50.h,
              left: 0,
              right: 0,
              child: Center(
                child: SvgPicture.asset(
                  asset3,
                  width: 70.sp,
                  height: 70.sp,
                  semanticsLabel: 'CMP Logo',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
