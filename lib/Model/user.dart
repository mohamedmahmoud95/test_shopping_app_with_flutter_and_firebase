
import '../shop.dart';

class user {
  String name;
  String id;
  List<Shop> CartProducts;
  List<Shop> FavProducts;
  user({
    required this.name,
    required this.id,
    required this.CartProducts,
    required this.FavProducts,
  });
}

user sampleAppUser =
    user(name: "Shaimaa", id: "User1", CartProducts: [], FavProducts: []);
