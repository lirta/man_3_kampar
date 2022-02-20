class SiswaModel {
  String id;
  String id_kelas;
  String id_ajaran;
  String ajaran;
  String nama;
  String nis;
  String jenis_kelamin;
  String kelas;
  String foto;
  String akses;

  SiswaModel(
      {this.id,
      this.id_kelas,
      this.id_ajaran,
      this.ajaran,
      this.nama,
      this.nis,
      this.jenis_kelamin,
      this.kelas,
      this.foto,
      this.akses});

  SiswaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    id_kelas = json['id_kls'].toString();
    id_ajaran = json['id_ajaran'].toString();
    ajaran = json['ajaran'];
    nis = json['nis'].toString();
    nama = json['nama'];
    jenis_kelamin = json['j_kelamin'].toString();
    kelas = json['kelas'];
    foto = json['foto'];
    akses = json['akse'].toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_kelas': id_kelas,
      'id_ajaran': id_ajaran,
      'ajaran': ajaran,
      'nama': nama,
      'nis': nis,
      'jenis_kelamin': jenis_kelamin,
      'kelas': kelas,
      'foto': foto,
      'akses': akses
    };
  }
}
