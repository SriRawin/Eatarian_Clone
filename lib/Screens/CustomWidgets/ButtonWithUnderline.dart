import 'package:flutter/material.dart';

class ButtonWithUnderline extends StatefulWidget {
  final double boxWidth;
  final bool isUnderlined;
  final String text;
  ButtonWithUnderline(
      {required this.boxWidth, required this.isUnderlined, required this.text});

  @override
  State<ButtonWithUnderline> createState() => _ButtonWithUnderlineState();
}

class _ButtonWithUnderlineState extends State<ButtonWithUnderline> {
  double customWidth = 0;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (isHovering) {
        setState(() {
          customWidth = isHovering ? widget.boxWidth : 0;
        });
      },
      child: SizedBox(
        width: widget.boxWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Text(
                widget.text,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: widget.boxWidth,
                ),
              ),
            ),
            widget.isUnderlined
                ? AnimatedContainer(
                    height: 3,
                    width: customWidth,
                    color: Colors.black,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeIn,
                  )
                : SizedBox(
                    height: 3,
                  ),
          ],
        ),
      ),
    );
  }
}
