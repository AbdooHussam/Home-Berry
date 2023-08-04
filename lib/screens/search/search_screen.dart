import 'package:flutter/material.dart';
import 'package:home_berry/Animation/FadeAnimation.dart';
import 'package:home_berry/network/api.dart';
import 'package:home_berry/screens/Home/nav_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import 'search_card.dart';

class Search_Screen extends StatefulWidget {
  @override
  _Search_ScreenState createState() => _Search_ScreenState();
}

class _Search_ScreenState extends State<Search_Screen> {
  bool showSpinner = false;

  Future _future;

  Future<void> prepareData() async {
    var get_Search = Provider.of<Api>(context, listen: false);
    (get_Search.myListSearchCard.isEmpty)
        ? await get_Search.getSerchResult()
        : null;
  }

  @override
  void initState() {
    _future = prepareData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var getBuy = Provider.of<Api>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF9A537),
          centerTitle: true,
          title: Text(
            "Search ${getBuy.type} Result",
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () async {
                await getBuy.myListSearchCard.clear();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Nav_Home()));
              }),
        ),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(22),
                          topLeft: Radius.circular(22))),
                  child: (getBuy.myListSearchCard.isEmpty)
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          // padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                          itemCount: getBuy.myListSearchCard.length,
                          itemBuilder: (context, index) {
                            return getBuy.myListSearchCard[index];
                          }),
                ),
              ),
            ],
          ),
        ));
  }
}
