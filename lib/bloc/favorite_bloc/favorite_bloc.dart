import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spwtest/data/product_json.dart';
import 'package:spwtest/model/cart_model.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<FavoriteEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<QueryGetFavoriteEvent>((event, emit) async{
      emit(FavoriteLoading());
      await Future.delayed(const Duration(seconds: 2));
      dataFavorite = products2.where((element) => element.isFavorite == true).toList();
      print('FP2 >>>${products2.length}');

      // products2.forEach((element) {
      //   if(element.isFavorite == true){
      //     dataFavorite.add(
      //         Product(
      //           id: element.id,
      //           title: element.title,
      //           price: element.price,
      //           imgUrl: element.imgUrl,
      //           qty: 1,
      //           isFavorite: element.isFavorite
      //     ));
      //   }else{
      //     dataFavorite.removeWhere((element) => element.isFavorite == false);
      //   }
      // });

      print('dataFavorite>>> ${dataFavorite.length}');

      // dataFavorite == products2.where((element) => element.isFavorite == true);


      emit(FavoriteHasData(dataFavorites: dataFavorite));
    });
  }
}
