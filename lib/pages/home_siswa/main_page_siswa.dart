import 'package:apps/pages/home_siswa/home_siswa_page.dart';
import 'package:apps/pages/home_siswa/profile_siswa_page.dart';
import 'package:apps/provider/page_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class MainPageSiswa extends StatelessWidget {
  const MainPageSiswa({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: birumudaColor,
            currentIndex: pageProvider.currentIndex,
            onTap: (value) {
              print(value);
              pageProvider.currentIndex = value;
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Icon(
                    FontAwesomeIcons.home,
                    size: 21,
                    color: pageProvider.currentIndex == 0
                        ? primaryColor
                        : backgroundColor1,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Icon(
                    FontAwesomeIcons.userCircle,
                    size: 20,
                    color: pageProvider.currentIndex == 1
                        ? primaryColor
                        : backgroundColor1,
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return HomeSiswaPage();
          break;
        case 1:
          return ProfileSiswaPage();
          break;

        default:
          return HomeSiswaPage();
      }
    }

    return Scaffold(
      backgroundColor:
          pageProvider.currentIndex == 0 ? primaryColor : backgroundColor3,
      // floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
