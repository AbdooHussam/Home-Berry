import 'package:flutter/material.dart';
import 'package:home_berry/network/api.dart';
import 'package:home_berry/screens/Splash.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Api>(create: (context) => Api()),
      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Color(0xFFF9A537)),
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
