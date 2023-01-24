import 'package:flutter/animation.dart';

class cartlist {
  late final String title;
  late final int price;
  late final String src;
  late final String type;
  late final String id;
  late final Color colorHere;

  cartlist(
      {required this.id,
      required this.src,
      required this.title,
      required this.price,
      required this.colorHere,
      required this.type});

  static List<cartlist> cartListishere() {
    return [];
  }
}
