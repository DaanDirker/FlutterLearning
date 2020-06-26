class RecipeModel {
  String title;
  String detail;
  String image;
  String href;
  bool fav = false;

  RecipeModel({this.title, this.detail, this.image, this.href ,this.fav});

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      title: json['title'],
      detail: json['ingredients'],
      href: json['href'],
      image: json['thumbnail'] == "" ? "https://www.buzzinthekitchen.com/wp-content/themes/neptune-by-osetin/assets/img/placeholder.jpg" : json['thumbnail'],
      fav: false
    );
  }
}
