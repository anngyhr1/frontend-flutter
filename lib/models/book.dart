class Book{
  int? id ;
  String? image ;
  String? title ;
  double? price ;
  double? exprice ;
  String? author ;
  double? rate ;
  String? description ;
  String? dure ;
  String? purchasedate ;
  String recommendation ;
  String bookintroduction ;
  String audiointroduction ;
  bool? listened ;

  Book({this.image, this.exprice, this.price,this.title,this.id,this.author,this.rate,this.description,this.dure,this.purchasedate="",this.audiointroduction="v",this.bookintroduction="v",this.recommendation="v",this.listened});
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        id: json['id']as int? ,
        image: json['image'] as String?,
        title: json['title'] as String?,
        author: json['author'] as String?,
        price: json['price'] as double?,
        rate: json['rate'] as double?,
        exprice : json['exprice'] as double?  ,
        description: json['description'] as String?,
        purchasedate: json['purchasedate'] as String?,
        dure: json['dure']
    );
  }


}
