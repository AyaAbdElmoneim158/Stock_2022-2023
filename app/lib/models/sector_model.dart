import 'package:app/shared/components/constants.dart';

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
];
