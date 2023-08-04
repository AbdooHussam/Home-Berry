import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class HomeCards1 extends StatelessWidget {
  HomeCards1(
      {this.name = "slalah",
      this.image,
      this.id = "0",
      this.city = "cairo",
      this.devolper = "hh"});

  final String name;
  final String city;
  final String devolper;
  final String image;
  final String id;

  // void init(BuildContext context) {
  //   double screenWidth = MediaQuery.of(context).size.width;
  //   double screenHeight = MediaQuery.of(context).size.height;
  //   Orientation orientation = MediaQuery.of(context).orientation;
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: (20 / 375.0) * MediaQuery.of(context).size.width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: (260 / 375.0) * MediaQuery.of(context).size.width,
              // height: (190 / 375.0) * MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Image.network(
                      "https://a7b.cc/wp-content/uploads/2018/05/5801.jpg",
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF343434).withOpacity(0.4),
                            Color(0xFF343434).withOpacity(0.15),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: (10 / 375.0) *
                                MediaQuery.of(context).size.width,
                            vertical: (10 / 375.0) *
                                MediaQuery.of(context).size.width,
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.verified_user_rounded,
                                      size: 18,
                                    ),
                                    Text(
                                      " Verified",
                                      style: TextStyle(
                                        fontSize: (16 / 375.0) *
                                            MediaQuery.of(context).size.width,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: (90 / 375.0) *
                                    MediaQuery.of(context).size.width,
                              ),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  "90m - 200m",
                                  style: TextStyle(
                                    fontSize: (15 / 375.0) *
                                        MediaQuery.of(context).size.width,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: (260 / 375.0) * MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(4)),
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      city,
                      style: TextStyle(
                        fontSize:
                            (17 / 375.0) * MediaQuery.of(context).size.width,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "Starts From",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize:
                            (13 / 375.0) * MediaQuery.of(context).size.width,
                      ),
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
                SizedBox(
                  width: (15 / 375.0) * MediaQuery.of(context).size.width,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "name",
                      style: TextStyle(
                          fontSize:
                              (15 / 375.0) * MediaQuery.of(context).size.width,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    Text(
                      "800,000",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize:
                            (17 / 375.0) * MediaQuery.of(context).size.width,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: (260 / 375.0) * MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF343434), onPrimary: Color(0xFFDD9D40)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Know More",
                    style: TextStyle(fontSize: 25),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class HomeCards2 extends StatelessWidget {
  HomeCards2({
    this.name = "slalah",
    this.image,
    this.id = "0",
    this.name_gov = "cairo",
  });

  final String name;
  final String name_gov;
  final String image;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: (20 / 375.0) * MediaQuery.of(context).size.width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: (250 / 375.0) * MediaQuery.of(context).size.width,
              height: (150 / 375.0) * MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "https://phoneky.co.uk/thumbs/wallpapers/p2ls/nature/45/b9f51e7e12914066.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            width: (250 / 375.0) * MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(4)),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name_gov,
                  style: TextStyle(
                    fontSize: (17 / 375.0) * MediaQuery.of(context).size.width,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  width: (15 / 375.0) * MediaQuery.of(context).size.width,
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontSize:
                          (15 / 375.0) * MediaQuery.of(context).size.width,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(
            width: (250 / 375.0) * MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF343434), onPrimary: Color(0xFFDD9D40)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    name_gov,
                    style: TextStyle(fontSize: 25),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class HomeCards3 extends StatelessWidget {
  HomeCards3(
      {Key key,
      this.name = "slalah",
      this.image,
      this.id = "0",
      this.city = "cairo",
      this.price,
      this.is_favourites = false,
      this.views,
      this.area})
      : super(key: key);

  final String name;
  final String city;
  final String price;
  final String views;
  final String image;
  final String id;
  final String area;
  final bool is_favourites;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: (20 / 375.0) * MediaQuery.of(context).size.width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: (260 / 375.0) * MediaQuery.of(context).size.width,
              // height: (190 / 375.0) * MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Image.network(
                      "https://i.pinimg.com/originals/db/e2/af/dbe2af4e2d0c8b5724f920009d275b90.jpg",
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF343434).withOpacity(0.4),
                            Color(0xFF343434).withOpacity(0.15),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: (10 / 375.0) *
                                MediaQuery.of(context).size.width,
                            vertical: (10 / 375.0) *
                                MediaQuery.of(context).size.width,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.verified_user_rounded,
                                          size: 18,
                                        ),
                                        Text(
                                          " Verified",
                                          style: TextStyle(
                                            fontSize: (16 / 375.0) *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.remove_red_eye,
                                          size: 18,
                                        ),
                                        Text(
                                          views,
                                          style: TextStyle(
                                            fontSize: (16 / 375.0) *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: (82 / 375.0) *
                                    MediaQuery.of(context).size.width,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      "$area m",
                                      style: TextStyle(
                                        fontSize: (15 / 375.0) *
                                            MediaQuery.of(context).size.width,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      is_favourites
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                    ),
                                    iconSize: 33,
                                    color: is_favourites
                                        ? Colors.red
                                        : Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: (260 / 375.0) * MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(4)),
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      city,
                      style: TextStyle(
                        fontSize:
                            (17 / 375.0) * MediaQuery.of(context).size.width,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize:
                            (13 / 375.0) * MediaQuery.of(context).size.width,
                      ),
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
                SizedBox(
                  width: (15 / 375.0) * MediaQuery.of(context).size.width,
                ),
                Text(
                  "$price \$",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: (17 / 375.0) * MediaQuery.of(context).size.width,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          SizedBox(
            width: (260 / 375.0) * MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF343434), onPrimary: Color(0xFFDD9D40)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Know More",
                    style: TextStyle(fontSize: 25),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
