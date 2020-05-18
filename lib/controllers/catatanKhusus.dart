class Catatan {
  String id, jenis, keterangan, poin;

  Catatan(this.id, this.jenis, this.keterangan, this.poin);

  Catatan.fromJson(Map<String, dynamic> json) {
    id = json['data']['id'];
    jenis = json['data']['jenis'];
    keterangan = json['data']['keterangan'];
    poin = json['poin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data']['nis'] = this.id;
    data['data']['jenis'] = this.jenis;
    data['data']['kegiatan'] = this.keterangan;
    data['data']['point'] = this.poin;
    return data;
  }
}