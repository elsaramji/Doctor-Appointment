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

class AllNearDoctorsPage extends StatefulWidget {
  const AllNearDoctorsPage({super.key});

  @override
  State<AllNearDoctorsPage> createState() => _AllNearDoctorsPageState();
}

class _AllNearDoctorsPageState extends State<AllNearDoctorsPage> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorsCubit>().loadAllDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (!mounted) return;
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
          "All Doctors",
          style: RegularGeorgia.regularGeorgia24.apply(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            children: [
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
                              "No doctors found",
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
                  return const Center(child: CircularProgressIndicator());
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
      ),
    );
  }
}
