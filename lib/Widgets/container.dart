import "package:flutter/material.dart";
import 'package:shoe_delivery_app/main.dart';

class container extends StatelessWidget {
  final String type;
  final String title;
  final String src;
  final int price;
  final String id;
  final int lenG;

  final Color colorHere;
  final handleClicked;

  const container(
      {super.key,
      required this.type,
      required this.src,
      required this.title,
      required this.price,
      required this.lenG,
      required this.handleClicked,
      required this.id, required this.colorHere});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => shoeItem(
                  shoeName: title,
                  type: type,
                  price: price,
                  src: src,
                  colorHere: colorHere,
                  lenG: lenG,
                  handleClicked: handleClicked)),
        ),
      },
      child: Container(
        // alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image.asset(src),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.only(bottom: 6,),
                    child: Text(
                      type,
                      style: TextStyle(
                          color: colorHere,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "$price",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      handleClicked(
                        DateTime.now().millisecondsSinceEpoch.toString(),
                        src,
                        title,
                        price,
                        type,
                        colorHere
                      );
                    },
                    child: Container(
                        child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                        ),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
