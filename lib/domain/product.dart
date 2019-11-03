class Product {
  final String name;
  final String brandName;
  final String color;
  final String size;
  final String price;
  final String newPrice;
  final double rating;
  final int ratingCount;
  final String discountLabel;
  final bool isNew;
  final bool inBag;
  final bool isSoldOut;

  final String imgPathSmall;
  final String imgPathMedium;
  final String imgPathBig;

  Product({
    this.name,
    this.brandName,
    this.color,
    this.size,
    this.price,
    this.newPrice,
    this.rating,
    this.ratingCount,
    this.discountLabel,
    this.isNew,
    this.inBag,
    this.isSoldOut,
    this.imgPathSmall,
    this.imgPathMedium,
    this.imgPathBig,
  });
}
