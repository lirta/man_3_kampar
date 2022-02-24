class AdminGuruModel {
  String id;
  String nama;
  String nip;
  String foto;

  AdminGuruModel({this.id, this.nama, this.nip, this.foto});

  AdminGuruModel.fromJson(Map<String, dynamic> json) {
    id = json['id_guru'].toString();
    nama = json['nama_guru'];
    nip = json['nip'].toString();
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'nip': nip,
      'foto': foto,
    };
  }
}
