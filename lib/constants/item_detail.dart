import 'package:cross_file/cross_file.dart';

class ItemDetails {
  ItemDetails({
    required this.itemType,
    required this.itemWeight,
    this.itemImages,
    this.dateSubmitted,
  });
  final String itemType;
  final String itemWeight;
  final String? dateSubmitted;
  final List<XFile>? itemImages;
}