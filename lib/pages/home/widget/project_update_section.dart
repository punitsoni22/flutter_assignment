import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class ProjectUpdateSection extends StatefulWidget {
  const ProjectUpdateSection({super.key});

  @override
  ProjectUpdateSectionState createState() => ProjectUpdateSectionState();
}

class ProjectUpdateSectionState extends State<ProjectUpdateSection> {
  bool _isExpanded = true;

  // Sample list of updates
  final List<Map<String, String>> _updates = [
    {
      'message':
      'Your Cheetah Noman Raza 115 / LHR has now picked up your order and is speeding your way. You can reach him 03000090909. To ensure your health and safety, we have tested Noman Raza 115 /LHR’s temperature in the morning and it was 98 degrees Fahrenheit.',
      'date': 'Mon, 20 Nov 2024',
    },
    {
      'message':
      'Your delivery executive Ali Khan has picked up your order and is en route to your location. You can reach him at 03211234567. His temperature today was 97.8 degrees Fahrenheit.',
      'date': 'Tue, 21 Nov 2024',
    },
    {
      'message':
      'Your order has been successfully delivered. We hope you enjoy your purchase! If you have any feedback, please call us at 0800-999-999.',
      'date': 'Wed, 22 Nov 2024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.lightBackground,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Project Update",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                  Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                  ),
                ],
              ),
            ),
          ),
          // AnimatedCrossFade to handle the expand/collapse animation
          AnimatedCrossFade(
            firstChild: Container(),
            secondChild: _buildUpdateList(),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
            alignment: Alignment.topCenter,
          ),
        ],
      ),
    );
  }

  // Method to build the list of updates
  Widget _buildUpdateList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: _updates.map((update) {
          return UpdateItemWidget(
            message: update['message']!,
            date: update['date']!,
          );
        }).toList(),
      ),
    );
  }
}

class UpdateItemWidget extends StatefulWidget {
  final String message;
  final String date;

  const UpdateItemWidget({super.key, required this.message, required this.date});

  @override
  UpdateItemWidgetState createState() => UpdateItemWidgetState();
}

class UpdateItemWidgetState extends State<UpdateItemWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: AnimatedCrossFade(
        firstChild: _buildCollapsed(),
        secondChild: _buildExpanded(),
        crossFadeState:
            _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.topCenter,
      ),
    );
  }

  Widget _buildCollapsed() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        widget.message,
        style: TextStyle(color: Colors.black87, fontSize: 14.sp),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildExpanded() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.message,
              style: TextStyle(color: Colors.black87, fontSize: 14.sp),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              color: AppColors.primary,
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/calendar.png', // Replace with your image path
                  width: 20.w,
                  height: 20.h,
                  color: Colors.white,
                ),
                SizedBox(width: 10.w),
                Text(
                  widget.date,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
