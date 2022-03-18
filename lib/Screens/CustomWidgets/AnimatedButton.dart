import 'package:fleska_assignment/Utils/Constants.dart';
import 'package:fleska_assignment/Utils/responsive_template.dart';
import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final SizeInfo size;
  AnimatedButton({required this.size});
  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
    );
    animation = CurveTween(curve: Curves.ease).animate(controller);
    super.initState();
  }

  double displace = 6;
  @override
  Widget build(BuildContext context) {
    double height = widget.size.height * 0.06;
    double width = widget.size.width * 0.05;
    return AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          double onPosition = displace + (-6 * animation.value);
          return Stack(
            children: [
              Transform(
                transform: Matrix4.identity()
                  ..translate(-onPosition, onPosition),
                child: Container(
                  height: height,
                  width: width,
                  color: Colors.black,
                ),
              ),
              InkWell(
                onTap: () {},
                onHover: (isHovering) {
                  if (isHovering) {
                    controller.forward();
                  } else if (isHovering == false) {
                    controller.reverse();
                  }
                },
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(onPosition, -onPosition),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      color: controller.isCompleted
                          ? Colors.black
                          : KprimaryYellow,
                      border: Border.all(
                        color: Colors.black,
                        width: 0.8,
                      ),
                    ),
                    child: FittedBox(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "LOGIN",
                          style: subHeader.copyWith(
                            color: controller.isCompleted
                                ? KprimaryYellow
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
