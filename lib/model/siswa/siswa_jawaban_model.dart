class SiswaJawabanModel {
  String nilai;
  String jawaban;
  String id_jawaban;

  SiswaJawabanModel({this.id_jawaban, this.jawaban, this.nilai});

  SiswaJawabanModel.fromJson(Map<String, dynamic> json) {
    nilai = json['nilai'].toString();
    jawaban = json['file'];
    id_jawaban = json['id_jawaban'].toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'nilai': nilai,
      'jawaban': jawaban,
      'id_jawaban': id_jawaban,
    };
  }
}
