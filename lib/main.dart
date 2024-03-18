import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:login/navigation_drawer.dart';
import 'package:login/register.dart';
import 'package:login/wrapper.dart';

void main() => runApp(const MyApp());

@override
Widget build(BuildContext context) {
  return  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const Wrapper(),

    initialRoute: '/login',
    routes: {
    '/': (context) =>  const NavDrawer(),
    '/login': (context) =>  login(),
    '/register': (context) =>  const Register(),

  },
  );
}
