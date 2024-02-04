import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:typewritertext/typewritertext.dart';

class TypeWriterWidgetWithLoader extends StatefulWidget {
  final String message;
  final Function onComplete;
  TypeWriterWidgetWithLoader({required this.onComplete, required this.message, super.key});

  @override
  State<TypeWriterWidgetWithLoader> createState() => _TypeWriterWidgetWithLoaderState();
}

class _TypeWriterWidgetWithLoaderState extends State<TypeWriterWidgetWithLoader> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double iconPadding = width * 0.01;
    double iconSize = width * 0.05;

    return Padding(
      padding: EdgeInsets.only(bottom: iconSize),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(iconPadding),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
              MediaQuery.of(context).platformBrightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
            ),
            child: Icon(
              Icons.model_training,
              color:
              (MediaQuery.of(context).platformBrightness == Brightness.light
                  ? Colors.white
                  : Colors.black),
              size: iconSize,
            ),
          ),
          SizedBox(
            width: iconSize / 2,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ChatGPT',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                widget.message.isEmpty?LoadingDot(): AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                        cursor: "",
                        widget.message,
                        textStyle: TextStyle(color: MediaQuery.of(context).platformBrightness==Brightness.light?Colors.black: Colors.white,),
                        speed: Duration(milliseconds: 10),
                        textAlign: TextAlign.left),
                  ],
                  isRepeatingAnimation: false,
                  onFinished: (){widget.onComplete();},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive =>true;
}

class LoadingDot extends StatefulWidget {
  LoadingDot({super.key});

  @override
  State<LoadingDot> createState() => _LoadingDotState();
}

class _LoadingDotState extends State<LoadingDot> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation<double> _dotSizeTween;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    _dotSizeTween =
    Tween<double>(begin: 15, end: 22).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      child: Center(
        child: Icon(
          Icons.access_time_filled_sharp,
          size: _dotSizeTween.value,
        ),
      ),
    );
  }
}

