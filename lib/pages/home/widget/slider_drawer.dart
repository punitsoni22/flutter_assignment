import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderDrawer extends StatelessWidget {
  const SliderDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      width: 0.8.sw,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: AppColors.black,
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/pfp.png'),
                  radius: 30,
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mohsin Faraz',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Senior Research Associate',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildExpansionTile(
                  title: 'Research',
                  icon:
                      Image.asset("assets/research.png", width: 30.w, height: 30.h),
                  child: true,
                ),
                _buildExpansionTile(
                  title: 'Team',
                  icon: Image.asset("assets/team.png", width: 30.w, height: 30.h),
                  child: true,
                ),
                _buildExpansionTile(
                  title: 'Laboratory',
                  icon: Image.asset("assets/laboratory.png",
                      width: 30, height: 30),
                  child: true,
                ),
                _buildExpansionTile(
                  title: 'Task',
                  icon: Image.asset("assets/task.png", width: 30.w, height: 30.h),
                  child: true,
                ),
                _buildExpansionTile(
                  title: 'Data',
                  icon: Image.asset("assets/data.png", width: 30.w, height: 30.h),
                  child: true,
                ),
                _buildExpansionTile(
                  title: 'Discussion',
                  icon: Image.asset("assets/discussion1.png",
                      width: 30.w, height: 30.h),
                  child: true,
                ),
                _buildExpansionTile(
                  title: 'Publish',
                  icon:
                      Image.asset("assets/publish.png", width: 30.w, height: 30.h),
                  child: true,
                ),
                _buildExpansionTile(
                  title: 'Expense',
                  icon:
                      Image.asset("assets/expense.png", width: 30.w, height: 30.h),
                  child: false,
                ),
                _buildExpansionTile(
                  title: 'Setting',
                  icon:
                      Image.asset("assets/setting.png", width: 30.w, height: 30.h),
                  child: false,
                ),
                _buildExpansionTile(
                  title: 'Ticketing',
                  icon: Image.asset("assets/ticketing.png",
                      width: 30.w, height: 30.h),
                  child: false,
                ),
              ],
            ),
          ),
          const Divider(color: Colors.grey),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.white),
            title: const Text('Sign Out', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildExpansionTile({
    required String title,
    required Widget icon,
    required bool child,
  }) {
    return Theme(
      data: ThemeData(
        dividerColor: Colors.transparent,
      ),
      child: child
          ? ExpansionTile(
              leading: icon,
              title: Text(title, style: const TextStyle(color: Colors.white)),
              iconColor: Colors.white,
              collapsedIconColor: Colors.white,
              children: [
                _buildDrawerItem('New Project',
                    Image.asset("assets/rocket.png", width: 30.w, height: 30.h)),
                _buildDrawerItem('My Projects',
                    Image.asset("assets/rocket1.png", width: 30.w, height: 30.h)),
              ],
            )
          : ListTile(
              leading: icon,
              title: Text(title, style: const TextStyle(color: Colors.white)),
            ),
    );
  }

  Widget _buildDrawerItem(
    String title,
    Widget icon,
  ) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: ListTile(
        leading: icon,
        title: Text(title, style: const TextStyle(color: AppColors.black)),
        onTap: () {
        },
      ),
    );
  }
}
