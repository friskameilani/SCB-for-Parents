class CatatanKhusus {
  List<Data> data;

  CatatanKhusus({this.data});

  CatatanKhusus.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  int poin;
  String jenis;
  String keterangan;

  Data({this.id, this.poin, this.jenis, this.keterangan});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    poin = json['poin'];
    jenis = json['jenis'];
    keterangan = json['keterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['poin'] = this.poin;
    data['jenis'] = this.jenis;
    data['keterangan'] = this.keterangan;
    return data;
  }
}