import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
//import 'package:ecommerce_test/api/rest_api.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';
import '../../widgets/widget_church.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String cartItemName;
  final int quantity;
  final double price;
  final String imageName;
  CartItem({
    required this.id,
    required this.cartItemName,
    required this.quantity,
    required this.price,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);



    return Card(
      elevation: 4,
      child: Row(
        children: [
          //Image.asset(NBNewsImage1, height: 120, width: 80, fit: BoxFit.cover,),
          commonCachedNetworkImage(
            '${imageName}',
            height: 100,
            width: 70,
            fit: BoxFit.cover,
          ).cornerRadiusWithClipRRect(0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${cartItemName}',
                style: boldTextStyle(),).paddingOnly(left: 8.0, right: 8, top: 8),
              //Text('${widget.object.category!}',style: primaryTextStyle(size: 12),).paddingOnly(left: 8.0, right: 8, top: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Text('12-20-2022',style: primaryTextStyle(size: 14),).paddingOnly(left: 8.0, right: 8, top: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      '\$${price}',
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: boldTextStyle(size: 18),
                    ),
                  ),
                  SizedBox(width: 32),
                  IconButton(
                    onPressed: () {
                      cart.removeItem(id);
                    },
                    icon: Icon(Icons.delete),
                  ),

                ],
              ),
            ],
          ).expand()
        ],
      ).paddingAll(8.0),
    );
  }
}
