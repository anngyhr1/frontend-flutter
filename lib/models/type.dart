class Field{
  int? id ;
  String? name ;
  String? description ;
  int? number ;
  Field({this.id,this.name,this.description,this.number});
  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
      description:json['description'] as String?,
        id: json['id'] as int?,
      number: json['number'] as int?,

      name: json['name'] as String?,

    );
  }

}
