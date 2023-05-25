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

const String imageUrl =
    'https://t4.ftcdn.net/jpg/01/37/57/81/240_F_137578103_ulK9MbD9IfKACx9RZe6Rx7PAyBA9aN2K.jpg';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SectorModel {
  final String image;
  final String name;
  SectorModel({
    required this.image,
    required this.name,
  });
}

List<SectorModel> fackSector = [
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/3812/3812158.png',
      name: 'Commercial Services'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/1239/1239719.png',
      name: 'Communications'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/2760/2760970.png',
      name: 'Consumer Durables'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/2880/2880910.png',
      name: 'Consumer Non-Durables'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/8890/8890251.png',
      name: 'Consumer Services'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/10298/10298967.png',
      name: 'Distribution Services'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/4257/4257824.png',
      name: 'Electronic Technology'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/4491/4491259.png',
      name: 'Energy Minerals'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/781/781760.png',
      name: 'Finance'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/4646/4646577.png',
      name: 'Health Services'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/9711/9711022.png',
      name: 'Health Technology'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/2450/2450526.png',
      name: 'Industrial Services'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/2875/2875878.png',
      name: 'Miscellaneous'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/2990/2990917.png',
      name: 'Non-Energy Minerals'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/3690/3690098.png',
      name: 'Process Industries'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/9121/9121415.png',
      name: 'Producer Manufacturing'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/1198/1198348.png',
      name: 'Retail Trade'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/870/870175.png',
      name: 'Technology Services'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/3267/3267450.png',
      name: 'Transportation'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/6695/6695398.png',
      name: 'Utilities')
];
