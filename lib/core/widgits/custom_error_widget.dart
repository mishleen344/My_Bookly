import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          textAlign: TextAlign.center,
      errMessage,
      style: Styles.textStyle18,
    ));
  }
}
