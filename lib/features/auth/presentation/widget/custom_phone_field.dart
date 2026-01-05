import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';

class CustomPhoneField extends StatefulWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const CustomPhoneField({super.key, required this.controller, this.validator});

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  String selectedCountryCode = "+20";
  String selectedFlag = IconsAssets.all['EG']!;

  final List<Map<String, String>> countries = [
    {'name': 'Egypt', 'code': '+20', 'flag': IconsAssets.all['EG']!},
    {'name': 'India', 'code': '+91', 'flag': IconsAssets.all['IN']!},
    {'name': 'Italy', 'code': '+39', 'flag': IconsAssets.all['IT']!},
    {'name': 'Japan', 'code': '+81', 'flag': IconsAssets.all['JP']!},
    {'name': 'Spain', 'code': '+34', 'flag': IconsAssets.all['ES']!},
  ];

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Phone number is required";
        }
        final regex = RegExp(r'^\d{6,15}$');
        if (!regex.hasMatch(value)) {
          return "Enter a valid phone number";
        }
        return widget.validator?.call(value);
      },
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.neutral50,
        hintText: "Enter your number",
        hintStyle: MediumMontserrat.mediumMontserrat14.copyWith(
          color: AppColors.secondary200,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: AppColors.secondary100),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: AppColors.secondary100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: AppColors.primaryDefault),
        ),
        prefixIcon: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedCountryCode,
            items: countries.map((country) {
              return DropdownMenuItem<String>(
                value: country['code'],
                child: Row(
                  children: [
                    SizedBox(width: 8.w),
                    Image.asset(
                      country['flag']!,
                      width: 22.w,
                      height: 22.h,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "${country['name']} (${country['code']})",
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ],
                ),
              );
            }).toList(),
            onChanged: (value) {
              final selected = countries.firstWhere((c) => c['code'] == value);
              setState(() {
                selectedCountryCode = selected['code']!;
                selectedFlag = selected['flag']!;
              });
            },
          ),
        ),
        prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
      ),
    );
  }
}
