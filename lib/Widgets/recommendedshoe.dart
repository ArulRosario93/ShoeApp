import "package:flutter/material.dart";
import 'package:shoe_delivery_app/main.dart';

class recommendedshoe extends StatelessWidget {
  const recommendedshoe(
      {super.key, required this.title, required this.price, required this.src, required this.type, this.handleClicked, required this.colorHere, this.lenG});

  final String title;
  final int price;
  final String src;
  final String type;
  final Color colorHere;
  final handleClicked;
  final lenG;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => shoeItem(shoeName: title, type: type, price: price, src: src, handleClicked: handleClicked, colorHere: colorHere, lenG: lenG)),
        ),
      },
      child: Container(
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.topLeft,
        child: Container(
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 140,
                margin: EdgeInsets.only(right: 10),
                child: Image.asset(src),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 3)),
              Text(
                title,
                style: TextStyle(
                    color: colorHere,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Price:",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 2)),
                    Container(
                      child: Text(
                        "14999",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
