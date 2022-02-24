class JadwalModelAdmin {
  String id_mapel;
  String id_ajaran;
  String id_kls;
  String guru;
  String nama_kelas;
  String hari;
  String mapel;
  String jam_mulai;
  String jam_selesai;

  JadwalModelAdmin(
      {this.id_mapel,
      this.id_kls,
      this.guru,
      this.id_ajaran,
      this.nama_kelas,
      this.hari,
      this.mapel,
      this.jam_mulai,
      this.jam_selesai});

  JadwalModelAdmin.fromJson(Map<String, dynamic> json) {
    id_mapel = json['id_mapel'].toString();
    id_kls = json['id_kls'].toString();
    id_ajaran = json['id_ajaran'].toString();
    guru = json['nama_guru'];
    nama_kelas = json['nama_kelas'];
    hari = json['hari'];
    mapel = json['mapel'];
    jam_mulai = json['Jam_mulai'].toString();
    jam_selesai = json['Jam_selesai'].toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'id_mapel': id_mapel,
      'id_kls': id_kls,
      'id_ajaran': id_ajaran,
      'guru': guru,
      'nama_kelas': nama_kelas,
      'mapel': mapel,
      'jam_mulai': jam_mulai,
      'jam_selesai': jam_selesai
    };
  }
}
