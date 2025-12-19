import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yourdailylight/screens/thechurch/SSDetailScreenLibrary.dart';

import '../../i18n/strings.g.dart';
import '../../models/Books.dart';
import '../../providers/AppStateManager.dart';
import '../../providers/LibraryScreensModel.dart';
import '../../providers/NBDataProviders.dart';
import '../../utils/my_colors.dart';
import '../../widgets/widget_church.dart';
import '../NoitemScreen.dart';
import 'bookstore_home.dart';



class MyLibrary extends StatefulWidget {
  const MyLibrary({Key? key}) : super(key: key);

  @override
  State<MyLibrary> createState() => _MyLibraryState();
}

class _MyLibraryState extends State<MyLibrary> {

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LibraryScreensModel(
          Provider.of<AppStateManager>(context, listen: false).userdata),
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Library ', style: TextStyle(color: Colors.white),),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 12),
          child: LibraryScreenBody(),
        ),
      ),
    );
  }
}


class LibraryScreenBody extends StatefulWidget {
  @override
  NewsScreenBodyRouteState createState() => new NewsScreenBodyRouteState();
}

class NewsScreenBodyRouteState extends State<LibraryScreenBody> {
  late LibraryScreensModel bookScreensModel;
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
      Provider.of<LibraryScreensModel>(context, listen: false).loadItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    bookScreensModel = Provider.of<LibraryScreensModel>(context);
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
            return LibraryItemTile(
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


class LibraryItemTile extends StatefulWidget {
  final Books object;
  final List<Books> mediaList;
  final int index;

  const LibraryItemTile({
    Key? key,
    required this.mediaList,
    required this.index,
    required this.object,
  }) : super(key: key);

  @override
  _ItemTileState createState() => _ItemTileState();
}

class _ItemTileState extends State<LibraryItemTile> {
  @override
  Widget build(BuildContext context) {
    Books mData = widget.object;
    return Padding(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            SSDetailScreenLibrary(newsDetails: mData).launch(context);
          },
          child: Card(
            elevation: 4,
            child: Row(
              children: [
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
                    Text('Available',style: primaryTextStyle(size: 12, color: Colors.green),).paddingOnly(left: 8.0, right: 8, top: 8),
                 //   Text('${widget.object.author!}',style: primaryTextStyle(size: 12),).paddingOnly(left: 8.0, right: 8, top: 8),
                    Text('${widget.object.date!}',style: primaryTextStyle(),).paddingOnly(left: 8.0, right: 8, top: 8),
                  ],
                ).expand()
              ],
            ).paddingAll(8.0),
          )
      ),
    );


  }
}




