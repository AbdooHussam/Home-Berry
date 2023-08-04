import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_berry/network/api.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({
    Key key,
    this.is_favourites,
  }) : super(key: key);

  bool is_favourites;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var images = ["images/buy.png", "images/key.png", "images/rent.jpeg"];
  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    var api = Provider.of<Api>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Details",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Color(0xFF264653),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              if (widget.is_favourites == true) {
                widget.is_favourites = false;
                api.refresh();
              } else {
                await api.creatFavorite(id_CFav: api.id_details);
                widget.is_favourites = true;
              }
            },
            icon: Icon(
              widget.is_favourites ? Icons.favorite : Icons.favorite_border,
            ),
            iconSize: 33,
            color: widget.is_favourites ? Colors.red : Colors.white,
          ),
        ],
      ),
      body: Column(
        children: [
          Image.network(
            "https://worldscholarshipforum.com/wealth/wp-content/uploads/sites/4/2021/06/xBwEvf6aL0SzEXwny7ZELdS4jjMEwEsYpbUbWJe7.jpeg",
            fit: BoxFit.cover,
            height: (150 / 375.0) * MediaQuery.of(context).size.width,
            width: double.infinity,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                SizedBox(
                    height: (10 / 375.0) * MediaQuery.of(context).size.width),
                Center(
                    child: Text(
                  '${api.city_det}',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.brown),
                )),
                Center(
                    child: Text(
                  '${api.name_det}',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.deepOrange),
                )),
                SizedBox(
                    height: (10 / 375.0) * MediaQuery.of(context).size.width),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 25,
                            color: Colors.orange,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Property Location",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.orange),
                              )),
                        ],
                      ),
                    ),
                    Text("\$${api.price_det}/month",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown)),
                  ],
                ),
                Wrap(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.room_preferences_outlined,
                      size: 35,
                      color: Colors.grey,
                    ),
                    Text(
                      "${api.area_det}\m  ",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.king_bed_outlined, size: 35, color: Colors.grey),
                    Text(
                      "${api.room_det} room  ",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.bathtub_outlined, size: 35, color: Colors.grey),
                    Text(
                      "${api.bathroom_det} Bath  ",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.directions_car_outlined,
                        size: 35, color: Colors.grey),
                    Text(
                      "${api.park_det} Park",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                    height: (20 / 375.0) * MediaQuery.of(context).size.width),
                Text(
                  "Details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    height: (5 / 375.0) * MediaQuery.of(context).size.width),
                Text(
                  "${api.description_det}",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                    height: (10 / 375.0) * MediaQuery.of(context).size.width),
                Text(
                  "Nearby Services",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    height: (5 / 375.0) * MediaQuery.of(context).size.width),
                Text(
                  "-Mall of Arebia",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  "-Alwatnia Gas Station",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                    height: (10 / 375.0) * MediaQuery.of(context).size.width),
                Text(
                  "Amenities",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    height: (15 / 375.0) * MediaQuery.of(context).size.width),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.balcony,
                                size: 25,
                                color: Colors.grey,
                              ),
                              Text(
                                " Balacony",
                                style:
                                    TextStyle(fontSize: 17, color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.pool,
                                size: 25,
                                color: Colors.grey,
                              ),
                              Text(
                                " Pool",
                                style:
                                    TextStyle(fontSize: 17, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                          height:
                              (2 / 375.0) * MediaQuery.of(context).size.width),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.anchor_rounded,
                                size: 25,
                                color: Colors.grey,
                              ),
                              Text(
                                " Gym",
                                style:
                                    TextStyle(fontSize: 17, color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.air_sharp,
                                size: 25,
                                color: Colors.grey,
                              ),
                              Text(
                                " Air Conditioning",
                                style:
                                    TextStyle(fontSize: 17, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                          height:
                              (2 / 375.0) * MediaQuery.of(context).size.width),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.security,
                                size: 25,
                                color: Colors.grey,
                              ),
                              Text(
                                " Doorman",
                                style:
                                    TextStyle(fontSize: 17, color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.local_parking,
                                size: 25,
                                color: Colors.grey,
                              ),
                              Text(
                                " Parking",
                                style:
                                    TextStyle(fontSize: 17, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (builder) => Container(
                              height: (200 / 375.0) *
                                  MediaQuery.of(context).size.width,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Wrap(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Owner Name: ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        api.owner_name,
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Wrap(
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Mobile Phone: ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        "${api.owner_phone}",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Wrap(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Email: ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900),
                                      ),
                                      Text(
                                        "${api.owner_email}",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                ],
                              ),
                            ));
                  },
                  child: Text(
                    "Owner Details",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.orange),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
