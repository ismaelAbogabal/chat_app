import 'package:flutter/material.dart';

class HorizontalLineWidget extends StatelessWidget {
  const HorizontalLineWidget({
    Key? key,
    required this.label,
    this.height,
    this.thickness,
    this.padding = 10,
  }) : super(key: key);

  final String label;
  final double? height;
  final double? thickness;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            height: height,
            endIndent: padding,
            thickness: thickness,
          ),
        ),
        Text(label),
        Expanded(
          child: Divider(
            height: height,
            indent: padding,
            thickness: thickness,
          ),
        ),
      ],
    );
  }
}
