import 'package:flutter/material.dart';
import 'package:s2/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
 final Function()? onTap;
 final Color? buttonColor;
 final String? buttonText;
 const  CustomButton({super.key,required this.onTap,this.buttonColor,required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          color:buttonColor??AppColors.mainColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text(buttonText!,style: TextStyle(
            fontSize: 18,color: Colors.white,
            fontWeight: FontWeight.bold
        ),)),
      ),
    );
  }
}
