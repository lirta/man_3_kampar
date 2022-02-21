class DaftarNilaiGuruModel {
  String kelas;
  String mapel;
  String ajaran;
  String nilai;
  String siswa;

  DaftarNilaiGuruModel({this.kelas, this.mapel, this.ajaran, this.nilai, this.siswa});
  
  DaftarNilaiGuruModel.fromJson(Map<String, dynamic> json) {
    kelas = json['kelas'];
    mapel = json['mapel'];
    ajaran = json['ajaran'];
    nilai = json['nilai'];
    siswa = json['siswa'];
  }
  Map<String, dynamic> toJson() {
    return {
      'kelas': kelas,
      'mapel': mapel,
      'ajaran': ajaran,
      'nilai': nilai,
      'siswa': siswa,
    };
  }
}