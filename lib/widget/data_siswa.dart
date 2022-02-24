import 'package:apps/model/admin/admin_siswa_model.dart';
import 'package:apps/service/server.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DataSiswa extends StatelessWidget {
  // const DataSiswa({ Key key }) : super(key: key);
  AdminSiswaModel siswa;
  DataSiswa(this.siswa);

  @override
  Widget build(BuildContext context) {
    // return Expanded(
    //   child: StaggeredGridView.countBuilder(
    //       padding: EdgeInsets.all(10),
    //       crossAxisCount: 3,
    //       staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
    //       // gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
    //       //     crossAxisCount: 3, childAspectRatio: 0.9),
    //       // itemCount: siswa.length,
    //       itemBuilder: (context, i) {
    //         return Container(
    //           height: 135,
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.all(Radius.circular(25)),
    //             //color: Colors.grey.withOpacity(0.5),
    //           ),
    //           margin:
    //               EdgeInsets.only(top: 0.0, bottom: 0.0, right: 3.0, left: 3.0),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               ClipOval(
    //                   child: siswa.foto != null
    //                       ? Image.network(
    //                           fotosiswaUrl + siswa.foto,
    //                           fit: BoxFit.cover,
    //                           width: 90,
    //                           height: 90,
    //                         )
    //                       : Image.asset('assets/image_profile.png')),
    //               SizedBox(height: 5),
    //               Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Text(
    //                   siswa.nama,
    //                   style: TextStyle(fontSize: 11, color: Colors.black),
    //                   overflow: TextOverflow.ellipsis,
    //                   maxLines: 2,
    //                   textAlign: TextAlign.center,
    //                 ),
    //               )
    //             ],
    //           ),
    //         );
    //       }),
    // );
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
            fotosiswaUrl + siswa.foto,
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
                  siswa.nip,
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  siswa.nama,
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
