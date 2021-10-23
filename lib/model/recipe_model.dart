// To parse this JSON data, do
//
//     final recipeModel = recipeModelFromJson(jsonString);

import 'dart:convert';

List<RecipeModel> recipeModelFromJson(String str) => List<RecipeModel>.from(
    json.decode(str).map((x) => RecipeModel.fromJson(x)));

String recipeModelToJson(List<RecipeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecipeModel {
  RecipeModel({
    required this.id,
    required this.title,
    required this.category,
    required this.rate,
    required this.image,
    required this.video,
    required this.ingredients,
  });

  int? id;
  String title;
  String category;
  double rate;
  String image;
  String video;
  List<Ingredient> ingredients;

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        id: json["id"],
        title: json["title"],
        category: json["category"],
        rate: json["rate"],
        image: json["image"],
        video: json["video"],
        ingredients: json["ingredients"].runtimeType == String
            ? List<Ingredient>.from(jsonDecode(json["ingredients"])
                .map((x) => Ingredient.fromJson(x)))
            : List<Ingredient>.from(
                json["ingredients"].map((x) => Ingredient.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "title": title,
        "category": category,
        "rate": rate,
        "image": image,
        "video": video,
        "ingredients":
            jsonEncode(List<dynamic>.from(ingredients.map((x) => x.toJson()))),
      };
}

class Ingredient {
  Ingredient({
    required this.name,
    required this.quantity,
  });

  String name;
  String quantity;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        name: json["name"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
      };
}
