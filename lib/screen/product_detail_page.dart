import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:spwtest/bloc/product_bloc/product_bloc.dart';
import 'package:spwtest/model/cart_model.dart';

class ProductDetailPage extends StatefulWidget {
  final int? id;
  const ProductDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  @override
  void initState() {
    // print('wID >>>${widget.id}');
    context.read<ProductBloc>().add(onSelectProductByIDEvent(id: widget.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: BlocBuilder<ProductBloc,ProductState>(
            builder: (context, state) {
              if(state is ProductLoading){
                return CircularProgressIndicator();
              }else if(state is ProductHasData){
                return Container(
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: state.productList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var name = state.productList[index].title;
                      var price = state.productList[index].price;
                      var img = state.productList[index].imgUrl;
                      var isFav = state.productList[index].isFavorite;

                      return ScopedModelDescendant<CartModel>(
                        builder: (context, child, model) {
                          return Column(
                            children: [
                              Stack(
                                children: [
                                  Image.network(
                                    img,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      iconSize: 50,
                                      icon: FaIcon(
                                        isFav ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                                        color: Colors.red,
                                      ),
                                      onPressed: (){
                                      },
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                                  child: Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),

                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "\$"+price.toString(),
                                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),
                                  )),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () => model.addProduct(state.productList[index]),
                                      child: Text('Add to cart'),
                                    style: ButtonStyle(
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        }
                      );
                    },
                  ),
                );
              }else{
                return Container();
              }
            }
        ),
      ),
    );
  }
}
