import 'dart:ui' as ui show TextHeightBehavior;

import 'package:flutter/widgets.dart';

import '../utils/screen.dart';

class FlexText extends Text with Screen {
  /// Creates a Text widget, which adapts text style according to screen size
  const FlexText(
    String this.text, {
    Key? key,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    ui.TextHeightBehavior? textHeightBehavior,
    Color? selectionColor,
    this.styleXs,
    this.styleSm,
    this.styleMd,
    this.styleLg,
  }) : super(
          text,
          key: key,
          style: style,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
          selectionColor: selectionColor,
        );

  const FlexText.rich(
    InlineSpan textSpan, {
    Key? key,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    ui.TextHeightBehavior? textHeightBehavior,
    Color? selectionColor,
    this.styleXs,
    this.styleSm,
    this.styleMd,
    this.styleLg,
  })  : text = null,
        super.rich(
          textSpan,
          key: key,
          style: style,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
          selectionColor: selectionColor,
        );

  final String? text;
  final TextStyle? styleXs;
  final TextStyle? styleSm;
  final TextStyle? styleMd;
  final TextStyle? styleLg;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
      TextStyle? effectiveTextStyle = style;
      TextStyle? effectiveXSTextStyle = styleXs;
      TextStyle? effectiveSmTextStyle = styleSm;
      TextStyle? effectiveMdTextStyle = styleMd;
      TextStyle? effectiveLgTextStyle = styleLg;

      if (style == null || style!.inherit) {
        effectiveTextStyle = defaultTextStyle.style;
      }

      if (styleXs == null || styleXs!.inherit) {
        effectiveXSTextStyle = effectiveTextStyle?.merge(styleXs);
      }

      if (styleSm == null || styleSm!.inherit) {
        effectiveSmTextStyle = effectiveXSTextStyle?.merge(styleSm);
      }

      if (styleMd == null || styleMd!.inherit) {
        effectiveMdTextStyle = effectiveSmTextStyle?.merge(styleMd);
      }

      if (styleLg == null || styleLg!.inherit) {
        effectiveLgTextStyle = effectiveMdTextStyle?.merge(styleLg);
      }

      TextStyle? currentStyle = Screen.valueByScreen(context,
          xs: effectiveXSTextStyle,
          sm: effectiveSmTextStyle,
          md: effectiveMdTextStyle,
          lg: effectiveLgTextStyle);

      if (MediaQuery.boldTextOf(context)) {
        currentStyle =
            currentStyle!.merge(const TextStyle(fontWeight: FontWeight.bold));
      }
      Widget result = RichText(
        textAlign: textAlign ?? defaultTextStyle.textAlign ?? TextAlign.start,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap ?? defaultTextStyle.softWrap,
        overflow: overflow ?? defaultTextStyle.overflow,
        textScaleFactor:
            textScaleFactor ?? MediaQuery.textScaleFactorOf(context),
        maxLines: maxLines ?? defaultTextStyle.maxLines,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis ?? defaultTextStyle.textWidthBasis,
        text: TextSpan(
          style: currentStyle,
          text: text,
          children: (textSpan != null ? <InlineSpan?>[textSpan] : null)
              as List<InlineSpan>?,
        ),
      );
      if (semanticsLabel != null) {
        result = Semantics(
          textDirection: textDirection,
          label: semanticsLabel,
          child: ExcludeSemantics(
            child: result,
          ),
        );
      }
      return result;
    });
  }
}
