import 'package:apps/model/admin/admin_guru_model.dart';
import 'package:apps/model/admin/admin_siswa_model.dart';
import 'package:apps/service/server.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class DataGuru extends StatelessWidget {
  // const DataGuru({ Key key }) : super(key: key);
  AdminGuruModel guru;
  DataGuru(this.guru);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 215,
      height: 278,
      // margin: EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: birutuaColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: blackColor)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Image.network(
            fotoUrl + guru.foto,
            width: 215,
            height: 150,
            // fit: BoxFit.cover,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  guru.nip,
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  guru.nama,
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 6,
                ),
                // Text(
                //   '\$${product.price}',
                //   style: priceTextStyle.copyWith(
                //     fontSize: 14,
                //     fontWeight: medium,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
