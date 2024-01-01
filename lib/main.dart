import 'package:flutter/material.dart';
import 'package:mask_api/model/store_model.dart';
// import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Store> stores = [] ;

  Future fecth() async {
    // var url = 'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json?lat=37.137391&lng=126.924770&m=5000';
    //
    // // var response = await Uri.http(url, );
    //
    // var response = await http.get(url);
    // print('Response status: ${response.statusCode}');
    //
    // print('Response body: ${response.body}');
    //
    // var url = Url.https('https://gist.githubusercontent.com', '/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json?lat=37.137391&lng=126.924770&m=5000');



    // import 'package:http/http.dart' as http;
    //
    // var url = Uri.https('example.com', 'whatsit/create');
    // var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    // final List<Store> stores = [];
    //
    // var url = Uri.https(
    //     'gist.githubusercontent.com', '/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json');
    //
    // try {
    //   var response = await http.get(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('마스크 재고 있는: 0곳')),
      body: Center(
        child: Text('text'),
      ),
    );
  }
}
