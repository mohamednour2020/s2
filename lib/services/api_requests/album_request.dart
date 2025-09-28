import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:s2/models/album_model.dart';

class AlbumRequest{
  static String apiURL="https://jsonplaceholder.typicode.com/albums/1";
  static Map<String,String> myHeaders={"Accept":"application/json","token":"kjfbsdjkbfkjdbfjdsfjbij"};


 static Future<AlbumModel?>  getAlbums()async{
    var response=await http.post(Uri.parse(apiURL),headers: myHeaders,);
    if(response.statusCode==200){
      log("success request");
      log(response.body,name: "API response is");
      return AlbumModel.fromJson(json.decode(response.body));
    }else{
      ("failed request");
      return null;


    }
  }
}