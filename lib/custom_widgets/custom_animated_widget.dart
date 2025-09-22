import 'package:flutter/material.dart';
import 'package:s2/utils/app_words.dart';

import '../utils/app_colors.dart' show AppColors;
import '../utils/app_images.dart';

class MyCustomAnimatedWidget extends AnimatedWidget {
  MyCustomAnimatedWidget({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation=listenable as Animation<double>;
    return Transform.scale(scale: animation.value,
    child: Container(
      height: 250,
      width: 100,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.homeCardImage),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 8),
          Text(AppWords.visaCard, style: TextStyle(fontSize: 12)),
          Text(AppWords.balance, style: TextStyle(fontSize: 12)),
          Text(AppWords.available, style: TextStyle(fontSize: 12)),
        ],
      ),
    ),);
  }
}
