import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:spwtest/bloc/favorite_bloc/favorite_bloc.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    context.read<FavoriteBloc>().add(const QueryGetFavoriteEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if(state is FavoriteLoading){
            return CircularProgressIndicator();
          }else if(state is FavoriteHasData){
            print('FFF>>>${state.dataFavorites.length}');
            return state.dataFavorites.length >0
            ?Container(
              padding: EdgeInsets.all(0),
              child: GridView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: state.dataFavorites.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.8
                ),
                itemBuilder: (context, index){
                  var name = state.dataFavorites[index].title;
                  var price = state.dataFavorites[index].price;
                  var img = state.dataFavorites[index].imgUrl;
                  var isFav = state.dataFavorites[index].isFavorite;


                  return isFav ? Card(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          children: [
                            Image.network(
                              img,
                              height: 130, width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                                bottom: 65,
                                right: 5,
                                child: IconButton(
                                  iconSize: 50,
                                  icon: FaIcon(
                                    isFav ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                                    color: Colors.red,
                                  ),
                                  onPressed: (){},
                                )
                            )
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                            child: Text(
                              name,
                              style: TextStyle(fontWeight: FontWeight.bold),)),
                        Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                                "\$"+price.toString()
                            )
                        ),

                        // ElevatedButton(onPressed: () => model.addProduct(state.productList[index]),child: Text("Add"),),
                      ]))
                      : Container();
                },
              ),

            )
            :Center(
              child: Text('No data'),
            );
          }else{
            return Center(
              child: Text('No data'),
            );
          }
        }
    );
  }
}
