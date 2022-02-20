class NilaiSiswaModel {
  String kelas;
  String mapel;
  String ajaran;
  String nilai;

  NilaiSiswaModel({this.kelas, this.mapel, this.ajaran, this.nilai});
  NilaiSiswaModel.fromJson(Map<String, dynamic> json) {
    kelas = json['kelas'];
    mapel = json['mapel'];
    ajaran = json['ajaran'];
    nilai = json['nilai'];
  }
  Map<String, dynamic> toJson() {
    return {
      'kelas': kelas,
      'mapel': mapel,
      'ajaran': ajaran,
      'nilai': nilai,
    };
  }
}
