class KalenderModel {
  String ajaran;
  String tgl;
  String kegiatan;
  KalenderModel({this.ajaran, this.tgl,this.kegiatan});
  KalenderModel.fromJson(Map<String, dynamic> json) {
    ajaran = json['ajaran'];
    tgl = json['tgl'];
    kegiatan = json['kegiatan'];
  }
  Map<String, dynamic> toJson() {
    return {'ajaran': ajaran, 'tgl': tgl,'kegiatan': kegiatan};
  }

}
