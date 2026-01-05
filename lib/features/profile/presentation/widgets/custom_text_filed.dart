import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final String? icon;
  final TextEditingController controller;
  final bool isObscure;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.label,
    required this.controller,
    required this.keyboardType,
    this.icon,
    this.isObscure = false,
    this.validator,
    this.inputFormatters,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode focusNode;
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() => setState(() {}));
    isObscure = widget.isObscure;
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isActive = focusNode.hasFocus || widget.controller.text.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      child: TextFormField(
        controller: widget.controller,
        obscureText: isObscure,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,   // ✅ now used!
        focusNode: focusNode,
        validator: widget.validator,
        style: TextStyle(fontSize: 14.sp, color: AppColors.secondary500),

        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(
            fontSize: 14.sp,
            color: isActive ? AppColors.primaryDefault : AppColors.secondary200,
          ),
          filled: true,
          fillColor: AppColors.primary50,
          hintText: widget.hint,
          hintStyle: TextStyle(color: AppColors.secondary200, fontSize: 14.sp),

          prefixIcon: widget.icon != null
              ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: SvgPicture.asset(
              widget.icon!,
              color: isActive
                  ? AppColors.primaryDefault
                  : AppColors.secondary200,
              width: 20.w,
              height: 20.h,
            ),
          )
              : null,

          suffixIcon: widget.isObscure
              ? IconButton(
            icon: Icon(
              isObscure ? Icons.visibility_off : Icons.visibility,
              color: AppColors.secondary500,
              size: 22.sp,
            ),
            onPressed: () {
              setState(() => isObscure = !isObscure);
            },
          )
              : null,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
              color: AppColors.primaryDefault,
              width: 2.w,
            ),
          ),
        ),
      ),
    );
  }
}
