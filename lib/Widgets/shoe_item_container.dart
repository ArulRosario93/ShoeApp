import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';

class shoe_item_container extends StatelessWidget {
  const shoe_item_container(
      {super.key,
      required this.title,
      required this.type,
      required this.src,
      required this.price,
      this.clearList, required this.color});

  final String title;
  final String type;
  final String src;
  final int price;
  final Color color;
  final clearList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                    child: InkWell(
                  child: Icon(Icons.push_pin_outlined),
                )),
                Container(
                  width: 120,
                  height: 120,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Image.asset(src),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 3),
                        child: Text(
                          type,
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 11,
                              color: color),
                        ),
                      ),
                      Container(
                        child: Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Price",
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  child: Text(
                    "$price",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
