class PostModel{
  String? id;
  late String name;
  late String description;
  late String price;


  PostModel({
     this.id,
    required this.name,
    required this.description,
    required this.price,
});

  PostModel.fromJson(Map<String, dynamic> json){
    id = json["id"];
    name = json["name"];
    description = json["description"];
    price = json["price"];
  }

  Map<String, dynamic> toJson(){
    return {
      "id":id,
      "name":name,
      "description":description,
      "price":price,
    };
  }

}