import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';

import '../../../../core/themes/colors.dart';
import 'custom_text_filed.dart';

class PhoneNumberField extends StatefulWidget {
  final TextEditingController controller;

  const PhoneNumberField({super.key, required this.controller});

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  String selectedCountry = 'EG';
  String selectedCode = '+20';

  final Map<String, String> countryCodes = {
    'EG': '+20',
    'US': '+1',
    'UK': '+44',
    'IN': '+91',
    'IT': '+39',
    'JP': '+81',
    'ES': '+34',
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 0,
          child: Container(
            height: 30.h,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              color: AppColors.neutral50,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.neutral200),
            ),
            child: DropdownButton<String>(
              value: selectedCountry,
              underline: const SizedBox(),
              isDense: true,
              icon: Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.neutral800,
                  size: 16.sp,
                ),
              ),
              items:  IconsAssets.all.keys.map((country) {
                return DropdownMenuItem(
                  value: country,
                  child: Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          IconsAssets.all[country]!,
                          width: 20.w,
                          height: 14.h,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          countryCodes[country]!,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.secondary500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCountry = value!;
                  selectedCode = countryCodes[value]!;
                });
              },
            ),
          ),
        ),
        SizedBox(width: 8.w),

        Expanded(
          child: CustomTextField(
            keyboardType: TextInputType.phone,
            label: 'Phone Number',
            hint: '01*********',
            icon: '',
            controller: widget.controller,
            validator: (value) =>
                value!.length < 10 ? 'Enter a valid phone number' : null,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
      ],
    );
  }
}
