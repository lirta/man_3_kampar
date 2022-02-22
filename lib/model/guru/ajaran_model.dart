class AjaranModel {
  String id_ajaran;
  String ajaran;

  AjaranModel({this.id_ajaran, this.ajaran});

  AjaranModel.fromJson(Map<String, dynamic> json) {
    id_ajaran = json['id_tahun_ajaran'].toString();
    ajaran = json['tahun_ajaran'];
  }

  Map<String, dynamic> toJson() {
    return {'id_ajaran': id_ajaran, 'ajaran': ajaran};
  }
}
