import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:home_berry/screens/Home/home_cards1.dart';
import 'package:home_berry/screens/search/search_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Api extends ChangeNotifier {
  String name, last_name, phone, email, pass;
  String status_reg = "",
      message_reg = "",
      message_login = "",
      status_login = "",
      message_vrification = "",
      status_vrification = "",
      access_token = "";

  String type = "buy";
  int lenth1 = 0, lenth2 = 0, lenth3 = 0;

  List<HomeCards1> myListCard1 = [];
  List<HomeCards2> myListCard2 = [];
  List<HomeCards3> myListCard3 = [];
  List<BuyCard> myListSearchCard = [];
  List<BuyCard> myListFavoriteCard = [];

  String id_details;

  String name_det,
      description_det,
      price_det,
      city_det,
      area_det,
      room_det,
      bathroom_det,
      park_det;
  String owner_name, owner_phone, owner_email;
  bool is_favourites_details = false;

  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount _user;

  GoogleSignInAccount get user => _user;

  Future signUpEmailVerification() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  getAccess() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String access = prefs.getString("access_token");
    (access == null) ? null : access_token = access;
    notifyListeners();
  }

  login() async {
    String url = 'https://berry.parfaih.com/api/v1/login';
    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; char=UTF-8',
      },
      body: jsonEncode(
        {
          'email': email,
          'password': pass,
        },
      ),
    );

    var body = jsonDecode(response.body);
    status_login = await body["status"].toString();
    print(status_login);
    message_login = await body["message"];
    print(message_login);
    notifyListeners();
    if (response.statusCode == 200) {
      print('Success =200 ********************');
      //  print(body);

      if (status_login == '1') {
        print(body["data"]);
        access_token = body["data"]["access_token"];
        name= body["data"]["name"];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setString("last_name", body2["data"]["last_name"]);
        // prefs.setString("mobile", body2["data"]["mobile"]);
        // prefs.setString("email", body2["data"]["email"]);
        prefs.setString("access_token", access_token);
        print('Success Login ********************');
      }
    } else {
      print('failed == 400 ******************');
    }
    notifyListeners();
  }

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }
  }

  Future logeut() async {
    try {
      await googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  register() async {
    String url = 'https://berry.parfaih.com/api/v1/register';
    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; char=UTF-8',
      },
      body: jsonEncode(
        {
          'name': name,
          'last_name': last_name,
          'email': email,
          'mobile': phone,
          'password': pass,
        },
      ),
    );

    var body = jsonDecode(response.body);
    status_reg = await body["status"].toString();
    print(status_reg);
    message_reg = await body["message"];
    print(message_reg);
    notifyListeners();

    if (response.statusCode == 200) {
      print('Success =200 ********************');
      print(body);
      if (status_reg == '1') {
        String url = 'https://berry.parfaih.com/api/v1/resend/1/$phone';
        http.Response response2 = await http.post(
          Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; char=UTF-8',
          },
        );
        var body2 = jsonDecode(response.body);
        print(body2["status"]);
        print(body2["message"]);

        if (body2["status"] == 1) {
          print('Success Auth ********************');
        } else {
          print('Failed Auth ********************');
        }
      }
      ;
    } else {
      print('failed == 400 ******************');
    }
  }

  verification() async {
    String url =
        'https://berry.parfaih.com/api/v1/verify-code/1/${int.parse(phone)}';
    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; char=UTF-8',
      },
      body: jsonEncode(
        {
          'verification_code': 44444,
        },
      ),
    );
    var body2 = jsonDecode(response.body);
    message_vrification = body2["message"];
    status_vrification = body2["status"].toString();
    print(message_vrification);

    notifyListeners();
    if (status_vrification == '1') {
      print(body2["data"]);
      access_token = body2["data"]["access_token"];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString("name", body2["data"]["name"]);
      // prefs.setString("last_name", body2["data"]["last_name"]);
      // prefs.setString("mobile", body2["data"]["mobile"]);
      // prefs.setString("email", body2["data"]["email"]);
      prefs.setString("access_token", access_token);

      print('Success == 200 Verification ********************');
    } else {
      print('failed == 400 Verification******************');
    }
  }

  getHome1() async {
    String name = "", city = "", devolper = "", image = "", id = "";

    String url = 'https://berry.parfaih.com/api/v1/home';
    http.Response response = await http.get(Uri.parse(url));
    var body = json.decode(response.body);
    lenth1 = body['data']["projects"].length;
    for (int i = 0; i < lenth1; i++) {
      id = body['data']["projects"][i]['id'].toString();
      name = body['data']["projects"][i]['name'];
      city = body['data']["projects"][i]['city'];
      name = body['data']["projects"][i]['devolper'];
      image = body['data']["projects"][i]['image'];

      myListCard1.add(HomeCards1(
        city: city,
        devolper: devolper,
        id: id,
        image: image,
        name: name,
      ));
    }
    notifyListeners();
  }


  getHome2() async {
    String name = "", name_gov = "", image = "", id = "";

    String url = 'https://berry.parfaih.com/api/v1/home';
    http.Response response = await http.get(Uri.parse(url));
    var body = json.decode(response.body);
    lenth2 = body['data']["cities"].length;
    for (int i = 0; i < lenth2; i++) {
      id = body['data']["cities"][i]['id'].toString();
      name = body['data']["cities"][i]['name'];
      name_gov = body['data']["cities"][i]['governorate']['name'];
      image = body['data']["cities"][i]['image'].toString();

      myListCard2.add(HomeCards2(
        name: name,
        image: image,
        id: id,
        name_gov: name_gov,
      ));
    }
    notifyListeners();
  }


  getHome3() async {
    String name = "",
        city = "",
        price = "",
        views = "",
        image = "",
        id = "",
        area = "";
    bool is_favourites = false;

    String url = 'https://berry.parfaih.com/api/v1/home';
    http.Response response = await http.get(Uri.parse(url));
    var body = json.decode(response.body);
    lenth3 = body['data']["properties"].length;
    for (int i = 0; i < lenth3; i++) {
      id = body['data']["properties"][i]['id'].toString();
      name = body['data']["properties"][i]['name'];
      city = body['data']["properties"][i]['city'];
      image = body['data']["properties"][i]['image'].toString();
      price = body['data']["properties"][i]['price'].toString();
      views = body['data']["properties"][i]['views'].toString();
      area = body['data']["properties"][i]['area'].toString();
      is_favourites = body['data']["properties"][i]['is_favourites'];

      myListCard3.add(HomeCards3(
        id: id,
        image: image,
        name: name,
        city: city,
        area: area,
        is_favourites: is_favourites,
        price: price,
        views: views,
      ));
    }
    notifyListeners();
  }

  // emptyList3() {
  //   getHome3();
  //   return Center(child: CircularProgressIndicator());
  // }

  getSerchResult() async {
    String url = 'https://berry.parfaih.com/api/v1/get-progerties-by-type';
    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; char=UTF-8',
      },
      body: jsonEncode(
        {
          'type': type,
        },
      ),
    );

    var body = jsonDecode(response.body);

    String status_buy = await body["status"].toString();

    if (status_buy == "1") {
      String id, price, city, area, room, bathroom;
      bool is_favourites;
      for (int i = 0; i < body['data'].length; i++) {
        id = body['data'][i]['id'].toString();
        price = body['data'][i]['price'].toString();
        city = body['data'][i]['city'];
        area = body['data'][i]['area'].toString();
        room = body['data'][i]['room'].toString();
        bathroom = body['data'][i]['bathroom'].toString();
        is_favourites = body['data'][i]['is_favourites'];

        await myListSearchCard.add(BuyCard(
          price: price,
          is_favourites: is_favourites,
          area: area,
          city: city,
          id: id,
          bathroom: bathroom,
          room: room,
        ));
      }
    }

    notifyListeners();
  }

  // emptyListSearch() {
  //   getSerchResult();
  //   return Center(child: CircularProgressIndicator());
  // }

  getDetailsProperties() async {
    String url =
        'https://berry.parfaih.com/api/v1/properties/${int.parse(id_details)}';
    http.Response response = await http.get(Uri.parse(url));
    var body = json.decode(response.body);

    String status_Details = body['status'].toString();

    if (status_Details == "1") {
      name_det = body['data']["name"];
      description_det = body['data']["description"];
      price_det = body['data']["price"].toString();
      city_det = body['data']["city"];
      area_det = body['data']["area"].toString();
      room_det = body['data']["room"].toString();
      bathroom_det = body['data']["bathroom"].toString();
      park_det = body['data']["park"].toString();
      is_favourites_details = body['data']["is_favourites"];
      owner_name = body['data']["owner"]["name"];
      owner_phone = body['data']["owner"]["mobile"];
      owner_email = body['data']["owner"]["email"];

      // DetailsScreen(
      //   room: room,
      //   bathroom: bathroom,
      //   city: city,
      //   area: area,
      //   is_favourites: is_favourites,
      //   price: price,
      //   name: name,
      //   description: description,
      //   owner_email: owner_email,
      //   owner_name: owner_name,
      //   owner_phone: owner_phone,
      //   park: park,
      // );
    }

    // myListCard1.add(HomeCards1(
    //   city: city,
    //   devolper: devolper,
    //   id: id,
    //   image: image,
    //   name: name,
    // ));

    notifyListeners();
  }

  getAllFavorite() async {
    String url = 'https://berry.parfaih.com/api/v1/favourites';
    http.Response response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Authorization': 'Bearer $access_token',
        'Content-Type': 'application/json; char=UTF-8',
      },
    );

    var body = jsonDecode(response.body);

    String status_buy = await body["status"].toString();

    if (status_buy == "1") {
      String id, price, city, area, room, bathroom;
      bool is_favourites;
      for (int i = 0; i < body['data'].length; i++) {
        id = body['data'][i]['id'].toString();
        price = body['data'][i]['price'].toString();
        city = body['data'][i]['city'];
        area = body['data'][i]['area'].toString();
        room = body['data'][i]['room'].toString();
        bathroom = body['data'][i]['bathroom'].toString();
        is_favourites = body['data'][i]['is_favourites'];

        await myListFavoriteCard.add(BuyCard(
          price: price,
          is_favourites: is_favourites,
          area: area,
          city: city,
          id: id,
          bathroom: bathroom,
          room: room,
        ));
      }
    }

    notifyListeners();
  }

  creatFavorite({String id_CFav}) async {
    String url = 'https://berry.parfaih.com/api/v1/favourites';
    http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Authorization': 'Bearer $access_token',
        'Content-Type': 'application/json; char=UTF-8',
      },
      body: jsonEncode(
        {
          'property_id': int.parse(id_CFav),
        },
      ),
    );

    var body = jsonDecode(response.body);

    String status_buy = await body["status"].toString();

    print(status_buy);

    // if (status_buy == "1") {
    //   String id, price, city, area, room, bathroom;
    //   bool is_favourites;
    //   for (int i = 0; i < body['data'].length; i++) {
    //     id = body['data'][i]['id'].toString();
    //     price = body['data'][i]['price'].toString();
    //     city = body['data'][i]['city'];
    //     area = body['data'][i]['area'].toString();
    //     room = body['data'][i]['room'].toString();
    //     bathroom = body['data'][i]['bathroom'].toString();
    //     is_favourites = body['data'][i]['is_favourites'];
    //
    //     await myListFacoriteCard.add(BuyCard(
    //       price: price,
    //       is_favourites: is_favourites,
    //       area: area,
    //       city: city,
    //       id: id,
    //       bathroom: bathroom,
    //       room: room,
    //     ));
    //   }
    // }

    notifyListeners();
  }

  refresh() {
    String refrech = "a";
    notifyListeners();
  }

// deletFavorite({String id_CFav}) async {
//   String url = 'https://berry.parfaih.com/api/v1/favourites/${int.parse(id_CFav)}';
//   http.Response response = await http.delete(
//     Uri.parse(url),
//     headers: <String, String>{
//       'Authorization': 'Bearer $access_token',
//       'Content-Type': 'application/json; char=UTF-8',
//     },
//
//   );
//
//   var body = jsonDecode(response.body);
//
//   String status_buy = await body["status"].toString();
//
//   print(status_buy);
//
//   // if (status_buy == "1") {
//   //   String id, price, city, area, room, bathroom;
//   //   bool is_favourites;
//   //   for (int i = 0; i < body['data'].length; i++) {
//   //     id = body['data'][i]['id'].toString();
//   //     price = body['data'][i]['price'].toString();
//   //     city = body['data'][i]['city'];
//   //     area = body['data'][i]['area'].toString();
//   //     room = body['data'][i]['room'].toString();
//   //     bathroom = body['data'][i]['bathroom'].toString();
//   //     is_favourites = body['data'][i]['is_favourites'];
//   //
//   //     await myListFacoriteCard.add(BuyCard(
//   //       price: price,
//   //       is_favourites: is_favourites,
//   //       area: area,
//   //       city: city,
//   //       id: id,
//   //       bathroom: bathroom,
//   //       room: room,
//   //     ));
//   //   }
//   // }
//
//   notifyListeners();
// }

}
