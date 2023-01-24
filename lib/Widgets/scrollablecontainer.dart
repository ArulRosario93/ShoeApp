import 'package:flutter/material.dart';

class scrollablecontainer extends StatelessWidget {
  const scrollablecontainer({super.key, this.changeWhenClicked, required this.colorHerENA});

  final changeWhenClicked;
  final String colorHerENA;

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.only(bottom: 3),
        child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          InkWell(
            onTap: () {
                changeWhenClicked("");
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              margin: EdgeInsets.only(top: 10, right: 15),
              decoration: BoxDecoration(
                  color: "$colorHerENA" == "All" ? Colors.black : Colors.white, borderRadius: BorderRadius.circular(15)),
                child: Text("All", style: TextStyle(color: "$colorHerENA" == "All" ? Colors.white : Colors.black, fontWeight: FontWeight.w400),),
            ),
          ),
          InkWell(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              margin: EdgeInsets.only(top: 10, right: 15),
              decoration: BoxDecoration(
                color: "$colorHerENA" == "Men's Shoe" ? Colors.black : Colors.white, borderRadius: BorderRadius.circular(15)
              ),
              child: Text("Men's Shoe", style: TextStyle(color: "$colorHerENA" == "Men's Shoe" ? Colors.white : Colors.black, fontWeight: FontWeight.w400),),
            ),
            onTap: () {
              changeWhenClicked("Men's Shoe");
            },
          ),
          InkWell(
            onTap: () {
              changeWhenClicked("Women's Shoe");
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              margin: EdgeInsets.only(top: 10, right: 15),
              decoration: BoxDecoration(
                  color: "$colorHerENA" == "Women's Shoe" ? Colors.black : Colors.white, borderRadius: BorderRadius.circular(15)
              ),child: Text("Women's Shoe", style: TextStyle(color: "$colorHerENA" == "Women's Shoe" ? Colors.white : Colors.black, fontWeight: FontWeight.w400),),
            ),
          ),
          InkWell(
            onTap: () {
              changeWhenClicked("One");
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              margin: EdgeInsets.only(top: 10, right: 15),
              decoration: BoxDecoration(
                  color: "$colorHerENA" == "One Piece Edition" ? Colors.black : Colors.white, borderRadius: BorderRadius.circular(15)),
                child: Text("One Piece Edition", style: TextStyle(color: "$colorHerENA" == "One Piece Edition" ? Colors.white : Colors.black, fontWeight: FontWeight.w400),),
            ),
          ),
          // InkWell(
          //   onTap: () {
          //     changeWhenClicked("Men's Shoe");
          //   },
          //   child: Container(
          //     padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
          //     margin: EdgeInsets.only(top: 10, right: 15),
          //     decoration: BoxDecoration(
          //         color: Colors.white, borderRadius: BorderRadius.circular(15)),
          //       child: Text("Limited Edition"),
          //   ),
          // ),
        ],
      ),
    ));
  }
}
