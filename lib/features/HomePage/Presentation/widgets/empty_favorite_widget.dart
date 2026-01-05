import 'package:flutter/material.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';

class EmptyFavoriteWidget extends StatelessWidget {
  const EmptyFavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(child: Image.asset(ImageAssets.favHearts)),
          Text(
            "Your favorite!",
            style: RegularGeorgia.regularGeorgia24.apply(
              color: AppColors.black,
            ),
          ),
          Text(
            "Add your favorite to find it easily",
            style: MediumMontserrat.mediumMontserrat16.apply(
              color: AppColors.neutral700,
            ),
          ),
        ],
      ),
    );
  }
}
