part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object?> get props => [];
}

class QueryGetFavoriteEvent extends FavoriteEvent {
  // final String? data;
  const QueryGetFavoriteEvent();
// @override
// List<Object?> get props => [];
}
