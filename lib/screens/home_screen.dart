import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:s2/custom_widgets/custom_button.dart';
import 'package:s2/custom_widgets/home_card.dart';
import 'package:s2/models/album_model.dart';
import 'package:s2/screens/profile_screen.dart';
import 'package:s2/services/api_requests/album_request.dart';
import 'package:s2/utils/app_colors.dart';
import 'package:s2/utils/app_fonts.dart';
import 'package:s2/utils/app_images.dart';
import 'package:s2/utils/app_words.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AlbumModel? dataToDisplay;
   getDataToDisplay()async{
     dataToDisplay=await AlbumRequest.getAlbums();
   }
  @override
  void initState() {

       getDataToDisplay();
       setState(() {

});

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
      backgroundColor: Colors.white,
      elevation: 0,
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(radius: 30),
                Text("user name"),
                Text("email"),
              ],
            ),
          ),
          CustomButton(onTap: () {
            Navigator.pop(context);
          }, buttonText: "buttonText"),
          CustomButton(onTap: () {}, buttonText: "buttonText"),
          CustomButton(onTap: () {}, buttonText: "buttonText"),
          CustomButton(onTap: () {}, buttonText: "buttonText"),
        ],
      ),
    ),
      appBar: AppBar(
        title: Text(dataToDisplay?.title??"", style: TextStyle(color: Colors.white,fontFamily: AppFonts.boldFont)),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (builder) => ProfileScreen()),
            );
          },
          icon: Icon(Icons.person, color: Colors.white),
        ),

      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        elevation: 0,
        child: ListView(
          children: [
            DrawerHeader(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(radius: 30,),
                Text("user name"),
                Text("email"),
              ],
            )),
            CustomButton(onTap: (){}, buttonText: "buttonText"),
            CustomButton(onTap: (){}, buttonText: "buttonText"),
            CustomButton(onTap: (){}, buttonText: "buttonText"),
            CustomButton(onTap: (){}, buttonText: "buttonText"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

           Container(
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
          ),

          ],
        ),
      ),
    );
  }
}
