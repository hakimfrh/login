import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:login/model/user.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
          child: ListView(
        children: [
          const ListTile(
            title: Text('Item 1'),
          ),
          const ListTile(
            title: Text('Item 2'),
          ),
          const ListTile(
            title: Text('Item 3'),
          ),
          ListTile(
            onTap: () {


              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => login()),
              );
            },
            title: const Text('Logout'),
          ),
        ],
      )),
      body: Center(
        child: Column(
          children: [
            Text((user.id??0).toString()),
            Text(user.nama),
            Text(user.alamat),
            Text(user.tanggalLahir),
            Text(user.jenisKelamin),
            Text(user.username),
            Text(user.password),
            ],
        ),
      ),
    );
  }

  Future<void> _showAlertLogout() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Apakah anda ingin logout ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ya'),
              onPressed: () {
                Navigator.of(context).pop();
                
              },
            ),
            TextButton(
              child: const Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
