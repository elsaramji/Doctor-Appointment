import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final int starCount;
  final double size;

  const StarRating({
    super.key,
    required this.rating,
    this.starCount = 5,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        final starIndex = index + 1;
        final difference = rating - starIndex;

        if (difference >= 0) {
          return SvgPicture.asset(
            SvgAssets.star2,
            width: size,
            height: size,
          );
        } else if (difference > -1 && difference < 0) {
          if (rating - rating.floor() >= 0.75) {
            return SvgPicture.asset(
              SvgAssets.halfStarSvg,
              width: size,
              height: size,
            );
          } else if (rating - rating.floor() >= 0.25) {
            return SvgPicture.asset(
              SvgAssets.halfStarSvg,
              width: size,
              height: size,
            );
          } else {
            return SvgPicture.asset(
              SvgAssets.emptyStarImage,
              width: size,
              height: size,
            );
          }
        } else {
          return SvgPicture.asset(
            SvgAssets.emptyStarImage,
            width: size,
            height: size,
          );
        }
      }),
    );
  }
}

class InteractiveStarRating extends StatefulWidget {
  final int starCount;
  final double size;
  final double initialRating;
  final ValueChanged<double>? onRatingChanged;

  const InteractiveStarRating({
    super.key,
    this.starCount = 5,
    this.size = 24,
    this.initialRating = 0,
    this.onRatingChanged,
  });

  @override
  State<InteractiveStarRating> createState() => _InteractiveStarRatingState();
}

class _InteractiveStarRatingState extends State<InteractiveStarRating> {
  late double rating;

  @override
  void initState() {
    super.initState();
    rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.starCount, (index) {
        final starIndex = index + 1;
        final isFull = rating >= starIndex;
        final isHalf = rating > starIndex - 1 && rating < starIndex;

        return GestureDetector(
          onTap: () {
            setState(() => rating = starIndex.toDouble());
            widget.onRatingChanged?.call(rating);
          },
          child: SvgPicture.asset(
            isFull
                ? SvgAssets.star2
                : isHalf
                ? SvgAssets.halfStarSvg
                : SvgAssets.emptyStarImage,
            width: widget.size,
            height: widget.size,
          ),
        );
      }),
    );
  }
}
