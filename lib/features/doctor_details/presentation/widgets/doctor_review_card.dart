import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/doctor_details/domain/entities/doctor_details_entity.dart';

class DoctorReviewCard extends StatelessWidget {
  final ReviewModelEntity review;

  const DoctorReviewCard({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = (review.imageUrl != null && review.imageUrl!.isNotEmpty)
        ? review.imageUrl!
        : 'assets/comment_image.png';

    return Container(
      margin: EdgeInsets.all(10.w),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.secondary100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                maxRadius: 30.r,
                minRadius: 30.r,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.r),
                  child: imageUrl.startsWith('http')
                      ? Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset('assets/comment_image.png', fit: BoxFit.cover);
                          },
                        )
                      : Image.asset(imageUrl, fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.userName ?? 'Anonymous',
                    style: RegularGeorgia.regularGeorgia18.copyWith(fontSize: 18.sp),
                  ),
                  Text(
                    review.createdAt ?? 'Just now',
                    style: RegularMontserrat.regularMontserrat14.copyWith(
                      color: AppColors.secondary200,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.all(5.w),
                height: 40.h,
                width: 70.w,
                decoration: BoxDecoration(
                  color: AppColors.warning50,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      SvgAssets.star2,
                      fit: BoxFit.cover,
                      height: 22.h,
                      width: 22.w,
                    ),
                    Text(
                      "${review.rating ?? 0}",
                      style: RegularMontserrat.regularMontserrat18.copyWith(
                        color: AppColors.warning400,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            review.comment ?? 'No review provided',
            style: RegularMontserrat.regularMontserrat14.copyWith(
              color: AppColors.secondary200,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }
}
