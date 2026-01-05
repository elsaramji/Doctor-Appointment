import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/doctor/doctor_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/Entities/allSpecialtiesEntity.dart';

class DrawSpecialties extends StatelessWidget {
  const DrawSpecialties({
    super.key,
    required this.index,
    required this.specialties,
    required this.specID,
    this.selectedSpecialtyId,
    this.onSelected,
    this.shouldNavigate = true, // Default to true for backward compatibility
  });

  final int index;
  final List<AllSpecialtiesEntity?> specialties;
  final int specID;
  final String? selectedSpecialtyId;
  final VoidCallback? onSelected;
  final bool shouldNavigate; // Controls whether to navigate or just update content

  @override
  Widget build(BuildContext context) {
    final item = specialties[index];
    final String strID = specID.toString();
    final bool isSelected = selectedSpecialtyId == strID;

    return InkWell(
      onTap: () {
        if (onSelected != null) {
          onSelected!();
        }
        
        // Navigate to results page if shouldNavigate is true
        if (shouldNavigate) {
          context.pushNamed('result', pathParameters: {'query': strID});
        }
        
        // Load specialty doctors
        context.read<DoctorsCubit>().loadSpecialityDoctors(int.parse(strID));
      },

      child: Container(
        margin: EdgeInsets.all(1.w),
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryDefault : AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.primaryDefault : AppColors.neutral500,
          ),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              item!.imgUrl, // Display emoji directly
              style: TextStyle(fontSize: 25.sp),
            ),
            SizedBox(width: 5.h),
            Text(
              item.title,
              style: RegularMontserrat.regularMontserrat16.apply(
                color: isSelected ? AppColors.white : AppColors.neutral900,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
