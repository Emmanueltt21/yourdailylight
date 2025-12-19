import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:yourdailylight/screens/ecomshop/CartPage.dart';
import 'package:yourdailylight/utils/ApiUrl.dart';
import 'package:yourdailylight/utils/utils.dart';

import '../../../main.dart';
import '../../models/Books.dart';
import '../../providers/NBDataProviders.dart';
import '../../providers/cart_provider.dart';
import '../../utils/my_colors.dart';
import '../../widgets/widget_church.dart';
import '../BrowserTabScreen.dart';
import '../screen_widget/AddToCartBottomSheet.dart';

class SSDetailScreen extends StatefulWidget {
  final Books? newsDetails;

  SSDetailScreen({this.newsDetails});


  @override
  SSDetailScreenState createState() => SSDetailScreenState();
}

class SSDetailScreenState extends State<SSDetailScreen> {


  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: _appBar(cartProvider),
      body:  SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(), // smooth scrolling
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.6)),
                child: Column(
                  children: [
                    commonCachedNetworkImage(
                      widget.newsDetails?.thumbnail,
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.contain,
                    ),

                    SizedBox(height: 16),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   // Text("Title", textAlign: TextAlign.start, overflow: TextOverflow.clip, style: secondaryTextStyle()),
                   // SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child: Text("${widget.newsDetails?.b_title}", textAlign:
                        TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle(size: 18))),
                       // Text("\$${widget.newsDetails?.amount}", textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle()),
                      ],
                    ),
                    SizedBox(height: 16),
                   // Text("${widget.newsDetails?.author}", textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle(size: 14)),
                  //  SizedBox(height: 8),
                    Text(Utils.kmDateFormatter(widget.newsDetails!.date??""), textAlign: TextAlign.left, overflow: TextOverflow.clip, style: boldTextStyle(size: 12)),

                    SizedBox(height: 16, width: 16),
                  //  Text("Description", textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle()),
                    SizedBox(height: 8),
                    HtmlWidget(
                        "${widget.newsDetails?.b_desc}",
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
     /* bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey.withOpacity(0.5)), borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.all(8),
              child: Icon(Icons.shopping_cart_outlined),
            ).onTap((){
              //Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()),);
              //String productId, String productName, int quantity //       double price, String imageName
              cartProvider.addToCart(
                widget.newsDetails!.id.toString(),
                widget.newsDetails!.b_name!,
                1,
                widget.newsDetails!.amount.toDouble(),
                widget.newsDetails!.thumbnail.toString(),
              );
              setState(() {});

            }),
            SizedBox(width: 8),
            Expanded(
              child: sSAppButton(
                color: MyColors.accentDark,
                context: context,
                title: 'Buy Now',
                onPressed: () {
                  cartProvider.addToCart(
                    widget.newsDetails!.id.toString(),
                    widget.newsDetails!.b_name!,
                    1,
                    widget.newsDetails!.amount.toDouble(),
                    widget.newsDetails!.thumbnail.toString(),
                  );
                  setState(() {});

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),*/

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              /*Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.grey.withOpacity(0.5)), borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.all(8),
                child: Icon(Icons.shopping_cart_outlined),
              ).onTap((){
                //Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()),);
                //String productId, String productName, int quantity //       double price, String imageName
                cartProvider.addToCart(
                  widget.newsDetails!.id.toString(),
                  widget.newsDetails!.b_name!,
                  1,
                  widget.newsDetails!.amount.toDouble(),
                  widget.newsDetails!.thumbnail.toString(),
                );
                setState(() {});

              }),
              SizedBox(width: 8),*/
              Expanded(
                child: sSAppButton(
                  color: MyColors.accentDark,
                  context: context,
                  title: 'Checkout ',
                  onPressed: () {
                    print('bookUrl --------->> ${widget.newsDetails?.bookUrl}');

                    openBrowserTab(context, widget.newsDetails!.b_name!,
                        widget.newsDetails!.bookUrl!.trim());
                    /*cartProvider.addToCart(
                      widget.newsDetails!.id.toString(),
                      widget.newsDetails!.b_name!,
                      1,
                      widget.newsDetails!.amount.toDouble(),
                      widget.newsDetails!.thumbnail.toString(),
                    );
                    setState(() {});

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                     */


                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar(CartProvider cartProvider) {
    return AppBar(
      centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero, side: BorderSide(color: Color(0x00000000), width: 1)),
        leading: InkWell(
          onTap: () {
            finish(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
        ),
      title:Text('${widget.newsDetails?.b_title}' , style: primaryTextStyle(color: Colors.white)),
      /*actions: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
              icon: const Icon(
                Icons.shopping_cart_rounded,
                size: 30,
              ),
            ),
            Positioned(
              top: 4,
              right: 6,
              child: Container(
                height: 22,
                width: 22,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
                child:  Center(
                    child: Text(
                      "${cartProvider.itemCount}",
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              )
            ),
          ],
        ),
      ],*/
    );

  }

}
