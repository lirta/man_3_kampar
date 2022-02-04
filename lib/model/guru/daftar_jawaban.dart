class DaftarJawabanModel {
  String id_jawaban;
  String siswa;
  String nis;
  String jawaban;
  String nilai;

  DaftarJawabanModel(
      {this.id_jawaban, this.siswa, this.nis, this.jawaban, this.nilai});

  DaftarJawabanModel.fromJson(Map<String, dynamic> json) {
    id_jawaban = json['id_jawaban'].toString();
    siswa = json['nama'];
    nis = json['nis'].toString();
    jawaban = json['file'];
    nilai = json['nilai'].toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'id_jawaban': id_jawaban,
      'siswa': siswa,
      'nis': nis,
      'jawaban': jawaban,
      'nilai': nilai
    };
  }
}
