import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spwtest/data/product_json.dart';
import 'package:spwtest/model/cart_model.dart';
import 'package:spwtest/model/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<QueryGetProductEvent>((event, emit) async{
      emit(ProductLoading());

      await Future.delayed(const Duration(seconds: 2));

      final product = ProductModel.fromJson(dataProduct);
      print('P2 >>>>> ${products2.length}');
      // products2.clear();
      // print('>>>>> ${product.productItems.length}');

      int idProduct = 0;
      String? name;
      double? price;
      String? img;
      bool? isFavorite;
      List productItem = [];
      var res;

      if(products2.isNotEmpty){
        emit(ProductHasData(productList: products2));
      }else if(products2.length<=1){
        for (var element in product.productItems) {
          idProduct = element.id;
          name = element.name;
          img = element.imageUrl;
          price = element.price;
          isFavorite = element.isFavorite;
          products2.add(
              Product(
                  id: idProduct,
                  title: element.name,
                  price: element.price,
                  imgUrl: element.imageUrl,
                  qty: 1,
                  isFavorite: element.isFavorite
              )
          );

          // productItem.add(
          //   {
          //     'id' : element.id,
          //     'name': element.name,
          //     'img': element.imageUrl,
          //     'price': element.price,
          //     'favorite': element.isFavorite
          //   }
          // );
        }

        emit(ProductHasData(productList: products2));

      }else{
        for (var element in product.productItems) {
          idProduct = element.id;
          name = element.name;
          img = element.imageUrl;
          price = element.price;
          isFavorite = element.isFavorite;
          products2.add(
              Product(
                  id: idProduct,
                  title: element.name,
                  price: element.price,
                  imgUrl: element.imageUrl,
                  qty: 1,
                  isFavorite: element.isFavorite
              )
          );

          // productItem.add(
          //   {
          //     'id' : element.id,
          //     'name': element.name,
          //     'img': element.imageUrl,
          //     'price': element.price,
          //     'favorite': element.isFavorite
          //   }
          // );
        }

        emit(ProductHasData(productList: products2));
      }



    });

    on<onSelectFavProductEvent>((event, emit) {
      // emit(ProductLoading());

      print('id>>>${event.id}');
      print('PIDb>>>${event.product.id}');
      int index = products2.indexWhere((i) => i.id == event.product.id);
      products2[index].isFavorite = event.product.isFavorite;
      if (products2[index].isFavorite == true){
        print('if');
        products2[index].isFavorite = false;
        // dataFavorite.remove(products2[index]);
      }else{
        print('else');
        products2[index].isFavorite = true;
        // dataFavorite.add(products2[index]);
      }

      emit(ProductHasData(productList: products2));


    });

    on<onSelectProductByIDEvent>((event, emit) async{
      emit(ProductLoading());

      await Future.delayed(const Duration(seconds: 2));

      dataByID = products2.where((element) => element.id == event.id).toList();
      print('dataByID >>>${dataByID.length}');

      emit(ProductHasData(productList: dataByID));
    });
  }
}

class productEntity {
  String name;
  String img;
  double price;
  productEntity({
    required this.name,
    required this.img,
    required this.price,
  });
}