import 'package:apps/provider/guru/daftar_tugas_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class TugasPage extends StatefulWidget {
  const TugasPage({Key key}) : super(key: key);

  @override
  _TugasPageState createState() => _TugasPageState();
}

class _TugasPageState extends State<TugasPage> {
  ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final _id_kls = args['id_kelas'];
    final _id_mapel = args['id_mapel'];
    final _mapel = args['mapel'];
    DaftarTugasProvider daftarTugasProvider =
        Provider.of<DaftarTugasProvider>(context);
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);

    pr.style(
      message: 'Menunggu...',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progress: 0.0,
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );
    Widget header() {
      return AppBar(
        backgroundColor: birumudaColor,
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text('Tugas $_mapel'),
      );
    }

    Widget daftarDetailMapelTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Text(
              "Tugas /",
              style: subtitleTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text(
                'Home',
                style: subtitleTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget daftarDetailMapel() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Column(children: [
          GestureDetector(
            onTap: () async {
              pr.show();
              if (await daftarTugasProvider.getdaftartugas(
                  id_kelas: _id_kls, id_mapel: _id_mapel)) {
                pr.hide();
                Navigator.pushNamed(context, '/daftar-tugas');
              }
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              padding:
                  EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: backgroundColor6),
              height: 100,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    FontAwesomeIcons.users,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      "Daftar Tugas",
                      style: blackTextStyle.copyWith(
                        fontSize: 25,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/add-tugas', arguments: {
                'id_kelas': _id_kls,
                'id_mpl': _id_mapel,
                'mapel': _mapel
              });
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              padding:
                  EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: backgroundColor6),
              height: 100,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    FontAwesomeIcons.bookOpen,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      "Add Tugas",
                      style: blackTextStyle.copyWith(
                        fontSize: 25,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      );
    }

    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: false,
      appBar: header(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [daftarDetailMapelTitle(), daftarDetailMapel()],
            ),
          ),
        ),
      ),
    );
  }
}
