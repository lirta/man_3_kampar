class AdminSiswaModel {
  String id;
  String nama;
  String nip;
  String foto;

  AdminSiswaModel({this.id, this.nama, this.nip, this.foto});

  AdminSiswaModel.fromJson(Map<String, dynamic> json) {
    id = json['id_siswa'].toString();
    nama = json['nama'];
    nip = json['nis'].toString();
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'nip': nip,
      'foto': foto,
    };
  }
}
