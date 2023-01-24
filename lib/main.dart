// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:shoe_delivery_app/Shoe_schema.dart';
import 'package:shoe_delivery_app/Widgets/container.dart';
import 'package:shoe_delivery_app/Widgets/navBar.dart';
import 'package:shoe_delivery_app/Widgets/newreleasecontanier.dart';
import 'package:shoe_delivery_app/Widgets/placeorderContainer.dart';
import 'package:shoe_delivery_app/Widgets/recommendedshoe.dart';
import 'package:shoe_delivery_app/Widgets/scrollablecontainer.dart';
import 'package:shoe_delivery_app/Widgets/shoe_item_container.dart';
import 'package:shoe_delivery_app/shoe_container.dart';
import 'package:shoe_delivery_app/src/personaldetail.dart';
import '././src/cartlistschema.dart';
import 'package:collection/collection.dart';

void main() {
  // runApp(const MyApp());
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final cartList = cartlist.cartListishere();

  List<Shoeschema> conatinerIT = shoe_container;

  late var colorWhat = "All";

  List<Shoeschema> _searchedList = [];

  @override
  void initState() {
    _searchedList = shoe_container;
    super.initState();
  }

  final detail = personaldetail.fullDetail();

  @override
  Widget build(BuildContext context) {
    List<int> stringHere2 = [];

    for (cartlist list in cartList) {
      var listPrice = list.price;

      stringHere2.add(listPrice);
    }

    var lenG = cartList.length;
    // var totalPrice =
    //     stringHere2.fold(0, (previous, current) => previous + current);

    var priceNow = stringHere2.sum;

    // if (stringHere2.length > 1) {
    //   for (var i = 0; i < stringHere2.length; i++) {
    //     totalPrice += stringHere2[i];
    //   }
    // }

    // print(45999 + 5000);
    // print("$priceNow NOw whta");

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        // leading: InkWell(
        //   child: Icon(
        //     Icons.menu_book_sharp,
        //     size: 22,
        //     color: Colors.black,
        //   ),
        //   onTap: () {
        //     if (_endDrawerKey.currentState != null && _endDrawerOpened.value) {
        //         _endDrawerKey.currentState!.close();
        //       }
        //       _drawerKey.currentState?.open();
        //   },
        // ),
        elevation: 0.0,
        actions: [
          Container(
              padding: EdgeInsets.only(right: 15, top: 10),
              child: InkWell(
                child: Badge(
                  badgeContent: Text("$lenG"),
                  child: Icon(Icons.cabin_sharp),
                ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => cartlisthere(
                            listvechiko: cartList,
                            whenClicked: "",
                            handleDetail: _handleAddDetail,
                            detail: detail,
                            totalPrice: priceNow,
                            clearList: _clearItem,
                            lenG: lenG)),
                  )
                },
              ))
        ],
      ),
      drawer: navBar(handleClicked: _handleClicked),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                conatinernewrealease(
                  handleClicked: _handleClicked,
                ),
                scrollablecontainer(
                    changeWhenClicked: _changeWhenClicked,
                    colorHerENA: colorWhat),
                Expanded(
                  child: GridView(
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    children: _searchedList
                        .map((shoeItem) => container(
                              price: shoeItem.price,
                              src: shoeItem.src,
                              title: shoeItem.title,
                              type: shoeItem.type,
                              id: shoeItem.id,
                              colorHere: shoeItem.colorHere,
                              lenG: lenG,
                              handleClicked: _handleClicked,
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   padding: EdgeInsets.symmetric(vertical: 15),
          // )
        ],
      ),
    );
  }

  void _handleClicked(String id, String src, String title, int price,
      String type, Color colorHere) {
    setState(() {
      cartList.add(cartlist(
          id: id,
          src: src,
          title: title,
          price: price,
          type: type,
          colorHere: colorHere));
    });
  }

  void _changeWhenClicked(String text) {
    List<Shoeschema> result = shoe_container;

    if (text == "") {
      result = shoe_container.where((item) => item.type.contains("")).toList();
      colorWhat = "All";
    }
    if (text == "Men's Shoe") {
      result =
          shoe_container.where((item) => item.type.contains("Men's")).toList();
      colorWhat = "Men's Shoe";
    }
    if (text == "Women's Shoe") {
      result = shoe_container
          .where((item) => item.type.contains("Women's"))
          .toList();
      colorWhat = "Women's Shoe";
    }
    if (text == "One") {
      result =
          shoe_container.where((item) => item.type.contains("One")).toList();
      colorWhat = "One Piece Edition";
    }
    setState(() {
      _searchedList = result;
    });
  }

  void _clearItem(String src) {
    setState(() {
      cartList.removeWhere((item) => item.src == src);
    });
  }

  void _handleAddDetail(String name, String email, String address, String id) {
    setState(() {
      detail.add(personaldetail(
          address: address, email: email, fullname: name, id: id));
    });
  }
}

class address_screen extends StatelessWidget {
  address_screen(
      {super.key,
      this.handleDetail,
      this.detail,
      this.listvechiko,
      this.TotalPrice,
      this.totalPrice,
      this.clearList});

  final handleDetail;
  final detail;
  final listvechiko;
  final TotalPrice;
  final totalPrice;
  final clearList;

  TextEditingController fullName = new TextEditingController();

  TextEditingController _address = new TextEditingController();

  TextEditingController _emailHere = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var name;

    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          leading: InkWell(
            child: const Icon(
              Icons.arrow_back_rounded,
              size: 14,
                color: Colors.indigoAccent,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            "Address Form",
            style: TextStyle(
                color: Colors.indigoAccent,
                fontSize: 13,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 250,
                height: 80,
                padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.center,
                child: TextField(
                  controller: fullName,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    hintText: "Your Name",
                    helperText: "Not the movie. Enter your actual Name.",
                  ),
                ),
              ),
              Container(
                width: 250,
                height: 80,
                padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.center,
                child: TextField(
                  controller: _emailHere,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "E-Mail Address",
                    helperText: "example@gmail.com",
                  ),
                ),
              ),
              Container(
                width: 250,
                height: 80,
                padding: EdgeInsets.symmetric(vertical: 10),
                margin: EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.center,
                child: TextField(
                  controller: _address,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                      hintText: "Delivery Address",
                      suffixIcon: Icon(Icons.location_pin)),
                ),
              ),
              InkWell(
                overlayColor: null,
                child: Container(
                width: 250,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 25, bottom: 45),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 45),
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(7)),
                child: Text(
                        "Place Order",
                        style: TextStyle(color: Colors.white),
                      ),
              ),
                onTap: () {
                   var nameFull = fullName.text;
                      var email = _emailHere.text;
                      var address = _address.text;

                      handleDetail(nameFull, email, address, "01");

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => placedorder(
                                  detail: detail,
                                  listvechiko: listvechiko,
                                  totalPrice: totalPrice,
                                )));
                },
              ),
            ],
          ),
        ));
  }
}

class cartlisthere extends StatelessWidget {
  cartlisthere(
      {super.key,
      this.listvechiko,
      this.whenClicked,
      this.handleDetail,
      this.detail,
      this.TotalPrice,
      this.totalPrice, this.clearList, this.lenG});

  final lenG;
  final listvechiko;
  final whenClicked;
  final handleDetail;
  final detail;
  final TotalPrice;
  final totalPrice;
  final clearList;

  // int total;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Cart",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 13),
          ),
          leading: InkWell(
            child: Icon(
              Icons.arrow_back_rounded,
              size: 18,
              color: Colors.black,
            ),
            onTap: (() {
              Navigator.pop(context);
            }),
          ),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Column(

                      

                      children: [
                        // print(object)

                        if (listvechiko.length <= 0) ...[
                          Center(
                              child: InkWell(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 25),
                              decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text("Nothing Here"),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          )),
                        ] else if (listvechiko.length > 0) ...[
                          for (cartlist list in listvechiko)
                            shoe_item_container(
                              price: list.price,
                              title: list.title,
                              type: list.type,
                              src: list.src,
                              color: list.colorHere,
                              clearList: clearList,
                            ),
                            // Divider(
                            //   color: Colors.grey,
                            // ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 35),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child:Text("Total:")
                                  ),
                                  Container(
                                    child: Text("$totalPrice", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                                  )
                                ]
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            InkWell(
                              child: Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              padding: EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 100),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                  "GO TO FILL ADDRESS",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),),
                              onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => address_screen(
                                                handleDetail: handleDetail,
                                                detail: detail,
                                                listvechiko: listvechiko,
                                                TotalPrice: TotalPrice,
                                                totalPrice: totalPrice,
                                                clearList:clearList,
                                              )));
                                },
                            ),
                        ],
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}

class shoeItem extends StatefulWidget {
  const shoeItem({
    super.key,
    required this.shoeName,
    required this.price,
    required this.src,
    required this.type,
    this.handleClicked,
    required this.colorHere,
    required this.lenG,
  });

  final String shoeName;
  final int price;
  final lenG;
  final String type;
  final String src;
  final Color colorHere;
  final handleClicked;

  @override
  State<shoeItem> createState() => _shoeItemState();
}

class _shoeItemState extends State<shoeItem> {
  final cartList = cartlist.cartListishere();
  @override
  Widget build(BuildContext context) {
  var fafap = cartList.length;
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text(
            widget.type,
            style: TextStyle(
              color: widget.colorHere,
              fontSize: 14,
              fontWeight: FontWeight.w900,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[100],
          elevation: 0.0,
          leading: InkWell(
            child: Icon(
              Icons.arrow_back_rounded,
              size: 18,
              color: Colors.black,
            ),
            onTap: (() {
              Navigator.pop(context);
            }),
          ),
        ),
        body: Stack(
          children: [
            Container(
                // margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(color: Colors.grey[100]),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 250,
                            alignment: Alignment.center,
                            child: Image.asset(widget.src),
                          ),
                          Container(
                            width: 490,
                            padding: EdgeInsets.symmetric(
                                vertical: 30, horizontal: 30),
                            margin: EdgeInsets.only(top: 55),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.shoeName,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      wordSpacing: 2,
                                      letterSpacing: 0),
                                ),
                                Padding(padding: EdgeInsets.only(top: 12)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Icon(
                                        Icons.star_border_outlined,
                                        size: 17,
                                      ),
                                      margin: EdgeInsets.only(right: 4),
                                    ),
                                    Container(
                                      child: Text(
                                        "5.0",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      margin: EdgeInsets.only(right: 4),
                                    ),
                                    Container(
                                      child: Text(
                                        "(1120 Reviews)",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w100),
                                      ),
                                      margin: EdgeInsets.only(right: 4),
                                    ),
                                  ],
                                ),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                Text(
                                  "'The following npm package, @mui/icons-material, includes the 2,100+ official Material Icons converted to SvgIcon...",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Padding(padding: EdgeInsets.only(top: 15)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Size :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 7),
                                            child: Text(
                                              "EU",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 7),
                                            child: Text("US"),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 7),
                                            child: Text("UK"),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Padding(padding: EdgeInsets.only(top: 18)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: Colors.grey.shade100,
                                              width: 1)),
                                      child: Text("40"),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: Colors.grey.shade100,
                                              width: 1)),
                                      child: Text("41"),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          // color: Colors.redAccent,
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                widget.colorHere,
                                                widget.colorHere,
                                                widget.colorHere,
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: Colors.grey.shade100,
                                              width: 1)),
                                      child: Text(
                                        "42",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: Colors.grey.shade100,
                                              width: 1)),
                                      child: Text("43"),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: Colors.grey.shade100,
                                              width: 1)),
                                      child: Text("44"),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: Colors.grey.shade100,
                                              width: 1)),
                                      child: Text("45"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Price",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                115, 255, 255, 255),
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        "${widget.price}",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 18, horizontal: 35),
                                  decoration: BoxDecoration(
                                      color: widget.colorHere,
                                      borderRadius: BorderRadius.circular(40)),
                                  child: InkWell(
                                    child: Text(
                                      "Add to Bag",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    onTap: () {
                                      widget.handleClicked(
                                          DateTime.now()
                                              .millisecondsSinceEpoch
                                              .toString(),
                                          widget.src,
                                          widget.shoeName,
                                          widget.price,
                                          widget.type,
                                          widget.colorHere);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 25)),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration:
                                BoxDecoration(color: Colors.grey.shade100),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      EdgeInsets.only(left: 12, bottom: 10),
                                  child: Text(
                                    "Recommended Shoes: ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18),
                                  ),
                                ),
                                Container(
                                  width: 500,
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  //Recommended starts HERE
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: shoe_container
                                          .map((shoeItem) => recommendedshoe(
                                              price: shoeItem.price,
                                              src: shoeItem.src,
                                              title: shoeItem.title,
                                              type: shoeItem.type,
                                              handleClicked:
                                                  widget.handleClicked,
                                              colorHere: shoeItem.colorHere))
                                          .toList(),
                                    ),
                                  ),
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(top: 10)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ));
  }
}

class placedorder extends StatelessWidget {
  placedorder(
      {super.key, required this.detail, this.listvechiko, this.totalPrice});

  final detail;
  final listvechiko;
  final totalPrice;

  @override
  Widget build(BuildContext context) {
    var next = detail[0].fullname;
    print("$next here is it");
    var price;

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "Order Placed",
            style: TextStyle(
                color: Colors.black, fontSize: 13, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          leading: InkWell(
            child: Icon(
              Icons.arrow_back,
              size: 13,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            child: Stack(
              children: [
                ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 25, bottom: 25, left: 10, right: 10),
                            alignment: Alignment.center,
                            width: 255.0,
                            height: 255.0,
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            child: Image.network(
                                "https://media.tenor.com/Hw7f-4l0zgEAAAAC/check-green.gif"),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(vertical: 18),
                            child: Text(
                              "Products",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                          ),

                          for (cartlist list in listvechiko)
                            placeorderContainer(
                              title: list.title,
                              src: list.src,
                              type: list.type,
                              price: list.price,
                              colorHere: list.colorHere,
                            ),

                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 25, horizontal: 35),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(child: Text("Total:")),
                                  Container(
                                    child: Text(
                                      "$totalPrice",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ]),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            width: 350,
                            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                            decoration: BoxDecoration(
                              // color: Colors.black26,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: EdgeInsets.symmetric(vertical: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hey $next!",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                      color: Color.fromARGB(232, 0, 0, 0)),
                                ),Text(
                                  "Thank you for Shoping.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 73, 73, 73)),
                                ),
                              ],
                            )
                          ),
                          Container(
                            width: 300,
                            alignment: Alignment.center,
                            child: Text(
                              "Just in case, if you Ordered these items for fun",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            width: 250,
                            height: 250,
                            child: Image.asset("assets/images/high-man.jpeg"),
                          ),

                          // for (cartlist list in listvechiko)
                          //     price = list.price + price,
                          // Container(
                          //   alignment: Alignment.centerLeft,
                          //   margin: EdgeInsets.only(left: 10),
                          //   child: Text(
                          //     "Just in case, if you Ordered these items for fun",
                          //     style: TextStyle(
                          //         fontSize: 19,
                          //         fontWeight: FontWeight.w800,
                          //         color: Colors.black),
                          //   ),
                          // ),
                          // Container(
                          //   margin: EdgeInsets.symmetric(
                          //       horizontal: 10, vertical: 15),
                          //   width: 250,
                          //   height: 250,
                          //   child: Image.asset("assets/images/high-man.jpeg"),
                          // ),

                          // Container(
                          //   child: InkWell(
                          //     child: Icon(Icons.face_outlined),
                          //     onTap: () {
                          //       TotalPrice();
                          //     },
                          //   ),
                          // )
                        ],
                      ),
                    )
                  ],
                )
              ],
            )));
  }
}