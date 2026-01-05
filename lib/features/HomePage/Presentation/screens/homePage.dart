import 'package:flutter/material.dart' hide Banner;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:lottie/lottie.dart';
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
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/widgets/banner.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/widgets/drawSpecialties.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/widgets/homePageHeader.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/widgets/searchWidget.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/cubit/profile_state.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isEmpty = false;
  String? _lastKnownAddress;

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<DoctorsCubit, DoctorsStates>(
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
          BlocListener<ProfileCubit, ProfileState>(
            listener: (context, state) async {
              if (state is ProfileLoaded) {
                final profile = state.profile;

                // Check if address has changed
                final hasAddressChanged = _lastKnownAddress != profile.address;

                if (profile.address.isNotEmpty) {
                  // Only fetch doctors if address has changed
                  if (hasAddressChanged) {
                    print(
                      "<<<<<<<<<<<<<<<   Address changed to: ${profile.address} >>>>>>>>>>>>>>>>>>>>>>>>>>>",
                    );
                    setState(() {
                      isEmpty = false;
                      _lastKnownAddress = profile.address;
                    });

                    LatLng? latLng =
                        await Convertaddresses.convertLocationToLatLng(
                          profile.address,
                        );
                    if (latLng != null) {
                      context.read<DoctorsCubit>().getDoctorsByLocation(
                        latLng.latitude,
                        latLng.longitude,
                        15,
                      );
                    } else {
                      print(
                        "<<<<<<<<<<<<<<<   Could not convert address to LatLng >>>>>>>>>>>>>>>>>>>>>>>>>>>",
                      );
                      // Optionally show a snackbar or handle this error
                    }
                  } else {
                    // Address exists but hasn't changed, just update state
                    setState(() {
                      isEmpty = false;
                      _lastKnownAddress = profile.address;
                    });
                  }
                } else {
                  print(
                    "<<<<<<<<<<<<<<<   no doctors >>>>>>>>>>>>>>>>>>>>>>>>>>>",
                  );
                  setState(() {
                    isEmpty = true;
                    _lastKnownAddress = null;
                  });
                }
              }
            },
          ),
          BlocListener<SpecialtiesCubit, SpecialtiesStates>(
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
        ],
        child: BlocBuilder<SpecialtiesCubit, SpecialtiesStates>(
          builder: (context, specialtiesState) {
            // Show clean loading if specialties are still loading
            if (specialtiesState is! SpecialtiesLoadedState) {
              return SafeArea(
                child: Center(child: CircularProgressIndicator()),
              );
            }

            // Show all content once loaded
            return SafeArea(
              child: Column(
                children: [
                  HomePageHeader(),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      child: ListView(
                        children: [
                          SizedBox(height: 20.h),

                          /// 🔎 Search bar
                          SearchWidget(
                            toPage: true,
                            specialties: specialtiesState.specialties,
                          ),

                          SizedBox(height: 24.h),

                          /// 🔹 Specialties Title
                          Row(
                            children: [
                              Text(
                                "Specialties",
                                style: RegularGeorgia.regularGeorgia20,
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () =>
                                    context.push(AppRoutes.specialties),
                                child: Text(
                                  "View all",
                                  style: RegularMontserrat.regularMontserrat14,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 16.h),

                          /// 🔹 Specialties horizontal list
                          SizedBox(
                            height: 50.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: specialtiesState.specialties.length,
                              itemBuilder: (context, i) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 12.w),
                                  child: DrawSpecialties(
                                    index: i,
                                    specialties: specialtiesState.specialties,
                                    specID: specialtiesState.specialties[i]!.id,
                                  ),
                                );
                              },
                            ),
                          ),

                          SizedBox(height: 32.h),

                          const Banner(),

                          SizedBox(height: 32.h),

                          /// 🔹 Doctors near you
                          Row(
                            children: [
                              Text(
                                "Doctors near you",
                                style: RegularGeorgia.regularGeorgia20,
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  context.push(AppRoutes.allNearDoctors);
                                },
                                child: Text(
                                  "View all",
                                  style: RegularMontserrat.regularMontserrat14,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 16.h),

                          /// 🔹 Doctor Cards
                          BlocBuilder<DoctorsCubit, DoctorsStates>(
                            builder: (context, state) {
                              if (state is LoadedState) {
                                if (state.doctors.isEmpty || isEmpty) {
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

                                        Center(
                                          child: Text(
                                            isEmpty
                                                ? "Location not set. Please set location to see nearby doctors."
                                                : "No doctors found near your location.",
                                            style: RegularGeorgia
                                                .regularGeorgia14
                                                .apply(
                                                  color: AppColors.secondary500,
                                                ),
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
                                      child: CustomDoctorCard(
                                        name: item!.fullName,
                                        docId: item.id,
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
                                );
                              }
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

                                    Center(
                                      child: Text(
                                        "Location not set. Please set location to see nearby doctors.",
                                        style: RegularGeorgia.regularGeorgia14
                                            .apply(
                                              color: AppColors.secondary500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
