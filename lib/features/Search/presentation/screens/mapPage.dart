import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';
import 'package:round_7_mobile_cure_team4/core/routes/app_router.dart';
import 'package:round_7_mobile_cure_team4/core/themes/colors.dart';
import 'package:round_7_mobile_cure_team4/core/themes/text_styles.dart';
import 'package:round_7_mobile_cure_team4/features/Search/presentation/widgets/mapSearchWidget.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:round_7_mobile_cure_team4/features/profile/presentation/cubit/profile_state.dart';

class MapPage extends StatefulWidget {
  final bool myBool;
  const MapPage({super.key, required this.myBool});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng? searchByThisLocation;
  LatLng currentPos = LatLng(30.0444, 31.2357); // Cairo

  @override
  void initState() {
    super.initState();
    // context.read<ProfileCubit>().fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              keepAlive: true,
              initialCenter: currentPos,
              initialZoom: 13.0,
              initialRotation: 0.0,
              onTap: (tapPosition, point) async {
                setState(() {
                  currentPos = point;
                  searchByThisLocation = point;
                });
              },
              onPositionChanged: (position, hasGesture) {
                if (hasGesture) {
                  setState(() {
                    currentPos = position.center;
                    // searchByThisLocation = position.center;
                  });
                }
              },
            ),
            children: [
              TileLayer(
                urlTemplate:
                'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c'],
                userAgentPackageName: 'com.example.round_7_mobile_cure_team4',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 60.w,
                    height: 60.h,
                    point: currentPos,
                    child: const Icon(Icons.location_on, color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 65.h,
            left: 24.w,
            right: 24.w,
            child: Card(
              elevation: 20.h,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(24.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: ListTile(
                  leading: IconButton(
                    onPressed: () {
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
                    "Current location",
                    style: RegularGeorgia.regularGeorgia16.apply(
                      color: AppColors.secondary500,
                    ),
                  ),
                  subtitle: BlocBuilder<ProfileCubit, ProfileState>(
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
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => Dialog(
                          child: MapSearchWidget(
                            flag: false,
                            onLocationSelected: (LatLng newPos) {
                              setState(() {
                                searchByThisLocation = newPos;
                                currentPos = newPos;
                              });
                            },
                          ),
                        ),
                      );
                    },
                    icon: SvgPicture.asset(
                      SvgAssets.search,
                      width: 24.w,
                      height: 24.h,
                      color: AppColors.secondary500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 24.h,
            left: 16.w,
            right: 16.w,
            child: ElevatedButton(
              onPressed: () {
                log(
                  "<<<<<<<<<<<<<<<<<<<searchByThisLocation: longitude=${searchByThisLocation!.longitude}&latitude=${searchByThisLocation!.latitude} >>>>>>>>>>>>>>>>.",
                );
                log(
                  "<<<<<<<<<<<<<<<<<<<currentPos: longitude=${currentPos.longitude}&latitude=${currentPos.latitude} >>>>>>>>>>>>>>>>.",
                );
                if (searchByThisLocation == null) return;

                final lat = searchByThisLocation!.latitude;
                final lng = searchByThisLocation!.longitude;

                context.push(
                  '${AppRoutes.mapResults}?longitude=$lng&latitude=$lat',
                );
              },
              child: const Text('Confirm location'),
            ),
          ),
        ],
      ),
    );
  }
}
