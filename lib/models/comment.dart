class Comment{
  int? id ;
  int? book_id ;
  String? comment ;
  int? id_commenter ;
  String? name_commenter ;
  String? profile_picture_commenter;
  String? time ;
  bool? isliked ;

  Comment({this.id,this.book_id,this.comment,this.id_commenter,this.name_commenter,this.profile_picture_commenter,this.time,this.isliked});
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        id: json['id']as int? ,
        id_commenter: json['id_commenter']as int? ,
        book_id:json['book_id'] as int?,
        comment :json['comment'] as String?,
        profile_picture_commenter :json['profile_picture_commenter'] as String?,
        name_commenter :json['name_commenter'] as String?,
        time :json['time'] as String?,
        isliked :json['isliked'] as bool?


    );
  }


}
