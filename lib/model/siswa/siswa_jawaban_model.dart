class SiswaJawabanModel {
  String id_jawaban;
  String jawaban;
  String nilai;

  SiswaJawabanModel({this.id_jawaban, this.jawaban, this.nilai});

  SiswaJawabanModel.fromJson(Map<String, dynamic> json) {
    id_jawaban = json['id_jawaban'].toString();
    jawaban = json['file'];
    nilai = json['nilai'].toString();
  }

  Map<String, dynamic> toJson() {
    return {'id_jawaban': id_jawaban, 'jawaban': jawaban, 'nilai': nilai};
  }
}
