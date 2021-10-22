import 'package:meta/meta.dart';
import 'dart:convert';

class SimpleRecipe {
    SimpleRecipe({
        required this.id,
        required this.dishImage,
        required this.title,
        required this.duration,
        required this.source,
        required this.information,
    });

    final String id;
    final String dishImage;
    final String title;
    final String duration;
    final String source;
    final List<String> information;

    SimpleRecipe copyWith({
        String? id,
        String? dishImage,
        String? title,
        String? duration,
        String? source,
        List<String>? information,
    }) => 
        SimpleRecipe(
            id: id ?? this.id,
            dishImage: dishImage ?? this.dishImage,
            title: title ?? this.title,
            duration: duration ?? this.duration,
            source: source ?? this.source,
            information: information ?? this.information,
        );

    factory SimpleRecipe.fromJson(String str) => SimpleRecipe.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SimpleRecipe.fromMap(Map<String, dynamic> json) => SimpleRecipe(
        id: json["id"],
        dishImage: json["dishImage"],
        title: json["title"],
        duration: json["duration"],
        source: json["source"],
        information: List<String>.from(json["information"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "dishImage": dishImage,
        "title": title,
        "duration": duration,
        "source": source,
        "information": List<dynamic>.from(information.map((x) => x)),
    };
}
