class Catatan {
  String nis, jenis, tanggal, kegiatan, point;

  Catatan(this.nis, this.jenis, this.tanggal, this.kegiatan, this.point);

  Catatan.fromJson(Map<String, dynamic> json) {
    nis = json['nis'];
    jenis = json['jenis'];
    tanggal = json['tanggal'];
    kegiatan = json['kegiatan'];
    point = json['point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nis'] = this.nis;
    data['jenis'] = this.jenis;
    data['tanggal'] = this.tanggal;
    data['kegiatan'] = this.kegiatan;
    data['point'] = this.point;
    return data;
  }
}