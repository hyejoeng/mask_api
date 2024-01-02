// import 'dart:convert';
// import 'package:geolocator/geolocator.dart';
// import 'package:mask_api/model/store.dart';
// import 'package:http/http.dart' as http;
//
// class StoreRepository {
//   Future<Iterable<Store>> fetch(double lat, double lng) async {
//     final List<Store> stores = [];
//
//     var url = Uri.https('https://gist.githubusercontent.com',
//         '/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json');
//
//     try {
//       var response = await http.get(url);
//
//       // 만약 서버가 ok응답을 반환하면
//       if (response.statusCode == 200) {
//         // jsonDecode() -> json데이터 구조를 Map<String, dynamic>데이터 타입으로 변경
//         // 한글 깨짐 처리 -> utf8.decode(reponse.bodyBytes); 로 데이터로 가져옴
//         final jsonResult = jsonDecode(utf8.decode(response.bodyBytes));
//
//         // json 파일에서 stores의 값을 가져옴
//         final jsonStores = jsonResult['stores'];
//
//         jsonStores.forEach((e) {
//           final store = Store.fromJson(e);
//
//           // 두 좌표 사이의 거리 계산, 미터 단위
//           final meter = Geolocator.distanceBetween(
//             store.lat,
//             store.lng,
//             lat,
//             lng,
//           );
//
//           store.km = meter / 1000;
//
//           stores.add(store);
//         });
//
//         // 1. `stores.where((e) { ... })`: `stores` 리스트에서 각 요소 `e`에 대해 주어진 조건을 만족하는 요소들을 선택합니다.
//         // 이때 `e.remainStat`은 재고 상태를 나타내는 속성이며, `'plenty'`, `'some'`, `'few'` 중 하나인 경우를 선택 조건으로 합니다.
//         // 2. `.toList()`: 선택된 요소들을 리스트로 변환합니다.
//         // 3. `..sort((a, b) => a.km.compareTo(b.km))`: 변환된 리스트를 `km` 속성을 기준으로 오름차순으로 정렬합니다.
//         // `a.km`과 `b.km`은 각각 요소 `a`와 `b`의 `km` 속성을 나타내며, `a.km.compareTo(b.km)`은 두 요소의 `km` 값을 비교한 결과입니다.
//         //
//         // 각 요소들을 조건으로 걸러 새로운 배열을 만듦
//         return stores.where((e) {
//           return e.remainStat == 'plenty' ||
//               e.remainStat == 'some' ||
//               e.remainStat == 'few';
//         }).toList()
//           // .. 연속적인 메서드 호출을 간결하게 표현하기 위해 사용
//
//           // compareTo -> 비교 대상인 두ㅡ 값을 비교하여 결과를 반환하느 ㄴ메서드
//           ..sort((a, b) => a.km.compareTo(b.km));
//       } else {
//         return [];
//       }
//     } catch (e) {
//       return [];
//     }
//   }
// }

import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:mask_api/model/store.dart';

class StoreRepository {
  Future<List<Store>> fetch(double lat, double lng) async {
    final List<Store> stores = [];

    var url = Uri.https('gist.githubusercontent.com',
        '/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResult = jsonDecode(utf8.decode(response.bodyBytes));

        final jsonStores = jsonResult['stores'];

        jsonStores.forEach((e) {
          final store = Store.fromJson(e);
          final meter =
          Geolocator.distanceBetween(store.lat, store.lng, lat, lng);
          store.km = meter / 1000;
          stores.add(store);
        });

        return stores.where((e) {
          return e.remainStat == 'plenty' ||
              e.remainStat == 'some' ||
              e.remainStat == 'few';
        }).toList()
          ..sort((a, b) => a.km.compareTo(b.km));
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}