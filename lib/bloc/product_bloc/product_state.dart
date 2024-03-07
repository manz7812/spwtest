part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];

  const ProductState();
}

class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {
  ProductLoading();
}

class ProductHasData extends ProductState {
  final List<Product> productList;
  final productEntity? listProductEntity;
  ProductHasData({this.listProductEntity,required this.productList});

  @override
  List<Object?> get props => [productList,listProductEntity];
}

class ProductError extends ProductState {
  String error;
  ProductError({required this.error});
  @override
  List<Object> get props => [error];
}




