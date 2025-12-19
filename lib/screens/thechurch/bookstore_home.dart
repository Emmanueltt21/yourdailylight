import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../i18n/strings.g.dart';
import '../../models/Books.dart';
import '../../providers/AppStateManager.dart';
import '../../providers/BookstoreScreensModel.dart';
import '../../providers/NBDataProviders.dart';
import '../../providers/cart_provider.dart';
import '../../utils/utils.dart';
import '../../widgets/widget_church.dart';
import '../NoitemScreen.dart';
import '../ecomshop/CartPage.dart';
import 'SSDetailScreen.dart';

class BookStoreHome extends StatefulWidget {
  const BookStoreHome({Key? key}) : super(key: key);

  @override
  State<BookStoreHome> createState() => _BookStoreHomeState();
}

class _BookStoreHomeState extends State<BookStoreHome> {

  @override
  void initState() {
    super.initState();
  }


  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }



  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => BookStoreScreensModel(
          Provider.of<AppStateManager>(context, listen: false).userdata),
      child: Scaffold(
       /* appBar: AppBar(
          title: Text('Book Store'),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.add_shopping_cart, color: Colors.white,)
            ).onTap((){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            }),
          ],
        ),*/
        appBar: _appBar(cartProvider),
        body: Padding(
          padding: EdgeInsets.only(top: 12),
          child: BookScreenBody(),
        ),
      ),
    );
  }


  AppBar _appBar(CartProvider cartProvider) {
    return AppBar(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero, side: BorderSide(color: Color(0x00000000), width: 1)),
      title:Text('Book Store', style: const TextStyle(color: Colors.white),),
      actions: [
      /*  Stack(
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
        ),*/
      ],
    );

  }



}



class BookScreenBody extends StatefulWidget {
  @override
  NewsScreenBodyRouteState createState() => new NewsScreenBodyRouteState();
}

class NewsScreenBodyRouteState extends State<BookScreenBody> {
  late BookStoreScreensModel bookScreensModel;
  List<Books>? items;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PageController? pageController;
  int pageIndex = 0;



  void _onRefresh() async {
    bookScreensModel.loadItems();
  }

  void _onLoading() async {
    bookScreensModel.loadMoreItems();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0), () {
      Provider.of<BookStoreScreensModel>(context, listen: false).loadItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    bookScreensModel = Provider.of<BookStoreScreensModel>(context);
    items = bookScreensModel.mediaList;

    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text(t.pulluploadmore);
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text(t.loadfailedretry);
          } else if (mode == LoadStatus.canLoading) {
            body = Text(t.releaseloadmore);
          } else {
            body = Text(t.nomoredata);
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: bookScreensModel.refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: (bookScreensModel.isError == true && items!.length == 0)
          ? NoitemScreen(
          title: t.oops, message: t.dataloaderror, onClick: _onRefresh)
          : SafeArea(
            child: ListView.builder(
                    itemCount: items!.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
            return BookItemTile(
              mediaList: items!,
              index: index,
              object: items![index],
            );
                    },
                  ),
          ),
    );
  }
}





class BookItemTile extends StatefulWidget {
  final Books object;
  final List<Books> mediaList;
  final int index;

  const BookItemTile({
    Key? key,
    required this.mediaList,
    required this.index,
    required this.object,
  }) : super(key: key);

  @override
  _ItemTileState createState() => _ItemTileState();
}

class _ItemTileState extends State<BookItemTile> {
  @override
  Widget build(BuildContext context) {
    Books mData = widget.object;
    return Padding(
      padding: EdgeInsets.only(top: 2, bottom: 2, left: 4, right: 4),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          SSDetailScreen(newsDetails: mData).launch(context);
        },
        child:  Card(
          elevation: 4,
          child: Row(
            children: [
              //Image.asset(NBNewsImage1, height: 120, width: 80, fit: BoxFit.cover,),
              commonCachedNetworkImage(
                '${widget.object.thumbnail!}',
                height: 120,
                width: 90,
                fit: BoxFit.cover,
              ).cornerRadiusWithClipRRect(0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${widget.object.b_title!}',
                    style: boldTextStyle(),).paddingOnly(left: 8.0, right: 8, top: 8),
               //   Text('${widget.object.category!}',style: primaryTextStyle(size: 12),).paddingOnly(left: 8.0, right: 8, top: 8),
                 Text('Simon T Mungwa',style: primaryTextStyle(size: 12),).paddingOnly(left: 8.0, right: 8, top: 8),
              //   Text('${widget.object.author!}',style: primaryTextStyle(size: 12),).paddingOnly(left: 8.0, right: 8, top: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(Utils.kmDateFormatter(widget.object.date??""),style: primaryTextStyle(size: 14),).paddingOnly(left: 8.0, right: 8, top: 8),
                      SizedBox(width: 32),
                     /* Text(
                        '\$${widget.object.amount!}',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: boldTextStyle(size: 18),
                      ),*/

                    ],
                  ),
                ],
              ).expand()
            ],
          ).paddingAll(8.0),
        ),
      ),
    );

  }


}




class SneakerShoppingModel {
  String? name;
  String? subtitle;
  String? img;
  String? amount;

  SneakerShoppingModel({this.name, this.img, this.subtitle, this.amount});
}
