import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/shared_widget/custom_doctor_card.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/doctor/doctor_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/doctor/doctor_state.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/favorite/favorite_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/favorite/favorite_state.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/widgets/empty_favorite_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorsCubit>().getFavDoctors();
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
        title: Text(
          "Your Favorite",
          style: RegularGeorgia.regularGeorgia24.apply(color: AppColors.black),
        ),
        centerTitle: true,
      ),

      body: MultiBlocListener(
        listeners: [
          BlocListener<DoctorsCubit, DoctorsStates>(
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
          BlocListener<FavoriteCubit, FavoriteStates>(
            listener: (context, state) {
              if (state is FavSuccessState) {
                context.read<DoctorsCubit>().getFavDoctors();
              }
            },
          ),
        ],
        child: Padding(
          padding: EdgeInsets.all(16),
          child: BlocBuilder<DoctorsCubit, DoctorsStates>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is LoadedState) {
                if (state.doctors == null || state.doctors.isEmpty) {
                  return EmptyFavoriteWidget();
                }
                return SingleChildScrollView(
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: state.doctors.asMap().entries.map((entry) {
                      final item = entry.value;
                      return CustomDoctorCard(
                        name: item!.fullName,
                        docId: item.id,
                        specialty: item.specialistTitle,
                        address: item.address,
                        rating: item.rating,
                        isFav: item.isFavourite,
                        startDate: item.startDate,
                        endDate: item.endDate,
                        imagePath: item.imgUrl,
                      );
                    }).toList(),
                  ),
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
