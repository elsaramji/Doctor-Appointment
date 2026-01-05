import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/routes/app_router.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/favorite/favorite_cubit.dart';

class CustomDoctorCard extends StatefulWidget {
  final int docId;
  final String name;
  final String specialty;
  final String address;
  final double rating;
  final bool isFav;
  final String? startDate;
  final String? endDate;
  final String imagePath;

  const CustomDoctorCard({
    super.key,
    required this.docId,
    required this.name,
    required this.specialty,
    required this.address,
    required this.rating,
    required this.isFav,
    required this.startDate,
    required this.endDate,
    required this.imagePath,
  });

  @override
  State<CustomDoctorCard> createState() => _CustomDoctorCardState();
}

class _CustomDoctorCardState extends State<CustomDoctorCard> {
  bool isFav = false;
  @override
  void initState() {
    super.initState();
    isFav = widget.isFav;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('${AppRoutes.doctorDetails}?docID=${widget.docId}');
      },
      child: Container(
        padding: EdgeInsets.all(5.w),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColors.secondary100),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 5.r,
              offset: Offset(0, 3.h),
            ),
          ],
        ),
        child: Row(
          children: [
            //NOTE - Doctor Image
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                topLeft: Radius.circular(20.r),
              ),
              child: Image.network(
                widget.imagePath,
                height: 100.h,
                width: 90.w,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/doctor_fake.png',
                    height: 100.h,
                    width: 90.w,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),

            SizedBox(width: 10.w),

            //NOTE - Doctor Info
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //NOTE - Doctor Name
                  Text(
                    widget.name,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  //NOTE - Doctor Specialty & Address
                  Text(
                    "${widget.specialty} | ${widget.address}",
                    style: TextStyle(
                      color: AppColors.secondary100,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 5.h),

                  //NOTE - Doctor Rating and Available time
                  Row(
                    children: [
                      SvgPicture.asset(
                        SvgAssets.star2,
                        height: 18.h,
                        width: 18.w,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "${widget.rating}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      SizedBox(width: 10.w),
                      SvgPicture.asset(
                        "assets/svg/Clock_Circle.svg",
                        height: 18.h,
                        width: 18.w,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "${widget.startDate ?? " "} - ${widget.endDate ?? " "}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isFav = !isFav;
                });
                context.read<FavoriteCubit>().makeFavorite(widget.docId);
              },
              icon: isFav
                  ? SvgPicture.asset(
                      "assets/svg/red_heart.svg",

                      height: 24.h,
                      width: 24.w,
                    )
                  : SvgPicture.asset(
                      "assets/svg/Heart.svg",

                      height: 24.h,
                      width: 24.w,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
