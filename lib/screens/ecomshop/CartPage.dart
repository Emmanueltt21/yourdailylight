import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';
import 'package:yourdailylight/screens/ecomshop/PaymentPage.dart';

import '../../auth/LoginScreen.dart';
import '../../models/Userdata.dart';
import '../../providers/AppStateManager.dart';
import '../../providers/cart_provider.dart';
import '../../utils/my_colors.dart';
import '../../widgets/widget_church.dart';

import 'package:yourdailylight/screens/ecomshop/widgets_cart.dart';


class CartPage extends StatefulWidget {
    const CartPage({Key? key}) : super(key: key);

    @override
    State<CartPage> createState() => _CartPageState();
  }

  class _CartPageState extends State<CartPage> {
    //final List<SneakerShoppingModel> list = getAllCart();
   // final List<SneakerShoppingModel> list = getAllCart();
    late AppStateManager appManager;
    bool isUserLogin = false;
    String mUserEmail = "";

    @override
    void initState() {
      super.initState();
      init();
    }

    void init() async {
      //check if user is currently login
      appManager = Provider.of<AppStateManager>(context);
      Userdata? userdata = appManager.userdata;
      if(userdata != null && userdata.email != ""){
        isUserLogin = true;
        mUserEmail = userdata.email!;
        print('user is logged in ');
      }else{
        isUserLogin = false;
      }

  }

    @override
    void setState(fn) {
      if (mounted) super.setState(fn);
    }



    @override
    Widget build(BuildContext context) {
      final cartProvider = Provider.of<CartProvider>(context);
      init();
      return Scaffold(
       /* appBar: AppBar(
          backgroundColor: MyColors.accentDark,
          title: Text('My Cart'),
          centerTitle: true,
        ),*/
        appBar: _appBar(cartProvider),
        body: appBoby(cartProvider),

        bottomSheet: Container(
          padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 16),
          height: 170,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            //color: context.cardColor,
            boxShadow: defaultBoxShadow(),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${cartProvider.itemCount} items', style: secondaryTextStyle()),
                    Text('\$ ${cartProvider.totalAmount.roundToDouble()}', style: boldTextStyle()),
                  ],
                ),
                SizedBox(height: 16),
                Divider(color: Colors.grey, height: 1),
                SizedBox(height: 16),
                sSAppButton(
                  context: context,
                  color: MyColors.accentDark,
                  onPressed: () {
                    if(isUserLogin){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentPage(
                        mAmount: '${cartProvider.totalAmount.roundToDouble()}',
                        userEmail: mUserEmail,
                        mBookIds: '${cartProvider.allBookIds}',

                      )),
                    );
                  }else{
                    //user is not login
                     // alert user to login
                      print("alert user to login");
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          alignment: Alignment.center,
                          title: const Text("ALERT"),
                          content: const Text("Your are Currently Not Login, Please Login to Proceed "),
                          actions: <Widget>[
                            sSAppButton(
                              color: MyColors.accentDark,
                              context: context,
                              title: 'Login Now',
                              onPressed: () {
                                Navigator.of(ctx).pop();
                                Navigator.pushNamed(
                                    context, LoginScreen.routeName);
                              },
                            ),
                            /*sSAppButton(
                              color: MyColors.accentDark,
                              context: context,
                              title: 'Back',
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                            )*/
                          ],
                        ),
                      );


                }
                },
                  title: 'Checkout',
                ),
              ],
            ),
          ),
        ),

      );
    }

    Container appBoby(CartProvider cartProvider) {
      return Container(
        child: ListView.builder(
            itemCount: cartProvider.cartItems.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final item = cartProvider.cartItems.values.toList()[index];
              return CartItem(
                id: "${item.productName}",
                cartItemName: "${item.productName}",
                quantity: "${item.quantity}".toInt(),
                price: "${item.price}".toDouble(),
                imageName: "${item.imageName}"
              );
            }),
      );
    }



    /*Consumer<CartProvider> _buildBody(CartProvider cartProvider) {
      return Consumer<CartProvider>(
        child: Center(
          child: Text('No items in your cart'),
        ),
        builder: (context, cart, ch) {
          return cartProvider.cartItems.length <= 0
              ? ch
              : ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: cartProvider.cartItems.length,
            itemBuilder: (context, index) {
              final item = cartProvider.cartItems.values.toList()[index];

              return CartItem(
                id: cartProvider.cartItems.keys.toList()[index],
                cartItemName: item.productName,
                quantity: item.quantity,
                price: item.price,
                imageName: item.imageName,
              );
            },
          );
        },
      );
    }
*/



    AppBar _appBar(CartProvider cartProvider) {
      return AppBar(
        centerTitle: true,
        title: cartProvider.itemCount == 0
            ? Text('My Cart')
            : Text('My Cart (${cartProvider.itemCount})'),
      );
    }
  }


