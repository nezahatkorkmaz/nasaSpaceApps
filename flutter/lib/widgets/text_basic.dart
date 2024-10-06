import 'package:deneme/constants/app_color.dart';
import 'package:flutter/material.dart';

class TextBasic extends StatelessWidget {
  const TextBasic({
    required this.text,
    super.key,
    this.color,
    this.fontFamily,
    this.fontSize,
    this.lineHeight,
    this.underline = false,
    this.multiline = false,
    this.textAlign,
    this.maxLines,
    this.fontWeight,
    this.letterSpacing,
    this.shadow,
    this.decorationcolor,
    this.padding,
  });
  final String text;
  final Color? color;
  final Color? decorationcolor;
  final String? fontFamily;
  final double? fontSize;
  final double? lineHeight;
  final bool? underline;
  final bool multiline;
  final TextAlign? textAlign;
  final int? maxLines;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final List<Shadow>? shadow;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Text(
          text,
          overflow: multiline ? TextOverflow.clip : TextOverflow.ellipsis,
          textAlign: textAlign,
          maxLines: maxLines ?? 999,
          textScaler: const TextScaler.linear(1),
          style: TextStyle(
            shadows: shadow ?? [],
            letterSpacing: letterSpacing ?? 0.0,
            color: color ?? AppColor().black,
            fontFamily: fontFamily,
            fontSize: fontSize ?? 14.0,
            decorationThickness: 4,
            decorationColor: decorationcolor,
            decoration: underline! ? TextDecoration.underline : null,
            fontWeight: fontWeight ?? FontWeight.normal,
            height: lineHeight ?? 1.2,
          ),
        ),
      );
}
