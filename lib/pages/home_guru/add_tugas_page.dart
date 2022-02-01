import 'package:apps/provider/guru/daftar_tugas_provider.dart';
import 'package:apps/theme.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddTugasPage extends StatefulWidget {
  const AddTugasPage({Key key}) : super(key: key);

  @override
  _AddTugasPageState createState() => _AddTugasPageState();
}

class _AddTugasPageState extends State<AddTugasPage> {
  TextEditingController medController = TextEditingController(text: '');

  Peron selectedPeron;
  List<Peron> peron = [
    Peron("Ulangan"),
    Peron("Tugas"),
    Peron("UTS"),
    Peron("UAS"),
  ];
  List<DropdownMenuItem> generateItems(List<Peron> peron) {
    List<DropdownMenuItem> items = [];
    for (var item in peron) {
      items.add(DropdownMenuItem(
        child: Text(item.name),
        value: item,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        // color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Register and Happy Shoping',
              style: subtitleTextStyle,
            ),
          ],
        ),
      );
    }

    Widget jenis() {
      return Container(
        color: primaryColor,
        child: Column(children: <Widget>[
          DropdownButton(
            value: selectedPeron,
            items: generateItems(peron),
            onChanged: (item) {
              setState(() {
                selectedPeron = item;
              });
            },
          )
        ]),
      );
    }

    Widget jenisInput() {
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nis / Nip',
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
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nis / Nip',
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
                      FontAwesomeIcons.idCard,
                      size: 15,
                      color: birutuaColor,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: blackTextStyle,
                        controller: medController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Email Address',
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

    return Scaffold(
      backgroundColor: backgroundColor6,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              emailInput(),
              jenis(),
              // jenisInput(),
              // isLoading ? LoadingButton() :
              Spacer(),
              // signInButton(),
              // footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class Peron {
  String name;
  Peron(this.name);
}
