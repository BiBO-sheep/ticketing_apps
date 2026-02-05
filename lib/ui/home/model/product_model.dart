class ProductModel {
  final String productName;
  final String type;
  final int price;
  int quantity;

  ProductModel({
    required this.productName,
    required this.type,
    required this.price,
    this.quantity = 4,
  });
}

final dummyProducts = [
  ProductModel(
    productName: 'Ticket Dewasa',
    type: 'Domestik',
    price: 15000),
  ProductModel(
    productName: 'Ticket Anak Kecil',
    type: 'Domestik',
    price: 10000,
  ),
  ProductModel(
    productName: 'Ticket Dewasa',
    type: 'Manca Negara',
    price: 150000,
  ),
  ProductModel(
    productName: 'Ticket Bocil',
    type: 'Manca Negara',
    price: 100000,
  ),
  ProductModel(
    productName: 'Ticket Kematian',
    type: 'Manca Negara',
    price: 100000,
  ),
  ProductModel(
    productName: 'Ticket Bocil',
    type: 'Manca Negara',
    price: 100000,
  ),
  ProductModel(
    productName: 'Ticket Kehidupan',
    type: 'Manca Negara',
    price: 100000,
  ),
  ProductModel(
    productName: 'Ticket Anak Dewasa',
    type: 'Manca Negara',
    price: 100000,
  ),
];
