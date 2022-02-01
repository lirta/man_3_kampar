class DaftarSiswaPerkelasModel {
  String id_siswa;
  String nama;
  String nis;
  String j_kel;
  String thn_masuk;
  String foto;

  DaftarSiswaPerkelasModel(
      {this.id_siswa,
      this.nama,
      this.nis,
      this.j_kel,
      this.thn_masuk,
      this.foto});

  DaftarSiswaPerkelasModel.fromJson(Map<String, dynamic> json) {
    id_siswa = json['id_siswa'].toString();
    nama = json['nama'];
    nis = json['nis'].toString();
    j_kel = json['jenis_kelamin'].toString();
    thn_masuk = json['tahun_masuk'].toString();
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id_siswa': id_siswa,
      'nama': nama,
      'nis': nis,
      'j_kel': j_kel,
      'thn_masuk': thn_masuk,
      'foto': foto
    };
  }
}
