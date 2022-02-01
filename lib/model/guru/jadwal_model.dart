class JadwalModel {
  String id_mapel;
  String id_kls;
  String nama_kelas;
  String mapel;
  String jam_mulai;
  String jam_selesai;

  JadwalModel(
      {this.id_mapel,
      this.id_kls,
      this.nama_kelas,
      this.mapel,
      this.jam_mulai,
      this.jam_selesai});

  JadwalModel.fromJson(Map<String, dynamic> json) {
    id_mapel = json['id_mapel'].toString();
    id_kls = json['id_kls'].toString();
    nama_kelas = json['nama_kelas'];
    mapel = json['mapel'];
    jam_mulai = json['Jam_mulai'].toString();
    jam_selesai = json['Jam_selesai'].toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'id_mapel': id_mapel,
      'id_kls': id_kls,
      'mapel': mapel,
      'jam_mulai': jam_mulai,
      'jam_selesai': jam_selesai
    };
  }
}
