class AlbumModel {
  AlbumModel({
      this.userId, 
      this.id, 
      this.title,});

  AlbumModel.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }
  num? userId;
  num? id;
  String? title;
AlbumModel copyWith({  num? userId,
  num? id,
  String? title,
}) => AlbumModel(  userId: userId ?? this.userId,
  id: id ?? this.id,
  title: title ?? this.title,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    return map;
  }

}