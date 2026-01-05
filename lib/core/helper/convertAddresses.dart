import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';

class Convertaddresses {
  static Future<String?> convertLatLngToAddress(LatLng latLng) async {
    try {
      final Dio dio = Dio()
        ..options.headers['User-Agent'] = 'round_7_mobile_cure_team4';

      final url =
          "https://nominatim.openstreetmap.org/reverse?lat=${latLng.latitude}&lon=${latLng.longitude}&format=json";

      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;

        if (data != null && data["display_name"] != null) {
          String address = data["display_name"];
          print("Address: $address");
          return address;
        }
      }
    } catch (e) {
      print("Reverse Geocoding Error: $e");
    }

    return null;
  }

  static Future<LatLng?> convertLocationToLatLng(String name) async {
    try {
      final Dio _dio = Dio()
        ..options.headers['User-Agent'] = 'round_7_mobile_cure_team4';

      final url =
          "https://nominatim.openstreetmap.org/search?q=$name&format=json&limit=1";

      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;

        if (data != null && data.isNotEmpty) {
          final lat = double.parse(data[0]["lat"]);
          final lon = double.parse(data[0]["lon"]);

          print("Lat: $lat, Lng: $lon  of $name");
          return LatLng(lat, lon);
        }
      }
    } catch (e) {
      print("Error: $e");
    }

    return null;
  }

  String shortenAddress(String address, {int wordsCount = 3}) {
    final words = address.split(' ');
    if (words.length <= wordsCount) return address;
    return '${words.take(wordsCount).join(' ')}...';
  }
}
