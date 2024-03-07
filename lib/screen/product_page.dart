import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:spwtest/bloc/product_bloc/product_bloc.dart';
import 'package:spwtest/data/product_json.dart';
import 'package:spwtest/model/cart_model.dart';
import 'package:spwtest/screen/product_detail_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  void _toggleFavorite(index, product){
    print('PID>>>${product.id}');

    // print('P2>>>${products2.length}');
    // int index = products2.indexWhere((i) => i.id == product.id);
    // products2[index].isFavorite = product.isFavorite;
    context.read<ProductBloc>().add(onSelectFavProductEvent(id: index, product: product));
    // if (products2[index].isFavorite == true){
    //   print('if');
    //   products2[index].isFavorite = false;
    //   // dataFavorite.add(products2[index]);
    // }else{
    //   print('else');
    //   products2[index].isFavorite = true;
    //   // dataFavorite.add(products2[index]);
    // }
    setState(() {});
  }

  void _callback(){
    context.read<ProductBloc>().add(const QueryGetProductEvent());
    setState(() {});
  }

  List<Product> _products = [
    Product(
        id: 1,
        title: "Apple",
        price: 20.0,
        imgUrl: "https://img.icons8.com/plasticine/2x/apple.png",
        qty: 1),
    Product(
        id: 2,
        title: "Banana",
        price: 40.0,
        imgUrl: "https://img.icons8.com/cotton/2x/banana.png",
        qty: 1),
    Product(
        id: 3,
        title: "Orange",
        price: 20.0,
        imgUrl: "https://img.icons8.com/cotton/2x/orange.png",
        qty: 1),
    Product(
        id: 4,
        title: "Melon",
        price: 40.0,
        imgUrl: "https://img.icons8.com/cotton/2x/watermelon.png",
        qty: 1),
    Product(
        id: 5,
        title: "Avocado",
        price: 25.0,
        imgUrl: "https://img.icons8.com/cotton/2x/avocado.png",
        qty: 1),
  ];

  @override
  void initState() {
    context.read<ProductBloc>().add(const QueryGetProductEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if(state is ProductLoading){
          return CircularProgressIndicator();
        } else if(state is ProductHasData){
          // print('>>><<<${state.productList.length}');
          return Container(
            padding: EdgeInsets.all(0),
            child: GridView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: state.productList.length,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3,
                  childAspectRatio: (150.0 / 220.0),
              ),
              itemBuilder: (context, index){
                var name = state.productList[index].title;
                var price = state.productList[index].price;
                var img = state.productList[index].imgUrl;
                var isFav = state.productList[index].isFavorite;


                return ScopedModelDescendant<CartModel>(
                    builder: (context, child, model) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ProductDetailPage(id: state.productList[index].id),
                              // settings: RouteSettings(name: '/page2')
                          )).then((value) => _callback() );
                          // Navigator.pushNamed(
                          //     context, '/productdetail',
                          //   arguments: {'id':index});
                        },
                        child: Card(child: Column(
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
                                      onPressed: (){
                                        _toggleFavorite(index,state.productList[index]);
                                      },
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

                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: ElevatedButton(
                                  onPressed: (){
                                    model.addProduct(state.productList[index]);
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.success,
                                      // dialogBackgroundColor: Colors.orange,
                                      borderSide: BorderSide(color: Colors.green, width: 2),
                                      width: 350,
                                      buttonsBorderRadius: BorderRadius.all(Radius.circular(10)),
                                      headerAnimationLoop: false,
                                      animType: AnimType.scale,
                                      autoHide: Duration(seconds: 2),
                                      // dialogBackgroundColor: Colors.deepPurpleAccent,
                                      title: 'Success',
                                      desc: 'Successfully added to cart',
                                      showCloseIcon: false,
                                      btnOkText: "OK",
                                      // btnOkOnPress: () {},
                                    ).show();

                                  },
                                  child: Text("Add"),
                                ),
                              ),
                            ])),
                      );
                    });
              },
            ),

            // GridView.count(
            //   crossAxisCount: 2,
            //   mainAxisSpacing: 10,
            //   crossAxisSpacing: 10,
            //   childAspectRatio: 0.8,
            //   children: List.generate(state.productList.length, (index) {
            //     var id = state.productList[index]['id'];
            //     var name = state.productList[index]['name'];
            //     var price = state.productList[index]['price'];
            //     var img = state.productList[index]['img'];
            //     var favorite = state.productList[index]['favorite'];
            //     return Card(
            //       child: Container(
            //         // width: double.infinity,
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Stack(
            //               children: <Widget>[
            //                 Image.network(
            //                   img,
            //                   width: double.infinity,
            //                   height: 150,
            //                   fit: BoxFit.fill,
            //                 ),
            //                 Positioned(
            //                   bottom: 90,
            //                   right: 5,
            //                   child: IconButton(
            //                     iconSize: 50,
            //                     icon: FaIcon(
            //                       favorite ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
            //                       color: Colors.red,
            //                     ),
            //                     onPressed: (){
            //                       _toggleFavorite(index,id,favorite);
            //                     },
            //                     // onPressed: (){
            //                     //   print('>>>$index');
            //                     //   print('>>>$_isFavCount');
            //                     //   if(_isFavCount == index){
            //                     //     setState(() {
            //                     //       _isFavorite = true;
            //                     //     });
            //                     //   }
            //                     //
            //                     // },
            //                   )
            //                   // Icon(
            //                   //   Icons.favorite,
            //                   //   color: Colors.red,
            //                   //   size: 50,
            //                   // ),
            //                 ),
            //               ],
            //             ),
            //             Padding(
            //               padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            //               child: Text('$name'),
            //             ),
            //             Padding(
            //               padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            //               child: Text('\$${price}'),
            //             )
            //             // Text('$name')
            //           ],
            //         ),
            //       ),
            //     );
            //   }),
            // ),
          );

          return GridView.builder(
            padding: EdgeInsets.all(8.0),
            itemCount: _products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8, childAspectRatio: 0.8),
            itemBuilder: (context, index){
              return ScopedModelDescendant<CartModel>(
                  builder: (context, child, model) {
                    return Card( child: Column( children: <Widget>[
                      Image.network(_products[index].imgUrl, height: 120, width: 120,),
                      Text(_products[index].title, style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("\$"+_products[index].price.toString()),
                      ElevatedButton(onPressed: () => model.addProduct(_products[index]),child: Text("Add"),),
                      // OutlineButton(
                      //       child: Text("Add"),
                      //       onPressed: () => model.addProduct(_products[index]))
                    ]));
                  });
            },
          );


        } else{
          return Container();
        }
      });
  }
}

class ProductPage2 extends StatelessWidget {
  List<Product> _products = [
    Product(
        id: 1,
        title: "Apple",
        price: 20.0,
        imgUrl: "https://img.icons8.com/plasticine/2x/apple.png",
        qty: 1),
    Product(
        id: 2,
        title: "Banana",
        price: 40.0,
        imgUrl: "https://img.icons8.com/cotton/2x/banana.png",
        qty: 1),
    Product(
        id: 3,
        title: "Orange",
        price: 20.0,
        imgUrl: "https://img.icons8.com/cotton/2x/orange.png",
        qty: 1),
    Product(
        id: 4,
        title: "Melon",
        price: 40.0,
        imgUrl: "https://img.icons8.com/cotton/2x/watermelon.png",
        qty: 1),
    Product(
        id: 5,
        title: "Avocado",
        price: 25.0,
        imgUrl: "https://img.icons8.com/cotton/2x/avocado.png",
        qty: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Home"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          )
        ],
      ),
      body:
      GridView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: _products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8, childAspectRatio: 0.8),
        itemBuilder: (context, index){
          return ScopedModelDescendant<CartModel>(
              builder: (context, child, model) {
                return Card( child: Column( children: <Widget>[
                  Image.network(_products[index].imgUrl, height: 120, width: 120,),
                  Text(_products[index].title, style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("\$"+_products[index].price.toString()),
                  ElevatedButton(onPressed: () => model.addProduct(_products[index]),child: Text("Add"),),
                  // OutlineButton(
                  //       child: Text("Add"),
                  //       onPressed: () => model.addProduct(_products[index]))
                ]));
              });
        },
      ),

      // ListView.builder(
      //   itemExtent: 80,
      //   itemCount: _products.length,
      //   itemBuilder: (context, index) {
      //     return ScopedModelDescendant<CartModel>(
      //         builder: (context, child, model) {
      //       return ListTile(
      //           leading: Image.network(_products[index].imgUrl),
      //           title: Text(_products[index].title),
      //           subtitle: Text("\$"+_products[index].price.toString()),
      //           trailing: OutlineButton(
      //               child: Text("Add"),
      //               onPressed: () => model.addProduct(_products[index])));
      //     });
      //   },
      // ),

    );
  }
}

