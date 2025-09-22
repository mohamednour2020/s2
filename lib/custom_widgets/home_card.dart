// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:s2/custom_widgets/custom_button.dart';
// import 'package:s2/utils/app_colors.dart';
// import 'package:s2/utils/app_images.dart';
// import 'package:s2/utils/app_words.dart';
//
// class HomeCard extends StatefulWidget {
//   const HomeCard({super.key});
//
//   @override
//   State<HomeCard> createState() => _HomeCardState();
// }
//
// class _HomeCardState extends State<HomeCard> {
//   Color cardColor = AppColors.mainColor.withOpacity(0.3);
//   double height = 184;
//   double width = 120;
//   bool isClear = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Hero(
//       tag: "myCard",
//       child: Container(
//         height: height,
//         width: width,
//         padding: EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: cardColor,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 90,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   fit: BoxFit.fill,
//                   image: AssetImage(AppImages.homeCardImage),
//                 ),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(AppWords.visaCard, style: TextStyle(fontSize: 12)),
//             Text(AppWords.balance, style: TextStyle(fontSize: 12)),
//             Text(AppWords.available, style: TextStyle(fontSize: 12)),
//           ],
//         ),
//       ),
//     );
//   }
// }
