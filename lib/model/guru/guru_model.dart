class GuruModel {
  String id;
  String nama;
  String nip;
  String jenis_kelamin;
  String foto;
  String akses;

  GuruModel(
      {this.id,
      this.nama,
      this.nip,
      this.jenis_kelamin,
      this.foto,
      this.akses});

  GuruModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    nama = json['nama'];
    nip = json['nip'].toString();
    jenis_kelamin = json['jenis_kelamin'].toString();
    foto = json['foto'];
    akses = json['akse'].toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'nip': nip,
      'jenis_kelamin': jenis_kelamin,
      'foto': foto,
      'akses': akses
    };
  }
}
