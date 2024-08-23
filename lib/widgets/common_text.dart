import '../exports.dart';

class CommonText extends StatelessWidget {
  const CommonText(this.text, this.fontFamily,this.fontSize,{
    super.key,
    this.color,

    this.textAlign = TextAlign.start,
    this.fontWeight,
    this.lines, this.textBaseline,
  } );
  final String text;
  final String fontFamily;
  final Color? color;
  final TextAlign textAlign;
  final FontWeight? fontWeight;
  final int? lines;
  final double? fontSize;
 final TextBaseline? textBaseline;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        inherit: false,
        fontSize: fontSize??24.0,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        color: color??AppColors.blackColor,
        textBaseline: textBaseline,

      ),
    );
  }
}