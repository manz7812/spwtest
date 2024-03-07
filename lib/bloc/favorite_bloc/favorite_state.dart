part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  @override
  List<Object?> get props => [];

  const FavoriteState();
}

class FavoriteInitial extends FavoriteState {
  @override
  List<Object> get props => [];
}

class FavoriteLoading extends FavoriteState {
  FavoriteLoading();
}

class FavoriteHasData extends FavoriteState {
  final List dataFavorites;
  // final List<Product> productList;
  // final productEntity? listProductEntity;
  FavoriteHasData({required this.dataFavorites});

  @override
  List<Object?> get props => [dataFavorites];
}

class FavoriteError extends FavoriteState {
  String error;
  FavoriteError({required this.error});
  @override
  List<Object> get props => [error];
}