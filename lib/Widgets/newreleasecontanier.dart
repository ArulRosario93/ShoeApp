import "package:flutter/material.dart";
import 'package:shoe_delivery_app/main.dart';

class conatinernewrealease extends StatelessWidget {
  const conatinernewrealease({super.key, this.handleClicked, this.lenG});

  final handleClicked;
  final lenG;

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      width: 500,
      height: 150,
      margin: const EdgeInsets.only(bottom: 20, top: 10),
      // constraints: BoxConstraints(minWidth: 100, maxWidth: 250),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              offset: Offset(4.0, 4.0),
              blurRadius: 25.0,
              spreadRadius: 1.0,
              color: Colors.grey,
            ),
            BoxShadow(
              offset: Offset(-4.0, -4.0),
              blurRadius: 25.0,
              spreadRadius: 1.0,
              color: Colors.white,
            )
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "New Release",
                  style: TextStyle(
                      color: Colors.black45, fontSize: 10, letterSpacing: 2),
                ),
                const Text(
                  "Nike Air",
                  style: TextStyle(
                      color: Colors.black87,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w900,
                      fontSize: 23),
                ),
                const Text(
                  "Max 90",
                  style: TextStyle(
                    color: Colors.black87,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w900,
                    fontSize: 23,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 7),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    // : Colors.black87,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      child: const Text(
                        "Shop Now",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            fontSize: 13),
                      ),
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => shoeItem(
                                colorHere: Colors.redAccent,
                                  shoeName: "Nike Air Max 90",
                                  type: "Men's Shoe",
                                  price: 14995,
                                  src:"assets/images/nikecourt-zoom-nxt.jpeg",
                                  handleClicked: handleClicked,
                                  lenG: lenG,
                          )),
                    )},
                    ))
              ],
            ),
          ),
          Container(
            width: 200,
            // decoration: BoxDecoration(color: Colors.blue),
            child: Image.network(
                "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/6514ee68-6743-4fa7-a43d-b501934e90d3/air-force-1-07-shoe-NMmm1B.png"),
          )
        ],
      ),
    );
  }
}