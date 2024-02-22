class PostModel{
  int? id;
  late String name;
  late String description;
  late String quality;
  late String country;
  late String price;
  late String category;
  late String stockQuantity;
  late String size;
  late String color;
  late String brand;
  late String rating;


  PostModel({
     this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.stockQuantity,
    required this.size,
    required this.color,
    required this.brand,
    required this.rating,
    required this.quality,
    required this.country
});

  PostModel.fromJson(Map<String, dynamic> json){
    id = json["id"];
    name = json["name"];
    description = json["description"];
    price = json["price"];
    category = json["category"];
    stockQuantity = json["stockQuantity"];
    size = json["size"];
    color = json["color"];
    brand = json["brand"];
    rating = json["rating"];
    quality = json["quality"];
    country = json["country"];
  }

  Map<String, dynamic> toJson(){
    return {
      "id":id,
      "name":name,
      "description":description,
      "price":price,
      "category":category,
      "stockQuantity":stockQuantity,
      "size":size,
      "color":color,
      "brand":brand,
      "rating":rating,
      "quality":quality,
      "country":country,
    };
  }

}