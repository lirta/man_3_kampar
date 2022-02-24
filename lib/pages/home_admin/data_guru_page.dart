import 'package:apps/pages/home_admin/navbar_admin.dart';
import 'package:apps/provider/admin_profider.dart';
import 'package:apps/widget/data_guru.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class DataGuruPage extends StatefulWidget {
  const DataGuruPage({Key key}) : super(key: key);

  @override
  _DataGuruPageState createState() => _DataGuruPageState();
}

class _DataGuruPageState extends State<DataGuruPage> {
  @override
  Widget build(BuildContext context) {
    AdminProvider adminProvider = Provider.of<AdminProvider>(context);

    Widget header() {
      var birumudaColor;
      return AppBar(
        backgroundColor: birumudaColor,
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text('Data Guru'),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor6,
      resizeToAvoidBottomInset: false,
      appBar: header(),
      drawer: NavbarAdmin(),
      body: Column(
        children: [
          Expanded(
            child: StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: adminProvider.guru.length,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                itemBuilder: (context, index) {
                  return DataGuru(adminProvider.guru[index]);
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1)),
          )
        ],
      ),
      // body: SafeArea(
      //   child: SingleChildScrollView(
      //     child: Container(
      //       margin: EdgeInsets.symmetric(
      //         horizontal: defaultMargin,
      //       ),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [detailTugas()],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
