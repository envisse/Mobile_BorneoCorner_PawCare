class Product {
  final String name, price, desc, image;
  final int index;

  Product({
    this.name,
    this.price,
    this.desc,
    this.image,
    this.index,
  });
}

List<Product> products = [
  Product(
      index: 1,
      name: 'Whiskas Basah',
      price: '18000',
      desc: 'Makanan kucing',
      image: 'assets/images/Product/Product2.png'),
  Product(
      index: 2,
      name: 'Whiskas Kering',
      price: '18000',
      desc: 'Makanan kucing',
      image: 'assets/images/Product/Product1.png'),
  Product(
      index: 3,
      name: 'Whiskas Kering 2KG',
      price: '30000',
      desc: 'Ikan Tuna',
      image: 'assets/images/Product/Product4.png'),
  Product(
      index: 4,
      name: 'Whiskas Basah',
      price: '20000',
      desc: 'Makanan Kucing',
      image: 'assets/images/Product/Product2.png'),
   Product(
      index: 5,
      name: 'Whiskas Kering 5KG',
      price: '50000',
      desc: 'Makanan Kucing',
      image: 'assets/images/Product/Product4.png'),
];
