import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TasksQuickView extends StatefulWidget {
  const TasksQuickView({super.key});

  @override
  TasksQuickViewState createState() => TasksQuickViewState();
}

class TasksQuickViewState extends State<TasksQuickView> {
  bool _isExpanded = true;

  // Sample list of tasks with dummy data
  final List<Map<String, dynamic>> _tasks = List.generate(
    5,
        (index) => {
      'team': 'Design Team',
      'creator': 'Mohsin Far...',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.lightBackground,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with expand/collapse functionality
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
                    "Tasks Quick View",
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
          // Animated content
          AnimatedCrossFade(
            firstChild: Container(),
            secondChild: _buildTaskTable(),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskTable() {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Column(
        children: [
          // Header row
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Team name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Creator',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Assigned to',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
          // Task rows
          ..._tasks.map((task) => _buildTaskRow(task)),
        ],
      ),
    );
  }

  Widget _buildTaskRow(Map<String, dynamic> task) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Row(
        children: [
          // First column
          Expanded(
            flex: 2,
            child: Text(
              task['team'],
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
          // Second column
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Image.asset("assets/mohsin_pfp.png", width: 30.w, height: 35.h),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    task['creator'],
                    style: TextStyle(fontSize: 14.sp),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          // Third column
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                "assets/group_pfp.png",
                width: 50.w, // Reduced width
                height: 35.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
