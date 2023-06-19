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
  final String change;
  // final bool isFoll;

  StockModle({
    required this.id,
    this.stocksNo = '',
    this.logo = '',
    this.name = '',
    this.price = '',
    this.ramz = '',
    this.change = '',
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
      change: map['change'] ?? '',
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
    result.addAll({'change': change});
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

class Newsold {
  final String date;
  final String des;
  final String link;
  final String title;

  Newsold({this.date = '', this.des = '', this.link = '', this.title = ''});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'date': date});
    result.addAll({'des': des});
    result.addAll({'link': link});
    result.addAll({'title': title});
    return result;
  }

  factory Newsold.fromMap(Map<String, dynamic> map) {
    return Newsold(
      date: map['date'] ?? '',
      des: map['des'] ?? '',
      link: map['link'] ?? '',
      title: map['title'] ?? '',
    );
  }
}

//********************************************************
//----------------------------------------------------------------------------
class StockModelApi {
  StockMainApi? stockMainApi;
  String? name;
  String? ramz;
  String? about;
  String? logo;
  List<News>? news;

  StockModelApi(
      {this.stockMainApi,
      this.name,
      this.ramz,
      this.about,
      this.logo,
      this.news});

  StockModelApi.fromJson(Map<String, dynamic> json) {
    stockMainApi = json['stock_main'] != null
        ? StockMainApi.fromJson(json['stock_main'])
        : null;
    name = json['name'];
    ramz = json['ramz'];
    about = json['about'];
    logo = json['logo'];
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (stockMainApi != null) {
      data['stock_main'] = stockMainApi!.toJson();
    }
    data['name'] = name;
    data['ramz'] = ramz;
    data['about'] = about;
    data['logo'] = logo;
    if (news != null) {
      data['news'] = news!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StockMainApi {
  String? stockPrice;
  String? stockMRate;
  String? incPercentage;

  StockMainApi({this.stockPrice, this.stockMRate, this.incPercentage});

  StockMainApi.fromJson(Map<String, dynamic> json) {
    stockPrice = json['stock_price'];
    stockMRate = json['stock_m_rate'];
    incPercentage = json['inc_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stock_price'] = stockPrice;
    data['stock_m_rate'] = stockMRate;
    data['inc_percentage'] = incPercentage;
    return data;
  }
}

class News {
  String? title;
  String? des;
  String? date;
  String? link;

  News({this.title, this.des, this.date, this.link});

  News.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    des = json['des'];
    date = json['date'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['des'] = des;
    data['date'] = date;
    data['link'] = link;
    return data;
  }
}

List<News> fakeNews = [
  News(
      date: "23 may 2023",
      link: 'https://google.com',
      title: 'Title1',
      des:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Id obcaecati velit eaque magnam illum, dolor quis assumenda autem itaque ullam. Impedit unde amet exercitationem, ducimus perferendis minus soluta voluptate ratione'),
  News(
      date: "23 may 2023",
      link: 'https://google.com',
      title: 'Title2',
      des:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Id obcaecati velit eaque magnam illum, dolor quis assumenda autem itaque ullam. Impedit unde amet exercitationem, ducimus perferendis minus soluta voluptate ratione.'),
  News(
      date: "23 may 2023",
      link: 'https://google.com',
      title: 'Title3',
      des:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Id obcaecati velit eaque magnam illum, dolor quis assumenda autem itaque ullam. Impedit unde amet exercitationem, ducimus perferendis minus soluta voluptate ratione.'),
  News(
      date: "23 may 2023",
      link: 'https://google.com',
      title: 'Title4',
      des:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Id obcaecati velit eaque magnam illum, dolor quis assumenda autem itaque ullam. Impedit unde amet exercitationem, ducimus perferendis minus soluta voluptate ratione.'),
  News(
      date: "23 may 2023",
      link: 'https://google.com',
      title: 'Title5',
      des:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Id obcaecati velit eaque magnam illum, dolor quis assumenda autem itaque ullam. Impedit unde amet exercitationem, ducimus perferendis minus soluta voluptate ratione.'),
  News(
      date: "23 may 2023",
      link: 'https://google.com',
      title: 'Title6',
      des:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Id obcaecati velit eaque magnam illum, dolor quis assumenda autem itaque ullam. Impedit unde amet exercitationem, ducimus perferendis minus soluta voluptate ratione.'),
  News(
      date: "23 may 2023",
      link: 'https://google.com',
      title: 'Title7',
      des:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Id obcaecati velit eaque magnam illum, dolor quis assumenda autem itaque ullam. Impedit unde amet exercitationem, ducimus perferendis minus soluta voluptate ratione.'),
  News(
      date: "23 may 2023",
      link: 'https://google.com',
      title: 'Title8',
      des:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Id obcaecati velit eaque magnam illum, dolor quis assumenda autem itaque ullam. Impedit unde amet exercitationem, ducimus perferendis minus soluta voluptate ratione.'),
  News(
      date: "23 may 2023",
      link: 'https://google.com',
      title: 'Title9',
      des:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Id obcaecati velit eaque magnam illum, dolor quis assumenda autem itaque ullam. Impedit unde amet exercitationem, ducimus perferendis minus soluta voluptate ratione.'),
  News(
      date: "23 may 2023",
      link: 'https://google.com',
      title: 'Title10',
      des:
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Id obcaecati velit eaque magnam illum, dolor quis assumenda autem itaque ullam. Impedit unde amet exercitationem, ducimus perferendis minus soluta voluptate ratione.'),
];
