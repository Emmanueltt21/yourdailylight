import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';
import '../models/Inbox.dart';
import '../providers/InboxProvider.dart';
import '../utils/TextStyles.dart';
import '../utils/TimUtil.dart';
import 'NoitemScreen.dart';
import '../i18n/strings.g.dart';

class InboxViewerScreen extends StatefulWidget {
  static const routeName = "/inboxviewer";
  const InboxViewerScreen({Key? key, this.inbox}) : super(key: key);
  final Inbox? inbox;

  @override
  _InboxViewerScreenState createState() => _InboxViewerScreenState();
}

class _InboxViewerScreenState extends State<InboxViewerScreen> {
  bool isLoading = false;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.inbox?.id != null && mounted) {
        try {
          Provider.of<InboxProvider>(context, listen: false).markAsRead(widget.inbox!.id!);
        } catch (e) {
          debugPrint("Error marking inbox item as read in viewer: $e");
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.notifications, style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: SingleChildScrollView(
          child: getEventsBody(),
        ),
      ),
    );
  }

  Widget getEventsBody() {
    if (isLoading) {
      return const SizedBox(
        height: 600,
        child: Center(
          child: CupertinoActivityIndicator(
            radius: 20,
          ),
        ),
      );
    } else if (isError || widget.inbox == null) {
      return SizedBox(
        height: 600,
        child: Center(
          child: NoitemScreen(
              title: t.oops,
              message: t.dataloaderror,
              onClick: () {
                //loadItems();
              }),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(widget.inbox!.title!,
                  textAlign: TextAlign.start,
                  style: TextStyles.headline(context)
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(TimUtil.formatFullDatestamp(widget.inbox!.date!),
                  textAlign: TextAlign.justify,
                  style: TextStyles.subhead(context).copyWith(fontSize: 16)),
            ),
            const SizedBox(height: 20),
            HtmlWidget(
              widget.inbox!.message!,
              textStyle: TextStyles.medium(context).copyWith(fontSize: 20),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    }
  }
}
