import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/routes/app_router.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/widgets/drawSpecialties.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/domain/Entities/allSpecialtiesEntity.dart';
import 'package:search_page/search_page.dart';

class SearchWidget extends StatefulWidget {
  final bool toPage;
  final List<AllSpecialtiesEntity?> specialties;

  const SearchWidget({
    super.key,
    required this.toPage,
    required this.specialties,
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String userQuery = "";
  List<String> getSpecialtiesTitles() {
    return widget.specialties.map((item) => item!.title).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !widget.toPage
          ? () => showSearch(
              context: context,
              delegate: SearchPage<String>(
                items: getSpecialtiesTitles(),
                searchLabel: 'Search for specialty',
                suggestion: const Center(child: Text('Search by specialty')),
                onQueryUpdate: (value) => userQuery = value,
                failure: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('No results found'),
                      SizedBox(height: 8.h),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary500,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            side: const BorderSide(
                              color: AppColors.primary500,
                              width: 1,
                            ),
                          ),
                        ),
                        onPressed: () {
                          print(
                            "<<<<<<<< Searching API for: $userQuery >>>>>>>>>>>>>>>>>",
                          );
                          // context.read<DoctorsCubit>().loadSearchedDoctors(
                          //   userQuery,
                          // );
                          context.pushNamed(
                            'result',
                            pathParameters: {'query': userQuery},
                          );
                        },
                        child: const Text("Search online"),
                      ),
                    ],
                  ),
                ),
                filter: (item) => [item],
                builder: (item) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                  child: InkWell(
                    onTap: () {
                      final index = getSpecialtiesTitles().indexOf(item);
                      final specID = widget.specialties[index]!.id;
                      Navigator.pop(context);
                      context.pushNamed(
                        'result',
                        pathParameters: {'query': specID.toString()},
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: AppColors.neutral200,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Emoji icon
                          Text(
                            widget.specialties[getSpecialtiesTitles().indexOf(item)]!.imgUrl,
                            style: TextStyle(fontSize: 24.sp),
                          ),
                          SizedBox(width: 12.w),
                          // Specialty name
                          Expanded(
                            child: Text(
                              item,
                              style: RegularMontserrat.regularMontserrat16.copyWith(
                                color: AppColors.neutral900,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          // Arrow icon
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.sp,
                            color: AppColors.neutral500,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          : () => context.push(AppRoutes.search),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppColors.neutral50,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.neutral100, width: 1.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              SvgAssets.search,
              width: 20.w,
              height: 20.h,
              color: AppColors.neutral700,
            ),
            SizedBox(width: 8.w),
            Text(
              "Search for specialty, doctor",
              style: RegularMontserrat.regularMontserrat14.copyWith(
                color: AppColors.neutral700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* */
