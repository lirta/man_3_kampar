class DaftarAbsenSiswaModel {
  String id;
  String id_kelas;
  String id_mapel;
  String id_siswa;
  String siswa;
  String nis;
  String absen;
  String tgl;

  DaftarAbsenSiswaModel(
      {this.id,
      this.id_kelas,
      this.id_mapel,
      this.id_siswa,
      this.siswa,
      this.nis,
      this.absen,
      this.tgl});

  DaftarAbsenSiswaModel.fromJson(Map<String, dynamic> json) {
    id = json['id_absen'].toString();
    id_kelas = json['id_kls'].toString();
    id_mapel = json['id_mapel'].toString();
    id_siswa = json['id_siswa'].toString();
    siswa = json['siswa'];
    siswa = json['nis'].toString();
    absen = json['absen'];
    tgl = json['tgl'].toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_kelas': id_kelas,
      'id_mapel': id_mapel,
      'id_siswa': id_siswa,
      'siswa': siswa,
      'nis': nis,
      'absen': absen,
      'tgl': tgl
    };
  }
}
