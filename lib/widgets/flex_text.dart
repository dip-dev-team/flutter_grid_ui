import 'package:flutter/widgets.dart';
import 'package:flutter_flexui/utils/screen_size.dart';

class FlexText extends Text with ScreenSize {
  const FlexText(
    this.data, {
    Key key,
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
  })  : assert(
          data != null,
          'A non-null String must be provided to a Text widget.',
        ),
        textSpan = null,
        super(data, key: key);

  const FlexText.rich(
    this.textSpan, {
    Key key,
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
  })  : assert(
          textSpan != null,
          'A non-null TextSpan must be provided to a Text.rich widget.',
        ),
        data = null,
        super.rich(textSpan, key: key);

  final String data;
  final InlineSpan textSpan;

  final TextStyle style;

  final TextStyle styleXS;
  final TextStyle styleSm;
  final TextStyle styleMd;
  final TextStyle styleLg;

  final StrutStyle strutStyle;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final Locale locale;
  final bool softWrap;
  final TextOverflow overflow;
  final double textScaleFactor;
  final int maxLines;
  final String semanticsLabel;
  final TextWidthBasis textWidthBasis;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
      TextStyle effectiveTextStyle = style;
      TextStyle effectiveXSTextStyle = styleXS;
      TextStyle effectiveSmTextStyle = styleSm;
      TextStyle effectiveMdTextStyle = styleMd;
      TextStyle effectiveLgTextStyle = styleLg;

      if (style == null || style.inherit)
        effectiveTextStyle = defaultTextStyle.style.merge(style);

      if (styleXS == null || styleXS.inherit)
        effectiveXSTextStyle = effectiveTextStyle.merge(styleXS);

      if (styleSm == null || styleSm.inherit)
        effectiveSmTextStyle = effectiveXSTextStyle.merge(styleSm);

      if (styleMd == null || styleMd.inherit)
        effectiveMdTextStyle = effectiveSmTextStyle.merge(styleMd);

      if (styleLg == null || styleLg.inherit)
        effectiveLgTextStyle = effectiveMdTextStyle.merge(styleLg);

      TextStyle currentStyle = ScreenSize.getValueByScreen(context,
          xs: effectiveXSTextStyle,
          sm: effectiveSmTextStyle,
          md: effectiveMdTextStyle,
          lg: effectiveLgTextStyle);

      if (MediaQuery.boldTextOverride(context))
        currentStyle =
            currentStyle.merge(const TextStyle(fontWeight: FontWeight.bold));
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
          text: data,
          children: textSpan != null ? <InlineSpan>[textSpan] : null,
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
