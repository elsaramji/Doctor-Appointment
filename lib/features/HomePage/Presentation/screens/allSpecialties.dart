import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/specialties/specialties_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/cubit/specialties/specialties_state.dart';
import 'package:round_7_mobile_cure_team4/features/HomePage/Presentation/widgets/drawSpecialties.dart';

class AllSpecialties extends StatelessWidget {
  const AllSpecialties({super.key});

  @override
  Widget build(BuildContext context) {
    final specialtiesCubit = context.read<SpecialtiesCubit>();

    specialtiesCubit.loadAllSpecialties();

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
          "Specialties",
          style: RegularGeorgia.regularGeorgia24.apply(color: AppColors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: BlocConsumer<SpecialtiesCubit, SpecialtiesStates>(
          builder: (context, state) {
            if (state is SpecialtiesLoadedState) {
              return Wrap(
                spacing: 10,
                runSpacing: 10,
                children: state.specialties.asMap().entries.map((entry) {
                  final i = entry.key;
                  return DrawSpecialties(
                    index: i,
                    specialties: state.specialties,
                    specID: state.specialties[i]!.id,
                  );
                }).toList(),
              );
            } else if (state is SpecialtiesLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const SizedBox.shrink();
            }
          },
          listener: (context, state) {
            if (state is SpecialtiesErrorState) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Error'),
                    content: Text(state.errorMSG),
                    actions: [
                      TextButton(
                        onPressed: () => context.pop(),
                        child: const Text('Close'),
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
