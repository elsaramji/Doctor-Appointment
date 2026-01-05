import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:round_7_mobile_cure_team4/core/helper/api_constants.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/favorite/favorite_cubit.dart';

class DoctorCard extends StatefulWidget {
  final int doctorId;
  final String name;
  final String specialty;
  final String address;
  final String imageUrl;
  final VoidCallback? onFavoriteTap;
  final bool isFavorite;

  const DoctorCard({
    super.key,
    required this.doctorId,
    required this.name,
    required this.specialty,
    required this.address,
    required this.imageUrl,
    this.onFavoriteTap,
    this.isFavorite = false,
  });

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 60.r,
              backgroundColor: AppColors.secondary100,
              child: ClipOval(
                child: Image.network(
                  "${ApiConstant.baseUrl}${widget.imageUrl}",
                  fit: BoxFit.cover,
                  width: 120.w,
                  height: 120.w,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: SizedBox(
                        width: 30.w,
                        height: 30.w,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: AppColors.primary500,
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/doctor_fake.png',
                      fit: BoxFit.cover,
                      width: 120.w,
                      height: 120.w,
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 8.h,
              right: 0.w,
              child: CircleAvatar(
                radius: 13.r,
                backgroundColor: AppColors.secondary100.withOpacity(0.6),
                child: SvgPicture.asset(
                  SvgAssets.checkMark,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.name, style: RegularGeorgia.regularGeorgia18),
              SizedBox(height: 4.h),
              Text(
                widget.specialty,
                style: RegularMontserrat.regularMontserrat14.copyWith(
                  color: AppColors.secondary200,
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  SvgPicture.asset(SvgAssets.location, height: 16.h),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: Text(
                      widget.address,
                      style: RegularMontserrat.regularMontserrat14.copyWith(
                        color: AppColors.secondary200,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: () {
            setState(() {
              isFavorite = !isFavorite;
            });
            if (widget.onFavoriteTap != null) widget.onFavoriteTap!();
            context.read<FavoriteCubit>().makeFavorite(widget.doctorId);
          },
          child: Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(
                color: AppColors.secondary100.withOpacity(0.3),
              ),
            ),
            child: Center(
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? AppColors.error500 : AppColors.black,
                size: 25.r,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
