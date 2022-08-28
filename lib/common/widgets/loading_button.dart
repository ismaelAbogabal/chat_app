import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({
    Key? key,
    required this.isLoading,
    required this.onPressed,
    required this.label,
    this.margin = const EdgeInsets.all(5),
    this.height = 45,
    this.backgroundColor,
    this.loadingColor,
    this.loadingWidget = const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.white),
    ),
    this.animationDuration = const Duration(milliseconds: 1000),
  }) : super(key: key);

  final Color? backgroundColor;
  final Color? loadingColor;
  final String label;

  // final Widget child;
  final Widget loadingWidget;
  final Duration animationDuration;
  final bool isLoading;
  final void Function() onPressed;
  final EdgeInsetsGeometry margin;
  final double height;

  @override
  State createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> buttonSizeAnimation;
  late Animation<double> loadingAnimation;
  late Animation<double> textAnimation;

  // late Animation<Color?> buttonBackgroundColorAnimation;
  late Animation<double> buttonBackgroundColorOpacity;

  double _buttonSize = double.infinity;

  double get buttonWidth {
    if (_buttonSize != double.infinity) return _buttonSize;

    _buttonSize = context.size?.width ?? double.infinity;
    return _buttonSize;
  }

  _setButtonSizeAnimation() {
    // buttonBackgroundColorAnimation = ColorTween(
    //   begin: widget.backgroundColor,
    //   end: widget.loadingColor,
    // ).animate(CurvedAnimation(
    //   curve: const Interval(.0, .5, curve: Curves.easeInOut),
    //   parent: controller,
    // ));

    buttonBackgroundColorOpacity = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        curve: const Interval(.5, 1, curve: Curves.easeInOut),
        parent: controller,
      ),
    );
    buttonSizeAnimation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        curve: const Interval(.0, .7, curve: Curves.bounceOut),
        parent: controller,
      ),
    );
    textAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        curve: const Interval(.4, .7, curve: Curves.easeInOut),
        parent: controller,
      ),
    );

    loadingAnimation = CurvedAnimation(
      curve: const Interval(.7, 1, curve: Curves.easeInOut),
      parent: controller,
    );
  }

  @override
  void didUpdateWidget(covariant LoadingButton oldWidget) {
    if (widget.isLoading) {
      controller.forward();
    } else {
      controller.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
      value: widget.isLoading ? 1.0 : 0.0,
    );
    _setButtonSizeAnimation();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Center(
                child: Container(
                  margin: widget.margin,
                  alignment: Alignment.center,
                  width: buttonSizeAnimation.value * constraints.maxWidth + 45,
                  height: widget.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        offset: const Offset(3, 2),
                        color: Colors.black.withOpacity(
                          buttonBackgroundColorOpacity.value / 3,
                        ),
                      ),
                    ],
                  ),
                  child: Container(
                    child: textAnimation.value != 1
                        ? Transform.rotate(
                            angle: textAnimation.value * 10,
                            child: Transform.scale(
                              scale: 1.0 - textAnimation.value,
                              child: FittedBox(
                                child: Text(
                                  widget.label,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : ScaleTransition(
                            scale: loadingAnimation,
                            child: widget.loadingWidget,
                          ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

// _startAnimation(Offset globalPosition) async {
//   if (controller.isCompleted) {
//     controller.reverse();
//     return;
//   }

//   // _startSplash(globalPosition);
//   _setButtonSizeAnimation();
//   await Future.delayed(Duration(milliseconds: 300));
//   // Future.delayed(animationDuration * .7, endSplash);
//   controller.forward();
// }

// void _startSplash(Offset globalPosition) {
//   var cont = splashWidgeKey.currentContext;

//   final MaterialInkController inkController = Material.of(cont);
//   final RenderBox referenceBox = cont.findRenderObject();
//   final Offset position = referenceBox.globalToLocal(globalPosition);

//   var _splash = InkRipple.splashFactory.create(
//     color: Colors.red,
//     controller: inkController,
//     position: position,
//     referenceBox: referenceBox,
//     textDirection: TextDirection.ltr,
//     containedInkWell: true,
//     borderRadius: BorderRadius.circular(20),
//   );

//   _splashs.add(_splash);
// }

// void endSplash() {
//   for (var splash in _splashs) {
//     splash.confirm();
//   }
//   _splashs.clear();
// }
}
