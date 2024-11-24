import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';

class ProjectDropdown extends StatefulWidget {
  final bool isExpanded;
  final VoidCallback toggleDropdown;

  const ProjectDropdown(
      {super.key, required this.isExpanded, required this.toggleDropdown});

  @override
  ProjectDropdownState createState() => ProjectDropdownState();
}

class ProjectDropdownState extends State<ProjectDropdown> {
  final List<Map<String, dynamic>> _projects = [
    {'name': 'First Research Project', 'statusIndex': 0},
    {'name': 'Second Research Project', 'statusIndex': 1},
    {'name': 'Third Research Project', 'statusIndex': 2},
    {'name': 'Forth Research Project', 'statusIndex': 0},
  ];

  List<Map<String, dynamic>> _filteredProjects = [];
  bool showFilter = false;

  @override
  void initState() {
    super.initState();
    _filteredProjects = _projects;
  }

  void _filterProjects(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredProjects = _projects;
      } else {
        _filteredProjects = _projects
            .where((project) =>
                project['name'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void toggleFilter() {
    setState(() {
      showFilter = !showFilter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.toggleDropdown,
          child: Container(
            // margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              border: Border.all(color: AppColors.white, width: 1.w),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                   Text(
                    "Test Project with Mohsin",
                    style: TextStyle(color: Colors.black, fontSize: 16.sp),
                  ),
                  const Spacer(),
                  Icon(
                    widget.isExpanded
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (widget.isExpanded) _buildExpandedView(),
      ],
    );
  }

  Widget _buildExpandedView() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        border: Border.all(color: AppColors.white, width: 1.w),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Project List',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white),
                  ),
                ),
                SizedBox(width: 10.w),
                GestureDetector(
                  onTap: toggleFilter,
                  child: Image.asset(
                    'assets/filter.png',
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterProjects,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          showFilter ? _buildFilterUI() : Container(),
          Divider(height: 1.h, color: Colors.grey[300]),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
            child:  Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    'Research name',
                    style: TextStyle(fontSize: 14.sp, color: AppColors.white),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Status',
                    style: TextStyle(fontSize: 14.sp, color: AppColors.white),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1.h, color: Colors.grey[300]),
          _buildProjectList(),
        ],
      ),
    );
  }

  Widget _buildFilterUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deadline',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      TextField(
                        onChanged: _filterProjects,
                        decoration: InputDecoration(
                          hintText: 'Start Date',
                          suffixIcon: Image.asset(
                            'assets/calendar.png',
                            width: 10.w,
                            height: 10.h,
                            color: AppColors.primary,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 5.w),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Until',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      TextField(
                        onChanged: _filterProjects,
                        decoration: InputDecoration(
                          hintText: 'End Date',
                          suffixIcon: Image.asset(
                            'assets/calendar.png',
                            width: 15.w,
                            height: 15.h,
                            color: AppColors.primary,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // Align children to the top
            children: [
              Text(
                'Status:',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(width: 10.w), // Spacing between label and chips
              Expanded(
                child: Wrap(
                  spacing: 10, // Space between chips horizontally
                  runSpacing: 10, // Space between chips vertically if wrapped
                  children: [
                    _buildStatusChip('Completed', Colors.green),
                    _buildStatusChip('Delayed', Colors.orange),
                    _buildStatusChip('On Going', Colors.blue),
                    _buildStatusChip('On Hold', Colors.purple),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(10),
          child: Text(
            'Apply Filter',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget _buildStatusChip(String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildProjectList() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: _filteredProjects.map((project) {
          return Column(
            children: [
              ListTile(
                title: Text(
                  project['name'],
                  style:  TextStyle(
                      fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
                trailing: StatusTag(project['statusIndex']),
              ),
              Divider(height: 1.h, color: Colors.grey[300]),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class StatusTag extends StatelessWidget {
  final int index;

  const StatusTag(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> statuses = [
      {'status': 'On Going', 'color': AppColors.ongoing},
      {'status': 'Delayed', 'color': AppColors.delayed},
      {'status': 'Completed', 'color': AppColors.completed}
    ];

    final status = statuses[index];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: status['color'],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        status['status'],
        style:  TextStyle(color: Colors.white, fontSize: 12.sp),
      ),
    );
  }
}
