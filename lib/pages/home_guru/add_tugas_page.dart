// import 'dart:html';

import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:apps/service/server.dart';
import 'package:apps/theme.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class AddTugasPage extends StatefulWidget {
  const AddTugasPage({Key key}) : super(key: key);

  @override
  _AddTugasPageState createState() => _AddTugasPageState();
}

class _AddTugasPageState extends State<AddTugasPage> {
  TextEditingController medController = TextEditingController(text: '');
  bool isLoading = false;

  String dropdownValue;
  TextEditingController dateinput = TextEditingController();
  File filetugas;
  String nameFile;
  // FilePicker pikerFile = new FilePicker;
  Future plhFile() async {
    var pickFile = await FilePicker.platform.pickFiles();
    final file = pickFile.files.first;
    print('name : ${file.name}');
    print('bytes : ${file.bytes}');
    print('size : ${file.size}');
    print('Extension : ${file.extension}');
    print('Path : ${file.path}');
    setState(() {
      filetugas = File(file.path);
      nameFile = file.name;
    });
  }

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final _id_kls = args['id_kelas'];
    final _id_mapel = args['id_mpl'];
    final _mapel = args['mapel'];

    handleAdd() async {
      print(dropdownValue);
      print(dateinput.text);
      if (!(filetugas != null &&
          dropdownValue != null &&
          dateinput.text != null)) {
        Flushbar(
          duration: Duration(seconds: 4),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Color(0xffff5c83),
          message: 'Pilih file , jenis tugas dan batas kumpul',
        ).show(context);
      } else {
        var url = '$baseUrl' + 'upload_tugas/$_id_mapel';
        print(url);
        var uri = Uri.parse(url);
        var request = new http.MultipartRequest("POST", uri);
        var multipartFile =
            await http.MultipartFile.fromPath('file_soal', filetugas.path);
        request.files.add(multipartFile);
        request.fields['jenis'] = dropdownValue;
        request.fields['limit'] = dateinput.text;
        request.fields['id_kelas'] = _id_kls;
        var response = await request.send();
        print(response.request);
        if (response.statusCode == 200) {
          print("berhasil");
          Navigator.pushNamed(context, '/tugas', arguments: {
            'id_kelas': _id_kls,
            'id_mapel': _id_mapel,
            'mapel': _mapel
          });
        } else {
          Flushbar(
            duration: Duration(seconds: 4),
            flushbarPosition: FlushbarPosition.TOP,
            backgroundColor: Color(0xffff5c83),
            message: 'Gagal Upload tugas, Silahkan cobalagi nantik',
          ).show(context);
        }
      }
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        // color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Tugas',
              style: blackTextStyle.copyWith(
                fontSize: 30,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Form untuk upload tugas ' + _mapel,
              style: subtitleTextStyle.copyWith(fontSize: 15),
            ),
          ],
        ),
      );
    }

    Widget dateform() {
      return Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Batas Kumpul',
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
                    child: TextField(
                  controller: dateinput, //editing controller of this TextField
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.calendar_today,
                      color: birumudaColor,
                    ), //icon of text field
                    // labelText: "Enter Date" //label text of field
                  ),
                  readOnly:
                      true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateinput.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                )),
              ),
            ],
          ));
    }

    Widget jenis() {
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Jenis Tugas',
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    FontAwesomeIcons.buffer,
                    size: 20,
                    color: birumudaColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,

                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: subtitleTextStyle,
                    // underline: Container(
                    //   height: 2,
                    //   color: Colors.deepPurpleAccent,
                    // ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },

                    items: <String>['Tugas', 'Ulangan', 'UTS', 'UAS']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          )
        ]),
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

    Widget pilihFile() {
      return Container(
        height: 100,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: GestureDetector(
          onTap: () {
            plhFile();
          },
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.fileImage,
                    color: secondaryColor,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text('Pilih file tugas',
                      style: priceTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold)),
                ],
              ),
              SizedBox(
                width: 15,
              ),
              nameFile == null
                  ? Container()
                  : Text(nameFile,
                      style: priceTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold))
            ],
          ),
        ),
      );
    }

    Widget inputButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 30, top: 60),
        child: TextButton(
          onPressed: handleAdd,
          style: TextButton.styleFrom(
            backgroundColor: biruColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: isLoading == false
              ? Text(
                  'Add Tugas',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                )
              : CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(backgroundColor6),
                ),
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
              jenis(),
              dateform(),
              pilihFile(),
              inputButton(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
