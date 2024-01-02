// import 'package:flutter/material.dart';
// import 'package:mask_api/ui/widget/remain_stat_list_tile.dart';
// import 'package:mask_api/view_model/store_model.dart';
// import 'package:provider/provider.dart';
//
// class MainPage extends StatelessWidget {
//   const MainPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     //주어진 코드는 Flutter 애플리케이션에서 `Provider` 패키지를 사용하여 `StoreModel` 객체를 가져오는 부분입니다.
//     //
//     // `Provider`는 상태 관리 패턴 중 하나로, 데이터를 제공하고 공유하기 위해 사용됩니다.
//     // `Provider.of<T>(context)`는 해당 `context`에서 `T` 타입의 객체를 가져오는 역할을 합니다.
//     //
//     // `StoreModel`은 아마도 애플리케이션에서 사용되는 가게 정보를 관리하는 모델 클래스일 것입니다.
//     // `Provider`를 사용하여 `StoreModel` 객체를 가져오면, 해당 객체의 상태를 다른 위젯들과 공유할 수 있습니다.
//     //
//     // 이 코드는 `context`를 통해 `StoreModel` 객체를 가져와서 `storeModel`이라는 변수에 할당하는 역할을 합니다.
//     // 이후에는 `storeModel` 변수를 사용하여 `StoreModel` 객체의 상태에 접근하거나 상태를 변경할 수 있습니다.
//     //
//     // 애플리케이션의 다른 부분에서 `storeModel` 변수를 사용하여 `StoreModel` 객체를 참조하고 상태를 업데이트할 수 있을 것입니다.
//     // 이를 통해 애플리케이션의 여러 위젯들이 동일한 `StoreModel` 객체를 공유하고 상태를 동기화할 수 있습니다.
//
//     final storeModel = Provider.of<StoreModel>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('마스크 재고 있는: ${storeModel.stores.length}곳'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: () {
//               storeModel.fetch();
//             },
//           )
//         ],
//       ),
//       body: _buildBody(storeModel),
//     );
//   }
//
//   Widget _buildBody(StoreModel storeModel) {
//
//     if (storeModel.isLoading == true) {
//       return loadingWidget();
//     }
//
//     // 만약에
//     if (storeModel.stores.isEmpty) {
//       return const Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('반경 5km 이내에 재고가 있는 매장이 없습니다.'),
//             Text('도는 인터넷 연결이 되어있는지 확인해 주세요.')
//           ],
//         ),
//       );
//     }
//
//     return ListView(
//       children: storeModel.stores.map((e) {
//         return RemainStatListTile(store: e);
//       }).toList(),
//     );
//   }
//
//   Widget loadingWidget() {
//     return const Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('정보를 가져오는 중'),
//           CircularProgressIndicator(),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:mask_api/ui/widget/remain_stat_list_tile.dart';
import 'package:mask_api/view_model/store_model.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storeModel = Provider.of<StoreModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('마스크 재고 있는 곳 : ${storeModel.stores.length}곳'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              storeModel.fetch();
            },
          )
        ],
      ),
      body: _buildBody(storeModel),
    );
  }

  Widget _buildBody(StoreModel storeModel) {
    if (storeModel.isLoading == true) {
      return loadingWidget();
    }

    if (storeModel.stores.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('반경 5km 이내에 재고가 있는 매장이 없습니다'),
            Text('또는 인터넷이 연결되어 있는지 확인해 주세요'),
          ],
        ),
      );
    }

    return ListView(
      children: storeModel.stores.map((e) {
        return RemainStatListTile(store: e);
      }).toList(),
    );
  }

  Widget loadingWidget() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('정보를 가져오는 중'),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}