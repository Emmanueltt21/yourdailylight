
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:yourdailylight/utils/my_colors.dart';

const applicationMaxWidth = 500.0;


Widget commonCachedNetworkImage(
    String? url, {
      double? height,
      double? width,
      BoxFit? fit,
      AlignmentGeometry? alignment,
      bool usePlaceholderIfUrlEmpty = true,
      double? radius,
      Color? color,
    }) {
  if (url!.validate().isEmpty) {
    return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
  } else if (url.validate().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      color: color,
      alignment: alignment as Alignment? ?? Alignment.center,
      errorWidget: (_, s, d) {
        return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
      },
      placeholder: (_, s) {
        if (!usePlaceholderIfUrlEmpty) return SizedBox();
        return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
      },
    );
  } else {
    return Image.asset(url, height: height, width: width, fit: fit, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

Widget placeHolderWidget({double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, double? radius}) {
  return Image.asset('assets/images/coverphoto.jpg', height: height, width: width, fit: fit ?? BoxFit.cover, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
}



Widget commonCacheImageWidget(String? url, double height, {double? width, BoxFit? fit}) {
  if (url.validate().startsWith('http')) {
    if (isMobile) {
      return CachedNetworkImage(
        placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
        imageUrl: '$url',
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        errorWidget: (_, __, ___) {
          return SizedBox(height: height, width: width);
        },
      );
    } else {
      return Image.network(url!, height: height, width: width, fit: fit ?? BoxFit.cover);
    }
  } else {
    return Image.asset(url!, height: height, width: width, fit: fit ?? BoxFit.cover);
  }
}





Widget? Function(BuildContext, String) placeholderWidgetFn() => (_, s) => placeholderWidget();

Widget placeholderWidget() => Image.asset('assets/images/coverphoto.jpg', fit: BoxFit.cover);

BoxConstraints dynamicBoxConstraints({double? maxWidth}) {
  return BoxConstraints(maxWidth: maxWidth ?? applicationMaxWidth);
}

double dynamicWidth(BuildContext context) {
  return isMobile ? context.width() : applicationMaxWidth;
}


Widget nbAppButtonWidget(BuildContext context, String text, Function onTap) {
  return AppButton(
    text: text,
    textStyle: boldTextStyle(color: white),
    color: MyColors.accent,
    onTap: onTap,
    width: context.width(),
  ).cornerRadiusWithClipRRect(20);
}



sSAppButton({
  Function? onPressed,
  String? title,
  required BuildContext context,
  Color? color,
  Color? textColor,
}) {
  return AppButton(
    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24), side: BorderSide(color: Color(0xff808080), width: 1)),
    text: title,
    color: color ?? Color(0xff000000),
    textColor: textColor ?? Color(0xfffffbfb),
    onTap: () {
      onPressed!();
    },
    width: context.width(),
  );
}

