import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final String font;
  final int maxLines;
  const AppText(
      {required this.text,
      required this.textStyle,
      this.textAlign = TextAlign.center,
      super.key,
      this.font = 'Montserrat',
      this.maxLines = 40});

  @override
  Widget build(BuildContext context) {
    return Text(text.toString(),
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        style: GoogleFonts.getFont(font, textStyle: textStyle));
  }
}

class AppHighlightText extends StatelessWidget {
  final String text;
  final String highlightText;
  final TextStyle textStyle;
  final TextStyle highlightTextStyle;

  const AppHighlightText(
      {super.key,
      required this.text,
      required this.highlightText,
      required this.textStyle,
      required this.highlightTextStyle});

  generateHighlightText() {
    List textResult = <TextSpan>[];
    List<String> highlightTextList = highlightText.toLowerCase().split(' ');

    text.split(' ').forEach((str) => textResult.add(TextSpan(
        text: '$str ',
        style: highlightTextList.contains(str.toLowerCase())
            ? highlightTextStyle
            : textStyle)));

    return textResult;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
        maxLines: 2,
        textDirection: TextDirection.ltr,
        text: TextSpan(
            style: GoogleFonts.montserrat(textStyle: textStyle),
            children: generateHighlightText()));
  }
}
