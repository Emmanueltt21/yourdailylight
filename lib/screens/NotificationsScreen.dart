import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../models/Inbox.dart';
import '../models/ScreenArguements.dart';
import '../providers/InboxProvider.dart';
import '../utils/TimUtil.dart';
import '../utils/my_colors.dart';
import '../utils/TextStyles.dart';
import '../i18n/strings.g.dart';
import 'InboxViewerScreen.dart';
import 'NoitemScreen.dart';

class NotificationsScreen extends StatelessWidget {
  static const routeName = "/notifications";

  @override
  Widget build(BuildContext context) {
    return _NotificationsScaffold();
  }
}

class _NotificationsScaffold extends StatefulWidget {
  @override
  State<_NotificationsScaffold> createState() => _NotificationsScaffoldState();
}

class _NotificationsScaffoldState extends State<_NotificationsScaffold> {
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<InboxProvider>(context, listen: false);
      if (provider.items.isEmpty) {
        provider.loadItems();
      }
    });
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh(InboxProvider provider) async {
    await provider.loadItems();
    _refreshController.refreshCompleted();
  }

  void _onLoading(InboxProvider provider) async {
    await provider.loadMoreItems();
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InboxProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Row(
          children: [
            Text(t.notifications, style: TextStyle(color: Colors.white),),
            if (provider.unreadCount > 0) ...[
              SizedBox(width: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${provider.unreadCount} new',
                  style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ],
        ),
        actions: [
          if (provider.unreadCount > 0)
            TextButton(
              onPressed: () async {
                await provider.markAllAsRead();
              },
              child: Text('Mark all read', style: TextStyle(color: Colors.white, fontSize: 13)),
            ),
        ],
      ),
      body: _buildBody(context, provider),
    );
  }

  Widget _buildBody(BuildContext context, InboxProvider provider) {
    if (provider.isLoading && provider.items.isEmpty) {
      return Center(child: CupertinoActivityIndicator(radius: 16));
    }

    if (provider.isError && provider.items.isEmpty) {
      return NoitemScreen(
        title: t.oops,
        message: t.dataloaderror,
        onClick: () => provider.loadItems(),
      );
    }

    if (provider.items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.notifications_none, size: 64, color: Colors.grey[400]),
            SizedBox(height: 12),
            Text('No notifications yet', style: TextStyle(color: Colors.grey[500], fontSize: 16)),
          ],
        ),
      );
    }

    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: !provider.isLastPage,
      header: WaterDropHeader(),
      footer: CustomFooter(
        builder: (context, mode) {
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
          return Container(height: 55, child: Center(child: body));
        },
      ),
      controller: _refreshController,
      onRefresh: () => _onRefresh(provider),
      onLoading: () => _onLoading(provider),
      child: ListView.builder(
        itemCount: provider.items.length,
        padding: EdgeInsets.symmetric(vertical: 8),
        itemBuilder: (context, index) {
          final item = provider.items[index];
          final isRead = item.id != null && provider.isRead(item.id!);
          return _NotificationTile(
            inbox: item,
            isRead: isRead,
            onTap: () async {
              if (item.id != null) await provider.markAsRead(item.id!);
              Navigator.of(context).pushNamed(
                InboxViewerScreen.routeName,
                arguments: ScreenArguements(
                  position: 0,
                  items: item,
                  itemsList: [],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final Inbox inbox;
  final bool isRead;
  final VoidCallback onTap;

  const _NotificationTile({
    Key? key,
    required this.inbox,
    required this.isRead,
    required this.onTap,
  }) : super(key: key);

  Color _avatarColor() {
    final colors = [
      Color(0xFF006087),
      Color(0xFF2E7D32),
      Color(0xFF6A1B9A),
      Color(0xFFC62828),
      Color(0xFF1565C0),
      Color(0xFF4E342E),
    ];
    final seed = (inbox.id ?? 0) % colors.length;
    return colors[seed];
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: isRead ? Colors.transparent : MyColors.primary.withOpacity(0.05),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Unread dot indicator
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 8),
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isRead ? Colors.transparent : MyColors.primary,
                ),
              ),
            ),
            // Avatar
            CircleAvatar(
              radius: 22,
              backgroundColor: _avatarColor(),
              child: Text(
                inbox.title != null && inbox.title!.isNotEmpty
                    ? inbox.title!.substring(0, 1).toUpperCase()
                    : '?',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(width: 12),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          inbox.title ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.subhead(context).copyWith(
                            fontSize: 15,
                            fontWeight: isRead ? FontWeight.w400 : FontWeight.w700,
                            color: isRead ? Colors.black87 : Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        TimUtil.formatTimestamp(inbox.date ?? 0),
                        style: TextStyle(
                          fontSize: 11,
                          color: isRead ? Colors.grey[400] : MyColors.primary,
                          fontWeight: isRead ? FontWeight.normal : FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    TimUtil.formatDatestamp(inbox.date ?? 0),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 4),
            Icon(Icons.chevron_right, color: Colors.grey[400], size: 20),
          ],
        ),
      ),
    );
  }
}
