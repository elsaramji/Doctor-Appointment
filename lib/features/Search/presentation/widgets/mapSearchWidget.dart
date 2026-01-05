import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/helper/convertAddresses.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/Search/presentation/widgets/drawMapResultsWidgets.dart';
import 'package:search_page/search_page.dart';

class MapSearchWidget extends StatefulWidget {
  final Function(LatLng) onLocationSelected;
  final bool flag;

  const MapSearchWidget({
    super.key,
    required this.onLocationSelected,
    required this.flag,
  });

  @override
  State<MapSearchWidget> createState() => _MapSearchWidgetState();
}

class _MapSearchWidgetState extends State<MapSearchWidget> {
  final List<String> locations = [
    "Cairo",
    "Alexandria",
    "Giza",
    "Nasr City",
    "Mansoura",
    "Aswan",
    "Tanta",

    // خارج مصر:
    "New York",
    "Los Angeles",
    "London",
    "Manchester",
    "Paris",
    "Marseille",
    "Berlin",
    "Munich",
    "Rome",
    "Milan",
    "Madrid",
    "Barcelona",
    "Istanbul",
    "Dubai",
    "Abu Dhabi",
    "Doha",
    "Riyadh",
    "Jeddah",
    "Kuwait City",
    "Amman",
    "Beirut",
    "Casablanca",
    "Marrakesh",
    "Tokyo",
    "Osaka",
    "Seoul",
    "Sydney",
    "Melbourne",
    "Toronto",
    "Vancouver",
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showSearch(
        context: context,
        delegate: SearchPage<String>(
          items: locations,
          searchLabel: 'Search for location',
          suggestion: const Center(child: Text('Search by location')),
          failure: const Center(child: Text('No results found')),
          filter: (item) => [item],
          builder: (item) => DrawMapResultsWidgets(
            str: item,
            iconPath: SvgAssets.location,
            onPressed: () async {
              final latLng = await Convertaddresses.convertLocationToLatLng(
                item,
              );
              if (latLng != null) {
                widget.onLocationSelected(latLng);

                context.pop();
              }
            },
          ),
        ),
      ),
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
              "Search for by location",
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
