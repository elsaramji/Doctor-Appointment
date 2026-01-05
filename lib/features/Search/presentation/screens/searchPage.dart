import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/helper/convertAddresses.dart';
import 'package:round_7_mobile_cure_team4/core/routes/app_router.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/doctor/doctor_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/specialties/specialties_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/specialties/specialties_state.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/widgets/drawSpecialties.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/widgets/searchWidget.dart';
import 'package:round_7_mobile_cure_team4/features/Search/presentation/cubit/history_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/Search/presentation/cubit/history_state.dart';
import 'package:round_7_mobile_cure_team4/features/Search/presentation/widgets/drawHistory.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/cubit/profile_state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    context.read<SpecialtiesCubit>().loadAllSpecialties();
    context.read<HistoryCubit>().loadHistory();
    context.read<ProfileCubit>().fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: SvgPicture.asset(
            SvgAssets.weuiArrowOutlined,
            width: 24.w,
            height: 24.h,
            color: AppColors.secondary500,
          ),
        ),
        title: Text("Search", style: RegularGeorgia.regularGeorgia24),
        centerTitle: true,
      ),
      body: MultiBlocListener(
        listeners: [
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
            // Show loading if specialties are still loading
            if (specialtiesState is! SpecialtiesLoadedState) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: CircularProgressIndicator(),
                ),
              );
            }

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 🔎 Search Bar
                    SearchWidget(
                      toPage: false,
                      specialties: specialtiesState.specialties,
                    ),

                SizedBox(height: 16.h),

                //NOTE - search by your location
                Row(
                  children: [
                    Text(
                      "Search by your location",
                      style: RegularMontserrat.regularMontserrat16.apply(
                        color: AppColors.secondary500,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        if (state is ProfileLoaded) {
                          final profile = state.profile;
                          return TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              overlayColor: Colors.transparent,
                            ),
                            onPressed: () async {
                              if (profile.address.isNotEmpty) {
                                LatLng? latLng =
                                    await Convertaddresses.convertLocationToLatLng(
                                      profile.address,
                                    );
                                if (latLng != null) {
                                  context.push(
                                    '${AppRoutes.mapResults}?longitude=${latLng.longitude}&latitude=${latLng.latitude}',
                                  );
                                }
                              } else {
                                context.go(AppRoutes.profile);
                              }
                            },
                            child: Text(
                              profile.address.isNotEmpty
                                  ? profile.address
                                  : 'No address provided',
                              style: RegularMontserrat.regularMontserrat12,
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),

                SizedBox(height: 24.h),

                Text(
                  "All Specialties",
                  style: RegularGeorgia.regularGeorgia20.apply(
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 16.h),

                /// 🔹 "All" button
                GestureDetector(
                  onTap: () {
                    context.pushNamed(
                      'result',
                      pathParameters: {'query': "All"},
                    );
                    context.read<DoctorsCubit>().loadAllDoctors();
                  },
                  child: Container(
                    height: 50.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.neutral500),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Text(
                      "All",
                      style: RegularMontserrat.regularMontserrat16.apply(
                        color: AppColors.neutral900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                SizedBox(height: 10.h),

                    /// 🔹 All Specialties
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: specialtiesState.specialties.asMap().entries.map((
                        entry,
                      ) {
                        final i = entry.key;
                        return DrawSpecialties(
                          index: i,
                          specialties: specialtiesState.specialties,
                          specID: specialtiesState.specialties[i]!.id,
                        );
                      }).toList(),
                    ),

                SizedBox(height: 32.h),

                Text(
                  "History",
                  style: RegularGeorgia.regularGeorgia20.apply(
                    color: AppColors.black,
                  ),
                ),

                BlocBuilder<HistoryCubit, HistoryState>(
                  builder: (context, state) {
                    if (state is HistoryLoadedState) {
                      if (state.history.isEmpty || state.history == null) {
                        return Text("No history yet");
                      }
                      return Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: state.history.asMap().entries.map((entry) {
                          final item = entry.value!;
                          return InkWell(
                            onTap: () {
                              context.pushNamed(
                                'result',
                                pathParameters: {'query': item.keyword},
                              );

                              context.read<HistoryCubit>().loadHistory();
                            },
                            child: DrawHistory(str: item.keyword),
                          );
                        }).toList(),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                ],
              ),
            ),
          );
        },
        ),
      ),
    );
  }
}
