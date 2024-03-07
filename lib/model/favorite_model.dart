import 'package:scoped_model/scoped_model.dart';

class FavoriteModel extends Model {
  List<Favorite> Favorites = [];

  int get total => Favorites.length;

}

class Favorite {
  int id;
  String title;
  String imgUrl;
  double price;
  int qty;
  bool isFavorite;

  Favorite({
    required this.id,
    required this.title,
    required this.price,
    required this.qty,
    required this.imgUrl,
    this.isFavorite = false,
  });
}
