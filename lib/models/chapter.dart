class Chapter{
  int? id ;
  int? book_id ;
  String? dure ;
  String? name ;
  bool? islocked ;

  Chapter({this.id,this.book_id,this.dure,this.name,this.islocked});
  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
        id: json['id']as int? ,
        book_id:json['book_id'] as int?,
        dure :json['dure'] as String?,
        name :json['name'] as String?,
        islocked: json['islocked'] as bool?

    );
  }


}
