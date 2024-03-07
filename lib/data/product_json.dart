import 'package:spwtest/model/cart_model.dart';

final  dataProduct = {
  "product_items": [
    {
      "id": 1,
      "name": "Puma White (New)",
      "image_url": "https://images.unsplash.com/photo-1608231387042-66d1773070a5?fit=crop&w=300&q=80",
      "price": 250.0,
      "isFavorite": false
    },
    {
      "id": 2,
      "name": "iPhone 12 Pro Black Edition",
      "image_url": "https://images.unsplash.com/photo-1573148195900-7845dcb9b127?fit=crop&w=300&q=80",
      "price": 1200.00,
      "isFavorite": false
    },
    {
      "id": 3,
      "name": "Nintendo Switch 2021",
      "image_url": "https://images.unsplash.com/photo-1578303512597-81e6cc155b3e?fit=crop&w=300&q=80",
      "price": 599.00,
      "isFavorite": false
    },
    {
      "id": 4,
      "name": "Black + Decker",
      "image_url": "https://images.unsplash.com/photo-1574269909862-7e1d70bb8078?fit=crop&w=300&q=80",
      "price": 149.00,
      "isFavorite": false
    },
    {
      "id": 5,
      "name": "White Neat Mug",
      "image_url": "https://images.unsplash.com/photo-1514228742587-6b1558fcca3d?fit=crop&w=300&q=80",
      "price": 35.00,
      "isFavorite": false
    },
    {
      "id": 6,
      "name": "SMEG Oven - Winter Collection",
      "image_url": "https://images.unsplash.com/photo-1586208958839-06c17cacdf08?fit=crop&w=300&q=80",
      "price": 8299.00,
      "isFavorite": false
    },
    {
      "id": 7,
      "name": "Black Table Fan with Pink Moody Cat",
      "image_url": "https://images.unsplash.com/photo-1618941716939-553df3c6c278?fit=crop&w=300&q=80",
      "price": 79.00,
      "isFavorite": false
    }
  ]
};

List<Product> products = [
  Product(
      id: 1,
      title: "Puma White (New)",
      price: 250.00,
      imgUrl: "https://images.unsplash.com/photo-1608231387042-66d1773070a5?fit=crop&w=300&q=80",
      qty: 1,
      isFavorite: false
  ),
  Product(
      id: 2,
    title: "iPhone 12 Pro Black Edition",
      imgUrl: "https://images.unsplash.com/photo-1573148195900-7845dcb9b127?fit=crop&w=300&q=80",
      price: 1200.00,
      qty: 1,
      isFavorite: false,
  ),
  Product(
      id: 3,
    title: "Nintendo Switch 2021",
      imgUrl: "https://images.unsplash.com/photo-1578303512597-81e6cc155b3e?fit=crop&w=300&q=80",
      price: 599.00,
      qty: 1,
      isFavorite: false,
  ),
  Product(
      id: 4,
      title: "Black + Decker",
      imgUrl: "https://images.unsplash.com/photo-1574269909862-7e1d70bb8078?fit=crop&w=300&q=80",
      price: 149.00,
      qty: 1,
      isFavorite: false
  ),
  // Product(
  //     id: 5,
  //     name: "Avocado",
  //     price: 25.0,
  //     imgUrl: "https://img.icons8.com/cotton/2x/avocado.png",
  //     qty: 1,
  //     isFavorite: false
  // ),
];

List newDataProduct = [];

List<Product> products2 = [];

List<Product> dataFavorite = [];

List<Product> dataByID = [];

