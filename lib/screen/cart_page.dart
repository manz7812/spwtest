import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:spwtest/model/cart_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.indigo,
        //   title: Text("Cart"),
        //   actions: <Widget>[
        //     ElevatedButton(
        //         child: Text(
        //           "Clear",
        //           style: TextStyle(color: Colors.white),
        //         ),
        //         onPressed: (){
        //           // print('${ScopedModel.of<CartModel>(context).total}');
        //           ScopedModel.of<CartModel>(context).clearCart();
        //         })
        //   ],
        // ),
        body: ScopedModel.of<CartModel>(context, rebuildOnChange: true)
            .cart.isEmpty
            ? Center(
                child: Text("No items in Cart"),
        )
            : Container(
                padding: EdgeInsets.all(8.0),
                child: Column(children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: ScopedModel.of<CartModel>(context,
                          rebuildOnChange: false)
                          .total,
                      itemBuilder: (context, index) {
                        return ScopedModelDescendant<CartModel>(
                          builder: (context, child, model) {
                            return Slidable(
                              endActionPane: ActionPane(
                                extentRatio: 0.2,
                                  motion:  DrawerMotion(),
                                  // dismissible: DismissiblePane(onDismissed: () {  },),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context){
                                        model.removeProduct(model.cart[index]);
                                      },
                                      backgroundColor: Color(0xFFFE4A49),
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                      flex: 5,
                                      // spacing: 2,
                                    ),
                                    // SlidableAction(
                                    //   onPressed: (context){},
                                    //   backgroundColor: Color(0xFF21B7CA),
                                    //   foregroundColor: Colors.white,
                                    //   icon: Icons.share,
                                    //   label: 'Share',
                                    // ),
                                  ]
                              ),
                              child: ListTile(
                                leading: Image.network(
                                  model.cart[index].imgUrl,
                                  fit: BoxFit.fill,
                                  // width: double.infinity,
                                  height: 200,
                                ),
                                title: Text(model.cart[index].title),
                                subtitle: Text(model.cart[index].qty.toString() +
                                    " x " +
                                    model.cart[index].price.toString() +
                                    " = \$" +
                                    (model.cart[index].qty *
                                        model.cart[index].price)
                                        .toString()),
                                trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextButton(
                                          style: ButtonStyle(
                                              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                                              foregroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(0.0),
                                                      side: BorderSide(color: Colors.deepPurpleAccent)
                                                  )
                                              )
                                          ),
                                          child: Icon(Icons.add),
                                          onPressed: () {
                                            model.updateProduct(model.cart[index],
                                                model.cart[index].qty + 1);
                                            // model.removeProduct(model.cart[index]);
                                          },
                                      ),
                                      // IconButton(
                                      //   icon: Icon(Icons.add),
                                      //   onPressed: () {
                                      //     model.updateProduct(model.cart[index],
                                      //         model.cart[index].qty + 1);
                                      //     // model.removeProduct(model.cart[index]);
                                      //   },
                                      // ),
                                      TextButton(
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                                            foregroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(0.0),
                                                    side: BorderSide(color: Colors.deepPurpleAccent)
                                                )
                                            )
                                        ),
                                        child: Icon(Icons.remove),
                                        onPressed: () {
                                          model.updateProduct(model.cart[index],
                                              model.cart[index].qty - 1);
                                          // model.removeProduct(model.cart[index]);
                                        },
                                      ),
                                      // IconButton(
                                      //
                                      //   icon: Icon(Icons.remove),
                                      //
                                      //   onPressed: () {
                                      //     model.updateProduct(model.cart[index],
                                      //         model.cart[index].qty - 1);
                                      //     // model.removeProduct(model.cart[index]);
                                      //   },
                                      //   style: ButtonStyle(
                                      //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      //           RoundedRectangleBorder(
                                      //               borderRadius: BorderRadius.zero,
                                      //               side: BorderSide(color: Colors.red)
                                      //           )
                                      //       ),
                                      //     backgroundColor: MaterialStateProperty.all<Color>(Colors.red)
                                      //   )
                                      // ),
                                    ]),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),

                  Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Total: \$ " +
                            ScopedModel.of<CartModel>(context,
                                rebuildOnChange: true)
                                .totalCartValue
                                .toString() +
                            "",
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      )),

                  SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    // color: Colors.yellow[900],
                    // textColor: Colors.white,
                    // elevation: 0,
                    child: Text("BUY NOW"),
                    onPressed: () {},
                  )),
            ]))
    );
  }
}
