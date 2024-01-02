// import 'package:geolocator/geolocator.dart';
//
// class LocationRepository {
//   Future<Position> getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     // 위치 활성화 여부를 bool 값으로 받음
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//
//     if (!serviceEnabled) {
//       return Future.error('위치 서비스가 비활성화 되었습니다.');
//     }
//
//     // 지금 현재 앱이 갖고 있는 위치 서비스에 대한 권한을 가져옴
//     permission = await Geolocator.checkPermission();
//
//     if (permission == LocationPermission.denied) {
//       // 회면에 권한을 요청하는 다이얼로그를 띄움
//       permission = await Geolocator.requestPermission();
//
//       if (permission == LocationPermission.denied) {
//         return Future.error('위치 권한이 거부되었습니다.');
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error('위치 권한이 영구적으로 거부되어 권한을 요청할 수 없습니다.');
//     }
//
//     return await Geolocator.getCurrentPosition();
//   }
// }

import 'package:geolocator/geolocator.dart';

class LocationRepository {
  // https://pub.dev/packages/geolocator 참고
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}