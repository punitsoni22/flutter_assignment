import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildCounts extends StatefulWidget {
  const BuildCounts({super.key});

  @override
  State<BuildCounts> createState() => _BuildCountsState();
}

class _BuildCountsState extends State<BuildCounts> {
  final List<Map<String, dynamic>> countItems = [
    {
      'count': '1125',
      'title': 'User Involved',
      'image': 'assets/user.png',
    },
    {
      'count': '450',
      'title': 'Equipment Available',
      'image': 'assets/equipment.png',
    },
    {
      'count': '320',
      'title': 'Tasks Completed',
      'image': 'assets/user.png',
    },
    {
      'count': '75',
      'title': 'Equipment Available',
      'image': 'assets/equipment.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      margin: EdgeInsets.only(top: 10.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: countItems.map((item) {
            return Container(
              width: 150.w,
              margin: EdgeInsets.only(right: 15.w),
              padding: EdgeInsets.all(15.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Wrap Row's content with Flexible to prevent overflow
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          item['image'],
                          width: 40.w,
                          height: 40.h,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 15.w),
                        Container(
                          width: 1.w,
                          height: 40.h,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 15.w),
                        // Wrap Text with Flexible
                        Flexible(
                          child: Text(
                            item['count'],
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    // Wrap Text with Flexible
                    Flexible(
                      child: Text(
                        item['title'],
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
