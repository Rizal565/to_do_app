import 'package:flutter/material.dart';
import 'package:to_do_app/ui/beranda.dart';
import 'package:to_do_app/ui/login.dart';
import '/helpers/user_info.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await UserInfo().getToken();
  print(token);
  runApp(MaterialApp(
    title: "TO-DO App",
    debugShowCheckedModeBanner: false,
    home: token == null ? Login() : Beranda(),
  ));
}
