import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_text.dart';

class HeadTextWidget extends StatelessWidget {
  String headLine;

  HeadTextWidget({Key? key, required this.headLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Text(
        headLine,
        style: extraBoldTextStyle.copyWith(color: mainColor, fontSize: 22),
      ),
    );
  }
}
