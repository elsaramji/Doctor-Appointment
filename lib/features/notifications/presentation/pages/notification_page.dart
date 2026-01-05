import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/routes/app_router.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});

  final List<Map<String, dynamic>> notifications = [
    {
      "title": "Upcoming Appointment",
      "description": "Reminder: You have an appointment with...",
      "time": "1h",
      "isRead": true,
      "image": PngAssets.frame,
    },
    {
      "title": "Appointment completed",
      "description":
          "You have successfully booked your appointment with Dr. Emily Walker.",
      "time": "3h",
      "isRead": false,
      "image": PngAssets.solarCheck,
    },
    {
      "title": "Appointment Cancelled",
      "description":
          "You have successfully cancelled your appointment with Dr. David Patel.",
      "time": "4h",
      "isRead": true,
      "image": PngAssets.calendarRemove,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.neutral900),
          onPressed: () => context.go(AppRoutes.home),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              child: Text(
                "Today",
                style: MediumMontserrat.mediumMontserrat20.copyWith(
                  color: AppColors.primary400,
                ),
              ),
            ),

            ...notifications.map((item) => _buildNotificationItem(item)),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem(Map<String, dynamic> item) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: item["isRead"] ? AppColors.white : AppColors.primary50,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(),
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                item["image"] as String,
                width: 50.w,
                height: 50.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 8.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item["title"] as String,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      item["time"] as String,
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  item["description"] as String,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
