import 'dart:ui';

import 'package:flutter/material.dart';

class placeorderContainer extends StatelessWidget {
  const placeorderContainer({super.key, required this.title, required this.type, required this.price, required this.src, required this.colorHere});

  final String title;
  final String type;
  final int price;
  final Color colorHere;
  final String src;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          //products Appears Here
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                alignment: Alignment.center,
                                child: Icon(Icons.point_of_sale_rounded)),
                            Container(
                              width: 120,
                              height: 120,
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              child: Image.asset(src)),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          title,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w800,
                                              letterSpacing: 0,
                                              fontSize: 14),
                                        ),
                                      ],
                                    )
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 3),
                                    child: Text(
                                      type,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: colorHere,
                                          fontSize: 13),
                                    ),
                                  ),
                                  Container(
                                    child: Text("Quantity: 01"),
                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text("$price", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                            ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[300],
          )
        ],
      ),
    );
  }
}
