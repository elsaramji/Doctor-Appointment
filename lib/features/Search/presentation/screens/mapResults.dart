import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/helper/convertAddresses.dart';
import 'package:round_7_mobile_cure_team4/core/routes/app_router.dart';
import 'package:round_7_mobile_cure_team4/core/shared_widget/custom_doctor_card.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/doctor/doctor_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/doctor/doctor_state.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/specialties/specialties_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/specialties/specialties_state.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/widgets/searchWidget.dart';
import 'package:round_7_mobile_cure_team4/features/Search/presentation/widgets/drawMapResultsWidgets.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/cubit/profile_state.dart';

class MapResultsPage extends StatefulWidget {
  final double longitude;
  final double latitude;
  const MapResultsPage({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<MapResultsPage> createState() => _MapResultsPageState();
}

class _MapResultsPageState extends State<MapResultsPage> {
  Convertaddresses x = Convertaddresses();

  @override
  void initState() {
    super.initState();
    // context.read<ProfileCubit>().fetchProfile();
    if (mounted) {
      context.read<DoctorsCubit>().getDoctorsByLocation(
        widget.latitude,
        widget.longitude,
        15,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 22.r,
          child: IconButton(
            onPressed: () => context.pop(),
            icon: SvgPicture.asset(
              SvgAssets.weuiArrowOutlined,
              width: 24.w,
              height: 24.h,
              color: AppColors.secondary500,
            ),
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  SvgAssets.location,
                  width: 25.w,
                  height: 25.h,
                  fit: BoxFit.contain,
                  color: AppColors.primary500,
                ),

                Text(
                  "Your location",
                  style: RegularGeorgia.regularGeorgia14.apply(
                    color: AppColors.primary500,
                  ),
                ),
              ],
            ),
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoaded) {
                  final profile = state.profile;
                  return Text(
                    profile.address.isNotEmpty
                        ? profile.address
                        : 'No address provided',
                    style: RegularMontserrat.regularMontserrat12,
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoaded) {
                  final profile = state.profile;
                  return InkWell(
                    onTap: () => context.go(AppRoutes.profile),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage:
                      profile.imgUrl.isNotEmpty &&
                          profile.imgUrl.startsWith('http')
                          ? NetworkImage(profile.imgUrl)
                          : AssetImage(
                        'assets/images/homePageImages/307ce493-b254-4b2d-8ba4-d12c080d6651.jpg',
                      ),
                      onBackgroundImageError: (_, __) {
                        print("Failed to load profile image, using default");
                      },
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔎 Search Widget
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 16, 16, 0),
                child: BlocConsumer<SpecialtiesCubit, SpecialtiesStates>(
                  builder: (context, state) {
                    if (state is SpecialtiesLoadedState) {
                      return SearchWidget(
                        toPage: false,
                        specialties: state.specialties,
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                  listener: (context, state) {
                    if (state is SpecialtiesErrorState) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Error'),
                          content: Text(state.errorMSG),
                          actions: [
                            TextButton(
                              onPressed: () => context.pop(),
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),

              SizedBox(height: 16.h),

              /// 🔹 Specialty Filters
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DrawMapResultsWidgets(
                    str: "Sort",
                    iconPath: SvgAssets.sortVertical,
                    onPressed: () {
                      context.read<DoctorsCubit>().getTopRatedDoctors();
                    },
                  ),

                  SizedBox(width: 8.w),
                  DrawMapResultsWidgets(
                    str: "Filter",
                    iconPath: SvgAssets.tuning2,
                    onPressed: () {
                      context.push(AppRoutes.specialties);
                    },
                  ),

                  SizedBox(width: 8.w),
                  DrawMapResultsWidgets(
                    str: "Map",
                    iconPath: SvgAssets.routing2,
                    onPressed: () {
                      context.push(AppRoutes.map);
                    },
                  ),

                  SizedBox(width: 8.w),
                ],
              ),

              SizedBox(height: 16.h),

              /// 🔹 Doctors List
              BlocConsumer<DoctorsCubit, DoctorsStates>(
                builder: (context, state) {
                  if (state is LoadedState) {
                    //final List<DoctorsEntity?> item = state.doctors;

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${state.doctors.length} Results",
                          style: RegularGeorgia.regularGeorgia20.apply(
                            color: AppColors.info600,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        ...state.doctors.map((item) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomDoctorCard(
                              docId: item!.id,
                              name: item.fullName,
                              specialty: item.specialistTitle,
                              address: item.address,
                              rating: item.rating,
                              isFav: item.isFavourite,
                              startDate: item.startDate,
                              endDate: item.endDate,
                              imagePath: item.imgUrl,
                            ),
                          );
                        }).toList(),
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
                listener: (context, state) {
                  if (state is ErrorState) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Error'),
                        content: Text(state.errorMSG),
                        actions: [
                          TextButton(
                            onPressed: () => context.pop(),
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
      ),
    );
  }
}
