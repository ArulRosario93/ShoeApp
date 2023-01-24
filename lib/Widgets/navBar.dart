import 'package:flutter/material.dart';
import 'package:shoe_delivery_app/Widgets/container.dart';
import 'package:shoe_delivery_app/main.dart';

class navBar extends StatelessWidget {
  const navBar({super.key, this.handleClicked, this.lenG});

  final lenG;
  final handleClicked;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            width: 100,
            padding: const EdgeInsets.symmetric(vertical: 25),
            decoration: const BoxDecoration(
                // color: Colors.black26
                ),
            child: const Text(
              "New to Shop",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
            ),
          ),
          Container(
            width: 50,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            height: 150,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset("assets/images/image-3.jpeg"),
          ),
          ListTile(
            title: const Center(
              child: Text(
                "Shanks Air Force 1",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      // ignore: prefer_const_constructors
                      builder: (context) => shoeItem(
                          shoeName: "Shanks Air Force 1",
                          price: 21995,
                          src: "assets/images/image-3.jpeg",
                          type: "One Piece Edition",
                          lenG: lenG,
                          handleClicked: handleClicked,
                          colorHere: Colors.green)));
            },
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.amber,
          //   ),
          //   child: Text("About Developer"),
          // )
        ],
      ),
    );
  }
}
