import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_berry/network/api.dart';
import 'package:home_berry/screens/Details/details_screen.dart';
import 'package:provider/provider.dart';

class BuyCard extends StatelessWidget {
  BuyCard(
      {Key key,
      this.bathroom = "5",
      this.room = "4",
      this.area = "233",
      this.city = "cairo",
      this.price = "123",
      this.is_favourites = false,
      this.id})
      : super(key: key);

  final String id;
  final String price;
  final String city;
  final String area;
  final String room;
  final String bathroom;
  bool is_favourites;

  @override
  Widget build(BuildContext context) {
    var api = Provider.of<Api>(context);
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
      ),
      child: Card(
        elevation: 20,
        color: Colors.white60,
        margin: EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 1, top: 5, right: 5),
          child: Row(
            children: [
              Flexible(
                child: Image.network(
                  "https://www.aqar-jerash.com/image/catalog/28/1605595308_28.jpeg",
                  fit: BoxFit.cover,
                  height: (155 / 375.0) * MediaQuery.of(context).size.width,
                ),
              ),
              SizedBox(
                width: (7 / 375.0) * MediaQuery.of(context).size.width,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "\$$price/month",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: (30 / 375.0) * MediaQuery.of(context).size.width,
                      ),
                      Icon(Icons.add_circle_outline_sharp),
                      IconButton(
                        onPressed: () async {
                          if (is_favourites == true) {
                            is_favourites = false;
                            api.refresh();
                          } else {
                            await api.creatFavorite(id_CFav: id);
                            is_favourites=true;
                          }
                        },
                        icon: Icon(
                          is_favourites
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                        iconSize: 33,
                        color: is_favourites ? Colors.red : Colors.black,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text(
                        "  $city",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.room_preferences_outlined),
                      Text(
                        "$area\m ",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Icon(Icons.king_bed_outlined),
                      Text(" $room room "),
                      Icon(Icons.bathtub_outlined),
                      Text(" $bathroom Bath "),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        api.id_details = id;
                        await api.getDetailsProperties();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScreen(is_favourites:
                                  is_favourites,)));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFDD9D40),
                          onPrimary: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: (48 / 375.0) *
                                MediaQuery.of(context).size.width),
                        child: Text(
                          "Details",
                          style: TextStyle(fontSize: 25),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
