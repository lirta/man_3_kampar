import 'package:apps/pages/home_guru/navbar_guru.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';

class IndexGuru extends StatefulWidget {
  const IndexGuru({Key key}) : super(key: key);

  @override
  _IndexGuruState createState() => _IndexGuruState();
}

class _IndexGuruState extends State<IndexGuru> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: biruColor,
        centerTitle: true,
        title: Text("Dashboard Guru"),
      ),
      drawer: NavbarGuru(),
    );
  }
}
