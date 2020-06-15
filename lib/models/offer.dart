import 'package:clothes_map/models/product.dart';
import 'package:clothes_map/utils/values.dart';

class Offer implements Product {
  @override
  int id;

  @override
  double price;

  @override
  String description;

  @override
  String imageUrl;

  @override
  String section;

  @override
  String category;

  final String ownerId;
  final double priceBeforeDiscount;
  final int quantity;

  Offer({
    this.id,
    this.ownerId,
    this.description,
    this.price,
    this.priceBeforeDiscount,
    this.quantity,
    this.category,
    this.imageUrl,
    this.section,
  });

  factory Offer.fromJson(Map<String, dynamic> json, bool hotOffer) {
    String imagesStorage = hotOffer ? hotOffersImagesStorage : offersImagesStorage;
    return Offer(
      id: int.parse(json['id']),
      ownerId: json['owner_id'],
      description: json['description'],
      price: double.parse(json['price']),
      priceBeforeDiscount: double.parse(json['priceBeforeDiscount']),
      imageUrl: imagesStorage + json['id'] + '.' + json['imageExtension'],
      category: json['category'],
      quantity: int.parse(json['quantity']),
    );
  }
}
