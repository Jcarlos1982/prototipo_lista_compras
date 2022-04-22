import 'package:flutter/material.dart';

class BottomItemWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  final Color color;
  final Color colorSelected;
  final bool selected;
  final Function? onTap;
  const BottomItemWidget(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onTap,
      this.color = Colors.black54,
      this.colorSelected = Colors.green,
      this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith(
              (states) => selected ? colorSelected : color)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          Text(title),
        ],
      ),
      onPressed: () => onTap!(),
    );
  }
}
