import 'package:flutter/material.dart';

class Shoeschema {
  final String type;
  final String title;
  final String src;
  final int price;
  final String id;
  final Color colorHere;

  const Shoeschema(
      {required this.type,
      required this.colorHere, 
      required this.title,
      required this.src,
      required this.price,
      required this.id, 
});
}