import 'package:flutter/cupertino.dart';
import 'package:skeletons/skeletons.dart';

class CustomSkeletonTheme extends StatelessWidget {
  final Widget child;
  final List<Color> colorsGradient;
  final List<double> stopsGradient;
  const CustomSkeletonTheme({
    Key? key,
    required this.child,
    required this.colorsGradient,
    required this.stopsGradient
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonTheme(
      shimmerGradient: LinearGradient(
          colors: colorsGradient,
          stops: stopsGradient
      ),
      child: child,
    );
  }
}
