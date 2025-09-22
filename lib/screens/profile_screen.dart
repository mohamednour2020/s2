import 'dart:math';

import 'package:flutter/material.dart';
import 'package:s2/custom_widgets/custom_animated_widget.dart';
import 'package:s2/custom_widgets/custom_button.dart';
import 'package:s2/utils/app_colors.dart';
import 'package:s2/utils/app_words.dart';

import '../utils/app_images.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin{
  late final AnimationController myController;
  @override
  void initState() {
    myController=AnimationController(
        vsync: this,
      duration: Duration(seconds: 5)
    );
    super.initState();
  }
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profile", style: TextStyle(color: Colors.white)),
      ),
      body:  InkWell(
        onTap: (){
          myController.repeat();
        },
        child: InkWell(
          onTap: (){
            myController.repeat();
          },
          child: Center(
            child: AnimatedBuilder(
                animation: myController,
                builder: (cx,child){
                  return Transform.scale(
                    scale:myController.value,
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
            ),
          ),
        ),
      ),
    );
  }
}
