// To parse this JSON data, do
//
//     final post = postFromMap(jsonString);

import 'dart:convert';

class Post {
  String? information;
  String? date;
  String? img;
  String? location;
  List<String>? hashtags;

  Post({
    this.information,
    this.date,
    this.img,
    this.location,
    this.hashtags,
  });

  factory Post.fromJson(String str) => Post.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        information: json["information"],
        date: json["date"],
        img: json["img"],
        location: json["location"],
        hashtags: json["hashtags"] == null
            ? []
            : List<String>.from(json["hashtags"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "information": information,
        "date": date,
        "img": img,
        "location": location,
        "hashtags":
            hashtags == null ? [] : List<dynamic>.from(hashtags!.map((x) => x)),
      };

  // static Post fromSnapshot(DocumentSnapshot snapshot) {
  //   return Post(
  //     information: snapshot['information'],
  //     date: snapshot['date'],
  //     img: snapshot['img'],
  //     location: snapshot['location'],
  //     hashtags: snapshot['hashtags'],
  //   );
  // }
}
