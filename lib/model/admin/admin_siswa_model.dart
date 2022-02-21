class AdminSiswaModel {
  String id;
  String nama;
  String nip;

  AdminSiswaModel(
      {this.id,
      this.nama,
      this.nip});

  AdminSiswaModel.fromJson(Map<String, dynamic> json) {
    id = json['id_siswa'].toString();
    nama = json['nama'];
    nip = json['nis'].toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'nip': nip,
    };
  }
}
