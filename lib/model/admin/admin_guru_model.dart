class AdminGuruModel {
  String id;
  String nama;
  String nip;

  AdminGuruModel(
      {this.id,
      this.nama,
      this.nip});

  AdminGuruModel.fromJson(Map<String, dynamic> json) {
    id = json['id_guru'].toString();
    nama = json['nama_guru'];
    nip = json['nip'].toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'nip': nip,
    };
  }
}
