class Items {
  Fields fields;

  Items({this.fields});

  factory Items.fromJson(Map<String, dynamic> json) {
    print('This items: ');
    return new Items(
      fields: Fields.fromJson(json['fields']),
    );
    // return Items(Fields.fromJson(json['fields']);
  }
}

class Fields {
  String title;
  Fields({this.title});

  factory Fields.fromJson(Map<String, dynamic> json) {
    print(json['title']);
    return Fields(
      title: json['title'].toString(),
    );
  }
}

// class GambarArtikel {
//   String id;

//   GambarArtikel({this.id});

//   factory GambarArtikel.fromJson(Map<String, dynamic> json) {
//     return GambarArtikel(
//       id: json['sys']['id'],
//     );
//   }
// }
