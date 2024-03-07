part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}


class QueryGetProductEvent extends ProductEvent {
  // final String? data;
  const QueryGetProductEvent();
// @override
// List<Object?> get props => [];
}

class onSelectFavProductEvent extends ProductEvent {
  int id;
  var product;
  onSelectFavProductEvent({required this.id, required this.product});
// @override
// List<Object?> get props => [];
}

class onUnSelectFavProductEvent extends ProductEvent {
  final int? id;
  const onUnSelectFavProductEvent(this.id);
// @override
// List<Object?> get props => [];
}

class onSelectProductByIDEvent extends ProductEvent {
  final int id;
  const onSelectProductByIDEvent({required this.id});
// @override
// List<Object?> get props => [];
}