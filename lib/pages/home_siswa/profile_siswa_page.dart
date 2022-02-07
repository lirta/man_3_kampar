import 'package:apps/model/siswa/siswa_model.dart';
import 'package:apps/provider/siswa/auth_siswa_provider.dart';
import 'package:apps/service/server.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme.dart';

class ProfileSiswaPage extends StatelessWidget {
  const ProfileSiswaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthSiswaProvider authSiswaProvider =
        Provider.of<AuthSiswaProvider>(context);
    SiswaModel siswa = authSiswaProvider.siswa;
    Widget header() {
      return AppBar(
        backgroundColor: birumudaColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    fotosiswaUrl + siswa.foto,
                    width: 64,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(siswa.nama,
                        style: primaryTextStyle.copyWith(
                            fontSize: 20, fontWeight: semiBold)),
                    Text(siswa.nis,
                        style: primaryTextStyle.copyWith(
                            fontSize: 20, fontWeight: semiBold)),
                  ],
                )),
                GestureDetector(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.remove("id");
                      prefs.setBool("is_login", false);
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/splash-login', (route) => false);
                    },
                    child: Icon(
                      FontAwesomeIcons.signOutAlt,
                      size: 40,
                      color: Colors.red[900],
                    ))
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: secondaryTextStyle.copyWith(fontSize: 13),
            ),
            Icon(
              Icons.chevron_right,
              color: primaryTextColor,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Profile",
              style: primaryTextStyle.copyWith(fontWeight: semiBold),
            ),
            Divider(
              thickness: 1,
              color: Color(0Xff2e3141),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Nama',
              style: primaryTextStyle.copyWith(fontWeight: medium),
              maxLines: 3,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              siswa.nama,
              style: subtitleTextStyle.copyWith(
                fontSize: 12,
                // fontWeight: medium
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Nis',
              style: primaryTextStyle.copyWith(fontWeight: medium),
              maxLines: 3,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              siswa.nis,
              style: subtitleTextStyle.copyWith(
                fontSize: 12,
                // fontWeight: medium
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Kelas',
              style: primaryTextStyle.copyWith(fontWeight: medium),
              maxLines: 3,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              siswa.kelas,
              style: subtitleTextStyle.copyWith(
                fontSize: 12,
                // fontWeight: medium
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [header(), content()],
    );
  }
}
