//class Items {
//  Fields fields;
//
//  Items({this.fields});
//
//  factory Items.fromJson(Map<String, dynamic> json) {
////    print('This items: ');
//    return new Items(
//      fields: Fields.fromJson(json['fields']),
//    );
//    // return Items(Fields.fromJson(json['fields']);
//  }
//}
//
//class Fields {
//  String title, slug, gambarArtikel;
//  Fields({this.title, this.slug, this.gambarArtikel});
//
//  factory Fields.fromJson(Map<String, dynamic> json) {
//    print(json['gambarArtikel']);
//    return Fields(
//      title: json['title'],
//      slug: json['slug'],
//      gambarArtikel: json['gambarArtikel'],
//    );
//  }
//}

class Items {
  String title, slug, gambarArtikel;

  Items(this.title, this.slug, this.gambarArtikel);

  Items.fromJson(Map<String, dynamic> json) {
    title = json['items']['fields']['title'];
    slug = json['items']['fields']['slug'];
    gambarArtikel = json['items']['fields']['gambarArtikel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items']['fields']['title'] = this.title;
    data['items']['fields']['slug'] = this.slug;
    data['items']['fields']['gambarArtikel'] = this.gambarArtikel;
    return data;
  }
}
