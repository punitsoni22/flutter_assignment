import 'package:flutter/material.dart';
import 'package:flutter_assignment/pages/home/widget/build_counts.dart';
import 'package:flutter_assignment/pages/home/widget/slider_drawer.dart';
import 'package:flutter_assignment/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home/widget/project_dropdown.dart';
import 'home/widget/project_update_section.dart';
import 'home/widget/tasks_quick_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _drawerAnimation;

  // Added state variable for ProjectDropdown expansion
  bool _isProjectDropdownExpanded = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _drawerAnimation = Tween(
      begin: const Offset(-1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void openDrawer() {
    _animationController.forward();
  }

  void closeDrawer() {
    _animationController.reverse();
  }

  bool get isDrawerOpen {
    return _animationController.status == AnimationStatus.completed ||
        _animationController.status == AnimationStatus.forward;
  }

  void toggleProjectDropdown() {
    setState(() {
      _isProjectDropdownExpanded = !_isProjectDropdownExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: GestureDetector(
        onTap: () {
          if (isDrawerOpen) {
            closeDrawer();
          }
        },
        child: Stack(
          children: [
            // Home Content
            _buildActualContent(),

            // The overlay that dims the background when the drawer is open
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return _animationController.value > 0
                    ? GestureDetector(
                        onTap: closeDrawer,
                        child: Container(
                          color: Colors.black
                              .withOpacity(0.3 * _animationController.value),
                        ),
                      )
                    : const SizedBox.shrink();
              },
            ),

            // Drawer with SlideTransition Animation
            SlideTransition(
              position: _drawerAnimation,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(3.0, 0.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: const SliderDrawer(),
              ),
            ),

            // Overlay when ProjectDropdown is expanded
            if (_isProjectDropdownExpanded)
              GestureDetector(
                onTap: toggleProjectDropdown,
                child: Container(
                  color: Colors.black54, // Dimmed background
                  child: SingleChildScrollView(
                    // Added SingleChildScrollView
                    child: Column(
                      children: [
                        // Include the header and expanded ProjectDropdown
                        Container(
                          color: AppColors.primary,
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                          ),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (!isDrawerOpen) {
                                          openDrawer();
                                        } else {
                                          closeDrawer();
                                        }
                                      },
                                      child: Image.asset(
                                        'assets/menu.png',
                                        width: 20.w,
                                        height: 20.h,
                                      ),
                                    ),
                                    const Spacer(),
                                    Image.asset(
                                      'assets/pfp.png',
                                      width: 40.w,
                                      height: 40.h,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                ProjectDropdown(
                                  isExpanded: true,
                                  toggleDropdown: toggleProjectDropdown,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Add more widgets if needed
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 15.sp,
        unselectedFontSize: 10.sp,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home.png',
              width: 24.w,
              height: 24.h,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/action.png',
              width: 24.w,
              height: 24.h,
            ),
            label: 'Recent Discussion',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/discussion.png',
              width: 24.w,
              height: 24.h,
            ),
            label: 'Need Help',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/help.png',
              width: 24.w,
              height: 24.h,
            ),
            label: 'Need Help',
          ),
        ],
      ),
    );
  }

  Widget _buildActualContent() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        // Shift the content to the right when the drawer is open
        double slide = 250.0 * _animationController.value;
        return Transform.translate(
          offset: Offset(slide, 0),
          child: child,
        );
      },
      child: SingleChildScrollView(
        // Added SingleChildScrollView here
        child: Column(
          children: [
            Container(
              color: AppColors.primary,
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (!isDrawerOpen) {
                              openDrawer();
                            } else {
                              closeDrawer();
                            }
                          },
                          child: Image.asset(
                            'assets/menu.png',
                            width: 20.w,
                            height: 20.h,
                          ),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/pfp.png',
                          width: 40.w,
                          height: 40.h,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    ProjectDropdown(
                      isExpanded: false,
                      toggleDropdown: toggleProjectDropdown,
                    ),
                    SizedBox(height: 10.h),
                    const BuildCounts(),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProjectUpdateSection(),
                SizedBox(height: 10.h),
                const TasksQuickView(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
