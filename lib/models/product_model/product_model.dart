class ProductModel
{
  String name;
  String brand;
  String image;
  String? size;
  int price;
  int? qty;
  int oldPrice;
  ProductModel(this.name,this.brand,this.image,this.price,this.oldPrice,{this.size,this.qty});
}