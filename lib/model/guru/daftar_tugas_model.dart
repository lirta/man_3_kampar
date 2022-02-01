class DaftarTugasModel {
  String id_soal;
  String jenis;
  String limit;
  String file;

  DaftarTugasModel({this.id_soal, this.jenis, this.limit, this.file});

  DaftarTugasModel.fromJson(Map<String, dynamic> json) {
    id_soal = json['id_soal'].toString();
    jenis = json['jenis'];
    limit = json['limit'].toString();
    file = json['file_soal'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id_soal': id_soal,
      'jenis': jenis,
      'limit': limit,
      'file': file,
    };
  }
}
