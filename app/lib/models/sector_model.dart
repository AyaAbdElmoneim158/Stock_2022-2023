/*import 'package:app/shared/components/constants.dart';

class SectorModle {
  final String id;
  final String image;
  final String name;

  SectorModle({
    required this.id,
    this.image = '',
    this.name = '',
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'id': id});
    result.addAll({'image': image});
    result.addAll({'name': name});
    return result;
  }

  factory SectorModle.fromMap(Map<String, dynamic> map, String documentId) {
    return SectorModle(
      id: documentId,
      image: map['image'] ?? '',
      name: map['name'] ?? '',
    );
  }
}

List<SectorModle> sectors = [
  SectorModle(
    id: docmentIdFormLocationData(),
    image: "assets/images/commercial-international-bank-egypt.svg",
    name: 'name1',
  ),
  SectorModle(
    id: docmentIdFormLocationData(),
    image: "assets/images/commercial-international-bank-egypt.svg",
    name: 'name2',
  ),
  SectorModle(
    id: docmentIdFormLocationData(),
    image: "assets/images/commercial-international-bank-egypt.svg",
    name: 'name3',
  ),
  SectorModle(
    id: docmentIdFormLocationData(),
    image: "assets/images/commercial-international-bank-egypt.svg",
    name: 'name4',
  ),
  SectorModle(
    id: docmentIdFormLocationData(),
    image: "assets/images/commercial-international-bank-egypt.svg",
    name: 'name5',
  ),
];*/

import 'package:app/shared/components/constants.dart';

const String imageUrl =
    'https://t4.ftcdn.net/jpg/01/37/57/81/240_F_137578103_ulK9MbD9IfKACx9RZe6Rx7PAyBA9aN2K.jpg';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SectorModel {
  final String image;
  final String nameEn;
  final String nameAr;

  SectorModel({
    required this.image,
    required this.nameEn,
    required this.nameAr,
  });
}

List<SectorModel> fackSector = [
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/3812/3812158.png',
      nameEn: 'Commercial Services',
      nameAr: 'خدمات تجارية'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/1239/1239719.png',
      nameEn: 'Communications',
      nameAr: 'مجال الاتصالات'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/2760/2760970.png',
      nameEn: 'Consumer Durables',
      nameAr: 'السلع المعمرة'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/2880/2880910.png',
      nameEn: 'Consumer Non-Durables',
      nameAr: "المستهلك غير المعمرة"),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/8890/8890251.png',
      nameEn: 'Consumer Services',
      nameAr: 'خدمات المستهلك'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/10298/10298967.png',
      nameEn: 'Distribution Services',
      nameAr: 'خدمات التوزيع'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/4257/4257824.png',
      nameEn: 'Electronic Technology',
      nameAr: 'التكنولوجيا الالكترونية'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/4491/4491259.png',
      nameEn: 'Energy Minerals',
      nameAr: 'معادن الطاقة'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/781/781760.png',
      nameEn: 'Finance',
      nameAr: 'تمويل'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/4646/4646577.png',
      nameEn: 'Health Services',
      nameAr: 'خدمات صحية'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/9711/9711022.png',
      nameEn: 'Health Technology',
      nameAr: 'تكنولوجيا الصحة'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/2450/2450526.png',
      nameEn: 'Industrial Services',
      nameAr: 'خدمات صناعية'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/2875/2875878.png',
      nameEn: 'Miscellaneous',
      nameAr: 'متنوع'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/2990/2990917.png',
      nameEn: 'Non-Energy Minerals',
      nameAr: 'المعادن غير المولدة للطاقة'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/3690/3690098.png',
      nameEn: 'Process Industries',
      nameAr: 'الصناعات العملية'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/9121/9121415.png',
      nameEn: 'Producer Manufacturing',
      nameAr: 'تصنيع المنتج'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/1198/1198348.png',
      nameEn: 'Retail Trade',
      nameAr: 'تجارة التجزئة'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/870/870175.png',
      nameEn: 'Technology Services',
      nameAr: 'خدمات التكنولوجيا'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/3267/3267450.png',
      nameEn: 'Transportation',
      nameAr: 'مواصلات'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/6695/6695398.png',
      nameEn: 'Utilities',
      nameAr: 'خدمات')
];
