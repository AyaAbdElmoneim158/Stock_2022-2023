// ignore_for_file: public_member_api_docs, sort_constructors_first
class StockModleSmall {
  final String symbol;
  final String price;
  final String change;
  StockModleSmall({
    required this.symbol,
    required this.price,
    required this.change,
  });
}

class StockModle {
  final String id;
  final String name;
  final String ramz;
  final String logo;
  final String price;
  final String stocksNo;
  // final bool isFav;
  // final bool isFoll;

  StockModle({
    required this.id,
    this.stocksNo = '',
    this.logo = '',
    this.name = '',
    this.price = '',
    this.ramz = '',
    // this.isFav=false,
    // this.isFoll=false,
  });

  factory StockModle.fromMap(Map<String, dynamic> map, String documentId) {
    return StockModle(
      id: map['id'] ?? '',
      stocksNo: map['StocksNo'] ?? '',
      logo: map['logo'] ?? '',
      name: map['name'] ?? '',
      price: map['price'] ?? '',
      ramz: map['ramz'] ?? '',
      // isFav: map['isFav'] ?? false,
      // isFoll: map['isFoll'] ?? false,
    );
  }

  Map<String, dynamic> toMapFoll() {
    final result = <String, dynamic>{};
    result.addAll({'id': id});
    result.addAll({'StocksNo': stocksNo});
    result.addAll({'name': name});
    result.addAll({'logo': logo});
    result.addAll({'price': price});
    result.addAll({'ramz': ramz});
    return result;
  }

  Map<String, dynamic> toMapFav() {
    final result = <String, dynamic>{};
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'logo': logo});
    result.addAll({'ramz': ramz});
    return result;
  }
}

class News {
  final String date;
  final String des;
  final String link;
  final String title;

  News({this.date = '', this.des = '', this.link = '', this.title = ''});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'date': date});
    result.addAll({'des': des});
    result.addAll({'link': link});
    result.addAll({'title': title});
    return result;
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      date: map['date'] ?? '',
      des: map['des'] ?? '',
      link: map['link'] ?? '',
      title: map['title'] ?? '',
    );
  }
}
