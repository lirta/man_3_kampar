class DaftarNilaiModel {
  String jenis;
  String nilai;

  DaftarNilaiModel({this.jenis, this.nilai});
  DaftarNilaiModel.fromJson(Map<String, dynamic> json) {
    jenis = json['jenis'];
    nilai = json['hasil'].toString();
  }
  Map<String, dynamic> toJson() {
    return {'jenis': jenis, 'nilai': nilai};
  }
}
