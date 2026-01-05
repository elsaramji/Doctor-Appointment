import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatefulWidget {
  LatLng currentPos;
  MapWidget({super.key, required this.currentPos});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  // @override
  // void initState() {
  //   super.initState();
  //   context.read<SpecialtiesCubit>().loadAllSpecialties();
  // }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        // keepAlive: true,
        initialCenter: widget.currentPos,
        initialZoom: 13.0,
        initialRotation: 0.0,
        onTap: (tapPosition, point) {
          setState(() {
            widget.currentPos = point;
          });
        },
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: const ['a', 'b', 'c'],
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: [
            Marker(
              width: 60.w,
              height: 60.h,
              point: widget.currentPos,
              child: const Icon(Icons.location_on, color: Colors.red),
            ),
          ],
        ),
      ],
    );
  }
}
