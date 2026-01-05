import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BirthdayPicker extends StatelessWidget {
  const BirthdayPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select your birthday', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
        SizedBox(height: 12.h),
        Row(
          children: [
            _buildDropdown(hint: '29', items: List.generate(31, (i) => (i + 1).toString())),
            SizedBox(width: 12.w),
            _buildDropdown(hint: 'July', items: [
              'January', 'February', 'March', 'April', 'May', 'June',
              'July', 'August', 'September', 'October', 'November', 'December'
            ]),
            SizedBox(width: 12.w),
            _buildDropdown(hint: '2024', items: List.generate(100, (i) => (2024 - i).toString())),
          ],
        ),
      ],
    );
  }

  Widget _buildDropdown({required String hint, required List<String> items}) {
    return Expanded(
      child: DropdownButtonFormField<String>(
        initialValue: null,
        hint: Text(hint, style: TextStyle(fontSize: 14.sp)),
        items: items.map((e) => DropdownMenuItem(value: e, child: Text(e, style: TextStyle(fontSize: 14.sp)))).toList(),
        onChanged: (_) {},
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        ),
      ),
    );
  }
}