import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/shared_widget/custom_doctor_card.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/doctor/doctor_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/doctor/doctor_state.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/specialties/specialties_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/specialties/specialties_state.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/widgets/drawSpecialties.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/widgets/searchWidget.dart';

class SearchResultsPage extends StatefulWidget {
  final String strID;
  const SearchResultsPage({super.key, required this.strID});

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  String? selectedSpecialtyId;

  Widget drawDoctorCard(
    int id,
    String fullname,
    String spec,
    String adrs,
    double rating,
    bool isFavorite,
    String imgUrl,
    String startDate,
    String endDate,
  ) {
    return CustomDoctorCard(
      docId: id,
      name: fullname,
      specialty: spec,
      address: adrs,
      rating: rating,
      isFav: isFavorite,
      startDate: startDate,
      endDate: endDate,
      imagePath: imgUrl,
    );
  }

  @override
  void initState() {
    super.initState();

    selectedSpecialtyId = widget.strID;
    int? intID = int.tryParse(widget.strID);
    context.read<SpecialtiesCubit>().loadAllSpecialties();
    print("<<<<<<< Searching API for: $intID >>>>>>>>>>>>>>>");
    if (widget.strID == "All") {
      context.read<DoctorsCubit>().loadAllDoctors();
    } else if (intID != null) {
      context.read<DoctorsCubit>().loadSpecialityDoctors(
        int.parse(widget.strID),
      );
    } else {
      context.read<DoctorsCubit>().loadSearchedDoctors(widget.strID);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (widget.strID == "All") {
              context.read<DoctorsCubit>().loadAllDoctors();
            } else {
              final intID = int.tryParse(widget.strID);
              if (intID != null) {
                context.read<DoctorsCubit>().loadSpecialityDoctors(intID);
              }
            }
            context.pop();
          },
          icon: SvgPicture.asset(
            SvgAssets.weuiArrowOutlined,
            width: 24.w,
            height: 24.h,
            color: AppColors.secondary500,
          ),
        ),
        title: Text(
          "Doctors",
          style: RegularGeorgia.regularGeorgia24.apply(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<SpecialtiesCubit, SpecialtiesStates>(
        builder: (context, specialtiesState) {
          // Show loading if specialties are still loading
          if (specialtiesState is! SpecialtiesLoadedState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Padding(
            padding: EdgeInsets.all(16.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// 🔎 Search Widget
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 16, 16, 0),
                    child: SearchWidget(
                      toPage: false,
                      specialties: specialtiesState.specialties,
                    ),
                  ),

              SizedBox(height: 16.h),

              /// 🔹 Specialty Filters
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSpecialtyId = "All";
                        });
                        // Load all doctors without navigation
                        context.read<DoctorsCubit>().loadAllDoctors();
                      },
                      child: Container(
                        height: 50.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: selectedSpecialtyId == "All"
                              ? AppColors.primaryDefault
                              : AppColors.white,
                          border: Border.all(
                            color: selectedSpecialtyId == "All"
                                ? AppColors.primaryDefault
                                : AppColors.neutral500,
                          ),
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: Text(
                          "All",
                          style: RegularMontserrat.regularMontserrat16.apply(
                            color: selectedSpecialtyId == "All"
                                ? AppColors.white
                                : AppColors.neutral900,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.h),
                    Row(
                      children: specialtiesState.specialties.map((item) {
                        final index = specialtiesState.specialties.indexOf(item);
                        return Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: DrawSpecialties(
                            index: index,
                            specialties: specialtiesState.specialties,
                            specID: item!.id,
                            selectedSpecialtyId: selectedSpecialtyId,
                            shouldNavigate: false, // Don't navigate, just update content
                            onSelected: () {
                              setState(() {
                                selectedSpecialtyId = item.id.toString();
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              /// 🔹 Doctors List
              BlocConsumer<DoctorsCubit, DoctorsStates>(
                builder: (context, state) {
                  if (state is LoadedState) {
                    if (state.doctors.isEmpty || state.doctors == null) {
                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Lottie.asset(
                              LottieImages.noResult,
                              repeat: false,
                              fit: BoxFit.contain,
                              height: 200.h,
                            ),

                            Text(
                              "No doctors found for the specified specialist.",
                              style: RegularGeorgia.regularGeorgia14.apply(
                                color: AppColors.secondary500,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: state.doctors.map((item) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: drawDoctorCard(
                            item!.id,
                            item.fullName,
                            item.specialistTitle,
                            item.address,
                            item.rating,
                            item.isFavourite,
                            item.imgUrl,
                            item.startDate,
                            item.endDate,
                          ),
                        );
                      }).toList(),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
                listener: (context, state) {
                  if (state is ErrorState) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Sorry'),
                        content: Text(state.errorMSG),
                        actions: [
                          TextButton(
                            onPressed: () {
                              context.pop();
                              context.pop();
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      );
    },
    ),
    );
  }
}
