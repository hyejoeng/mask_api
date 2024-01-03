class Store {
  Store({
    required this.addr,
    required this.code,
    required this.lat,
    required this.lng,
    required this.name,
    required this.type,
    required this.stockAt,
    required this.createdAt,
    required this.remainStat,
  });
  late final String addr;
  late final String code;
  late final double lat;
  late final double lng;
  late final String name;
  late final String type;
  late final String stockAt;
  late final String createdAt;
  late final String remainStat;
  late double km;

  Store.fromJson(Map<String, dynamic> json){
    addr = json['addr'];
    code = json['code'];
    lat = json['lat'];
    lng = json['lng'];
    name = json['name'];
    type = json['type'];
    stockAt = json['stock_at'] ?? '';
    createdAt = json['created_at'] ?? '';
    remainStat = json['remain_stat'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['addr'] = addr;
    data['code'] = code;
    data['lat'] = lat;
    data['lng'] = lng;
    data['name'] = name;
    data['type'] = type;
    data['stock_at'] = stockAt;
    data['created_at'] = createdAt;
    data['remain_stat'] = remainStat;
    return data;
  }
}