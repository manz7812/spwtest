
import 'package:get_it/get_it.dart';
import 'package:spwtest/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:spwtest/model/cart_model.dart';

import 'bloc/product_bloc/product_bloc.dart';

final locator = GetIt.instance;

void init() {

  // locator.registerFactory<CartModel>(() => CartModel());
  if (!locator.isRegistered<ProductBloc>()) {
    locator.registerFactory(() => ProductBloc()
    );
  }

  if (!locator.isRegistered<FavoriteBloc>()) {
    locator.registerFactory(() => FavoriteBloc()
    );
  }
  //
  // if (!locator.isRegistered<GetdataToDoUsecase>()) {
  //   locator.registerFactory(() => GetdataToDoUsecase(taskTodo: locator()));
  // }
  //
  // if (!locator.isRegistered<GetdataToDoByPamUsecase>()) {
  //   locator.registerFactory(() => GetdataToDoByPamUsecase(taskTodoByParam: locator()));
  // }
  //
  // if (!locator.isRegistered<TaskToDoRemoteDataSource>()) {
  //   locator.registerLazySingleton<TaskToDoRemoteDataSource>(() => TaskToDoRemoteDataSourceImpl());
  // }


  // if (!locator.isRegistered<TaskToDoRemoteDataSource>()) {
  //   locator.registerLazySingleton<TaskToDoRemoteDataSource>(() => TaskToDoRemoteDataSource());
  // }
}