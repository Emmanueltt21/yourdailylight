import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../utils/Utility.dart';
import '../models/Comments.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/CommentsArguement.dart';
import '../providers/CommentsModel.dart';
import '../comments/RepliesScreen.dart';
import '../utils/TextStyles.dart';
import '../utils/TimUtil.dart';
import '../i18n/strings.g.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import 'package:flutter/material.dart';

class CommentsItem extends StatefulWidget {
  final bool isUser;
  final Comments object;
  final int index;
  final BuildContext context;

  const CommentsItem(
      {Key? key,
      required this.isUser,
      required this.index,
      required this.object,
      required this.context})
      : super(key: key);

  @override
  _CommentsItemState createState() => _CommentsItemState();
}

class _CommentsItemState extends State<CommentsItem> {
  int? repliesCount;

  @override
  void initState() {
    repliesCount = widget.object.replies;
    super.initState();
  }

  reportPost(int id, int index, String reason) {
    Provider.of<CommentsModel>(widget.context, listen: false)
        .reportComment(id, index, reason);
  }

  replyCommentScreen() async {
    var count = await Navigator.pushNamed(
      context,
      RepliesScreen.routeName,
      arguments: CommentsArguement(
          item: widget.object, commentCount: widget.object.replies),
    );
    setState(() {
      repliesCount = count as int?;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: IntrinsicHeight(
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            widget.object.avatar == ""
                ? CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Center(
                      child: Text(
                        widget.object.name!.substring(0, 1),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                : Card(
                    margin: EdgeInsets.all(0),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                      height: 50,
                      width: 50,
                      child: CachedNetworkImage(
                        imageUrl: widget.object.avatar!,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black12, BlendMode.darken)),
                          ),
                        ),
                        placeholder: (context, url) =>
                            Center(child: CupertinoActivityIndicator()),
                        errorWidget: (context, url, error) => Center(
                          child: Icon(
                            Icons.error,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
            Container(width: 10),
            Flexible(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(widget.object.name!,
                          style: TextStyles.caption(context)
                          //.copyWith(color: MyColors.grey_60),
                          ),
                      Spacer(),
                      Text(TimUtil.timeAgoSinceDate(widget.object.date!),
                          style: TextStyles.caption(context)
                          //.copyWith(color: MyColors.grey_60),
                          ),
                    ],
                  ),
                  Container(height: 8),
                  Container(
                    width: double.infinity,
                    child: Text(
                        Utility.getBase64DecodedString(widget.object.content!),
                        maxLines: 10,
                        textAlign: TextAlign.left,
                        style: TextStyles.subhead(context).copyWith(
                            //color: MyColors.grey_80,
                            fontWeight: FontWeight.w500)),
                  ),
                  Container(height: 8),
                  Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          replyCommentScreen();
                        },
                        child: Text(
                          t.reply,
                          style: TextStyles.caption(context).copyWith(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ),
                      Container(width: 10),
                      Visibility(
                        visible: repliesCount != 0,
                        child: InkWell(
                          onTap: () {
                            replyCommentScreen();
                          },
                          child: Text(
                            repliesCount.toString(),
                            style: TextStyles.caption(context).copyWith(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ),
                      ),
                      Container(width: 2),
                      Visibility(
                        visible: repliesCount != 0,
                        child: InkWell(
                          onTap: () {
                            replyCommentScreen();
                          },
                          child: Text(
                            t.replies,
                            style: TextStyles.caption(context).copyWith(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: <Widget>[
                          Visibility(
                            visible: widget.isUser ? false : true,
                            child: InkWell(
                              child: Icon(Icons.report,
                                  color: Colors.pink[300], size: 20.0),
                              onTap: () async {
                                await showDialog<void>(
                                    context: context,
                                    barrierDismissible:
                                        false, // user must tap button!
                                    builder: (BuildContext context) {
                                      return ReportCommentDialog(
                                        id: widget.object.id,
                                        index: widget.index,
                                        function: reportPost,
                                      );
                                    });
                              },
                            ),
                          ),
                          Container(width: 10),
                          Visibility(
                            visible: widget.isUser ? true : false,
                            child: InkWell(
                              child: Icon(Icons.edit,
                                  color: Colors.lightBlue, size: 20.0),
                              onTap: () {
                                Provider.of<CommentsModel>(context,
                                        listen: false)
                                    .showEditCommentAlert(
                                        widget.object.id, widget.index);
                              },
                            ),
                          ),
                          Container(width: 10),
                          Visibility(
                            visible: widget.isUser ? true : false,
                            child: InkWell(
                              child: Icon(Icons.delete_forever,
                                  color: Colors.redAccent, size: 20.0),
                              onTap: () {
                                Provider.of<CommentsModel>(context,
                                        listen: false)
                                    .showDeleteCommentAlert(
                                        widget.object.id, widget.index);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
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

class ReportCommentDialog extends StatefulWidget {
  final id, index;
  final Function? function;
  ReportCommentDialog({Key? key, this.id, this.index, this.function})
      : super(key: key);

  @override
  _ReportCommentDialogState createState() => _ReportCommentDialogState();
}

class _ReportCommentDialogState extends State<ReportCommentDialog> {
  List<String> reportOptions = t.reportCommentsList;
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        t.reportcomment,
        style: TextStyles.subhead(context),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      actions: <Widget>[
        ElevatedButton(
          child: Text(t.cancel),
          style: TextButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
           // primary: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text(t.ok),
          style: TextButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
           // primary: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            widget.function!(widget.id, widget.index, reportOptions[_selected]);
          },
        ),
      ],
      content: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Divider(),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.4,
                ),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: reportOptions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RadioListTile(
                          title: Text(reportOptions[index]),
                          value: index,
                          groupValue: _selected,
                          onChanged: (dynamic value) {
                            setState(() {
                              _selected = index;
                            });
                          });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//Just Audio


class SeekBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final Duration bufferedPosition;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangeEnd;

  const SeekBar({
    Key? key,
    required this.duration,
    required this.position,
    required this.bufferedPosition,
    this.onChanged,
    this.onChangeEnd,
  }) : super(key: key);

  @override
  SeekBarState createState() => SeekBarState();
}

class SeekBarState extends State<SeekBar> {
  double? _dragValue;
  late SliderThemeData _sliderThemeData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _sliderThemeData = SliderTheme.of(context).copyWith(
      trackHeight: 2.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SliderTheme(
          data: _sliderThemeData.copyWith(
            thumbShape: HiddenThumbComponentShape(),
            activeTrackColor: Colors.blue.shade100,
            inactiveTrackColor: Colors.grey.shade300,
          ),
          child: ExcludeSemantics(
            child: Slider(
              min: 0.0,
              max: widget.duration.inMilliseconds.toDouble(),
              value: min(widget.bufferedPosition.inMilliseconds.toDouble(),
                  widget.duration.inMilliseconds.toDouble()),
              onChanged: (value) {
                setState(() {
                  _dragValue = value;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(Duration(milliseconds: value.round()));
                }
              },
              onChangeEnd: (value) {
                if (widget.onChangeEnd != null) {
                  widget.onChangeEnd!(Duration(milliseconds: value.round()));
                }
                _dragValue = null;
              },
            ),
          ),
        ),
        SliderTheme(
          data: _sliderThemeData.copyWith(
            inactiveTrackColor: Colors.transparent,
          ),
          child: Slider(
            min: 0.0,
            max: widget.duration.inMilliseconds.toDouble(),
            value: min(_dragValue ?? widget.position.inMilliseconds.toDouble(),
                widget.duration.inMilliseconds.toDouble()),
            onChanged: (value) {
              setState(() {
                _dragValue = value;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(Duration(milliseconds: value.round()));
              }
            },
            onChangeEnd: (value) {
              if (widget.onChangeEnd != null) {
                widget.onChangeEnd!(Duration(milliseconds: value.round()));
              }
              _dragValue = null;
            },
          ),
        ),
        Positioned(
          right: 16.0,
          bottom: 0.0,
          child: Text(
              RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                  .firstMatch("$_remaining")
                  ?.group(1) ??
                  '$_remaining',
             // style: Theme.of(context).textTheme.caption
          ),
        ),
      ],
    );
  }

  Duration get _remaining => widget.duration - widget.position;
}

class HiddenThumbComponentShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => Size.zero;

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {}
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData(this.position, this.bufferedPosition, this.duration);
}

void showSliderDialog({
  required BuildContext context,
  required String title,
  required int divisions,
  required double min,
  required double max,
  String valueSuffix = '',
  required Stream<double> stream,
  required ValueChanged<double> onChanged,
}) {
  showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title, textAlign: TextAlign.center),
      content: StreamBuilder<double>(
        stream: stream,
        builder: (context, snapshot) => SizedBox(
          height: 100.0,
          child: Column(
            children: [
              Text('${snapshot.data?.toStringAsFixed(1)}$valueSuffix',
                  style: const TextStyle(
                      fontFamily: 'Fixed',
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0)),
              Slider(
                divisions: divisions,
                min: min,
                max: max,
                value: snapshot.data ?? 1.0,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}