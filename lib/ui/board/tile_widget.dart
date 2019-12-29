import 'package:flutter/material.dart';
import 'package:flutter_2048/mycolor.dart';

class TileWidget extends StatefulWidget {
  final String number;
  final double width, height;
  final int color;
  final double size;

  TileWidget(this.number, this.width, this.height, this.color, this.size);

  @override
  State<StatefulWidget> createState() {
    return _TileWidgetState();
  }
}

class _TileWidgetState extends State<TileWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      child: Container(
        child: Center(
          child: Text(
            widget.number,
            style: TextStyle(
              fontSize: widget.size,
              fontWeight: FontWeight.bold,
              color: Color(
                MyColor.fontColorTwoFour,
              ),
            ),
          ),
        ),
//      width: widget.width,
//      height: widget.height,
        decoration: BoxDecoration(
          color: Color(widget.color),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
