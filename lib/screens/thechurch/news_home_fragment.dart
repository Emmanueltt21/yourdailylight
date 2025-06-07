import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:html/parser.dart' show parse;

import '../../i18n/strings.g.dart';
import '../../models/News.dart';
import '../../providers/AppStateManager.dart';
import '../../providers/NewsScreensModel.dart';
import '../../utils/langs.dart';
import '../../utils/my_colors.dart';
import '../../widgets/widget_church.dart';
import '../DrawerScreen.dart';
import '../NoitemScreen.dart';
import '../screen_widget/NBNewsDetailsScreen.dart';

class NewsHomeFragment extends StatelessWidget {
  static const routeName = "/newhome";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewScreensModel(
        Provider.of<AppStateManager>(context, listen: false).userdata,
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(t.appname_label, style: TextStyle(color: Colors.white))),
        body: Padding(padding: EdgeInsets.only(top: 12), child: NewsScreenBody()),
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75, // 3/4 of screen width
          child: Drawer(
            child: DrawerScreen(), // Your custom drawer content
          ),
        ),
      ),
    );
  }
}

class NewsScreenBody extends StatefulWidget {
  @override
  _NewsScreenBodyState createState() => _NewsScreenBodyState();
}

class _NewsScreenBodyState extends State<NewsScreenBody> {
  late NewScreensModel newsModel;
  late AppStateManager appManager;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<NewScreensModel>(context, listen: false).loadItems();
    });
  }

  void _onRefresh() => newsModel.loadItems();
  void _onLoading() => newsModel.loadMoreItems();

  List<News> getLocalizedNews(List<News> items) {
    appManager = Provider.of<AppStateManager>(context);
    String lang = appLanguageData[AppLanguage.values[appManager.preferredLanguage]]!['name']!;

    return items.map((item) {
      switch (lang) {
        case 'French':
          return item.copyWith(title: item.french_title, content: item.french_content);
        case 'German':
          return item.copyWith(title: item.german_title, content: item.german_content);
        default:
          return item;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    newsModel = Provider.of<NewScreensModel>(context);
    List<News> items = getLocalizedNews(newsModel.mediaList ?? []);

    if (newsModel.isError && items.isEmpty) {
      return NoitemScreen(
        title: t.oops,
        message: t.dataloaderror,
        onClick: _onRefresh,
      );
    }

    return SmartRefresher(
      controller: newsModel.refreshController,
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      footer: CustomFooter(
        builder: (context, mode) {
          String text = {
            LoadStatus.idle: t.pulluploadmore,
            LoadStatus.loading: "",
            LoadStatus.failed: t.loadfailedretry,
            LoadStatus.canLoading: t.releaseloadmore,
          }[mode] ?? t.nomoredata;

          return Container(
            height: 55,
            child: Center(
              child: mode == LoadStatus.loading
                  ? CupertinoActivityIndicator()
                  : Text(text),
            ),
          );
        },
      ),
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView.builder(
        itemCount: items.length,
        padding: EdgeInsets.all(8),
        itemBuilder: (_, i) => NewsItemTile(news: items[i]),
      ),
    );
  }
}

class NewsItemTile extends StatelessWidget {
  final News news;

  const NewsItemTile({required this.news});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () => NBNewsDetailsScreen(newsDetails: news).launch(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CachedNetworkImage(
              imageUrl: news.thumbnail ?? '',
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    news.title?.toUpperCase() ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: MyColors.accentDark,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    _parseHtmlString(news.content ?? ''),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Text(
                    t.read_more,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyColors.accentDark,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _parseHtmlString(String html) {
  final document = parse(html);
  return parse(document.body?.text ?? '').documentElement?.text ?? '';
}
