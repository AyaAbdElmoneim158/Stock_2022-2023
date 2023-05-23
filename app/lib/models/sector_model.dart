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
  SectorModel(image: imageUrl, name: 'Consumer Non-Durables'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/8890/8890251.png',
      name: 'Consumer Services'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/10298/10298967.png',
      name: 'Distribution Services'),
  SectorModel(
      image: 'https://cdn-icons-png.flaticon.com/128/4257/4257824.png',
      name: 'Electronic Technology'),
  SectorModel(image: imageUrl, name: 'Energy Minerals'),
  SectorModel(image: imageUrl, name: 'Finance'),
  SectorModel(image: imageUrl, name: 'Health Services'),
  SectorModel(image: imageUrl, name: 'Health Technology'),
  SectorModel(image: imageUrl, name: 'Industrial Services'),
  SectorModel(image: imageUrl, name: 'Miscellaneous'),
  SectorModel(image: imageUrl, name: 'Non-Energy Minerals'),
  SectorModel(image: imageUrl, name: 'Process Industries'),
  SectorModel(image: imageUrl, name: 'Producer Manufacturing'),
  SectorModel(image: imageUrl, name: 'Retail Trade'),
  SectorModel(image: imageUrl, name: 'Technology Services'),
  SectorModel(image: imageUrl, name: 'Transportation'),
  SectorModel(image: imageUrl, name: 'Utilities')
];
