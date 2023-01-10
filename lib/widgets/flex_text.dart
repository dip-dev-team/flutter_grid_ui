// Flutter imports:
import 'package:flutter/widgets.dart';

// Project imports:
import 'package:flutter_flexui/utils/screen.dart';

class FlexText extends Text with Screen {
  /// Creates a Text widget, which adapts text style according to screen size
  const FlexText(
    String this.text, {
    Key? key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.styleXS,
    this.styleSm,
    this.styleMd,
    this.styleLg,
  })  : textSpan = null,
        super(text, key: key);

  const FlexText.rich(
    InlineSpan this.textSpan, {
    Key? key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.styleXS,
    this.styleSm,
    this.styleMd,
    this.styleLg,
  })  : text = null,
        super.rich(textSpan, key: key);

  final String? text;
  final InlineSpan? textSpan;

  final TextStyle? style;

  final TextStyle? styleXS;
  final TextStyle? styleSm;
  final TextStyle? styleMd;
  final TextStyle? styleLg;

  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
      TextStyle? effectiveTextStyle = style;
      TextStyle? effectiveXSTextStyle = styleXS;
      TextStyle? effectiveSmTextStyle = styleSm;
      TextStyle? effectiveMdTextStyle = styleMd;
      TextStyle? effectiveLgTextStyle = styleLg;

      if (style == null || style!.inherit)
        effectiveTextStyle = defaultTextStyle.style.merge(style);

      if (styleXS == null || styleXS!.inherit)
        effectiveXSTextStyle = effectiveTextStyle?.merge(styleXS);

      if (styleSm == null || styleSm!.inherit)
        effectiveSmTextStyle = effectiveXSTextStyle?.merge(styleSm);

      if (styleMd == null || styleMd!.inherit)
        effectiveMdTextStyle = effectiveSmTextStyle?.merge(styleMd);

      if (styleLg == null || styleLg!.inherit)
        effectiveLgTextStyle = effectiveMdTextStyle?.merge(styleLg);

      TextStyle? currentStyle = Screen.valueByScreen(context,
          xs: effectiveXSTextStyle,
          sm: effectiveSmTextStyle,
          md: effectiveMdTextStyle,
          lg: effectiveLgTextStyle);

      if (MediaQuery.boldTextOf(context))
        currentStyle =
            currentStyle!.merge(const TextStyle(fontWeight: FontWeight.bold));
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
