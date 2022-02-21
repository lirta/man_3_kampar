import 'package:apps/model/admin/admin_guru_model.dart';
import 'package:apps/provider/admin_profider.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

class AdminGuru extends StatelessWidget {
  // const AdminGuru({ Key? key }) : super(key: key);

  AdminGuruModel guru;
  AdminGuru(this.guru);
  TextEditingController passwordController = TextEditingController(text: '');
  ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    AdminProvider adminProvider = Provider.of<AdminProvider>(context);
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
    pass() async {
      pr.show();
      if (await adminProvider.cangepass(
          nip: guru.nip, pass: passwordController.text)) {
        Navigator.pushNamed(context, '/index-admin');
      }
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.lock,
                      size: 15,
                      color: birutuaColor,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: blackTextStyle,
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Password',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildPopupDialog(BuildContext context) {
      return new AlertDialog(
        title: Text(guru.nama),
        content: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[passwordInput()],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              pass();
            },
            textColor: Theme.of(context).primaryColor,
            child: const Text('Submit'),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            textColor: Theme.of(context).primaryColor,
            child: Icon(FontAwesomeIcons.windowClose),
          ),
        ],
      );
    }

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => _buildPopupDialog(context),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: birutuaColor,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 23,
                  spreadRadius: -13,
                  color: blackColor)
            ]),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // id_mapel,
                    guru.nama,
                    // 'lirta',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    guru.nip,
                    // 'lirta',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
