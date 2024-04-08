// for the moment it will be for make examples
import 'package:ebooks/models/book.dart';
import 'package:ebooks/models/chapter.dart';
import 'package:ebooks/models/comment.dart';
import 'package:ebooks/models/type.dart';
import 'package:ebooks/models/user.dart';

List<Comment> commentsdemolist = [
  Comment(
      id: 1,
      id_commenter: 7,
      comment:
          "THat s the best book I heard ever you can live it and it can even move your tears , it can even move your tears",
      profile_picture_commenter: "assets/user1.jpg",
      name_commenter: "Alin Fresco",
      time: "7 hours ago ",
      isliked: false),
  Comment(
      id: 1,
      id_commenter: 7,
      comment: "That s the best book I heard ever you can live it and it can even move your tears",
      profile_picture_commenter: "assets/user1.jpg",
      name_commenter: "Alin Fresco",
      time: "1 hour ago ",
      isliked: false),
  Comment(
      id: 1,
      id_commenter: 7,
      comment: "THat s the best book I heard ever you can live it and it can even move your tears",
      profile_picture_commenter: "assets/user1.jpg",
      name_commenter: "Alin Fresco",
      time: "3 hours ago ",
      isliked: false),
  Comment(
      id: 1,
      id_commenter: 7,
      comment: "THat s the best book I heard ever you can live it and it can even move your tears",
      profile_picture_commenter: "assets/user1.jpg",
      name_commenter: "Alin Fresco",
      time: "1 hour ago ",
      isliked: false),
  Comment(
      id: 1,
      id_commenter: 7,
      comment: "THat s the best book I heard ever you can live it and it can even move your tears",
      profile_picture_commenter: "assets/user1.jpg",
      name_commenter: "Alin Fresco",
      time: "2 hours ago ",
      isliked: false)
];
List<Chapter> chapterdemolist = [
  Chapter(id: 12, dure: "12:30", name: "When You Go", book_id: 15, islocked: false),
  Chapter(id: 12, dure: "12:30", name: "Live without you", book_id: 15, islocked: false),
  Chapter(id: 12, dure: "12:45", name: "THe evening", book_id: 15, islocked: false),
  Chapter(id: 12, dure: "03:40", name: "Falling asleep", book_id: 15, islocked: false),
  Chapter(id: 12, dure: "13:55", name: "My dreams", book_id: 15, islocked: false),
  Chapter(id: 12, dure: "06:30", name: "My Morning sleep", book_id: 15, islocked: true),
  Chapter(id: 12, dure: "10:01", name: "I Forgot you", book_id: 15, islocked: true)
];
User? user = User(
    name: "Allina Phlastieth",
    username: "allina.phlastieth",
    email: "Allina.phlastieth@gmail.com",
    id: 1,
    image: "assets/user1.jpg");

List<Field> fieldsdemolist = [
  Field(
      number: 5,
      id: 1,
      name: "Literature",
      description:
          "THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live it and it can even move your tears"),
  Field(
      number: 5,
      id: 1,
      name: "Child",
      description:
          "THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live"),
  Field(
      id: 1,
      number: 5,
      name: "Music",
      description:
          "THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live"),
  Field(
      id: 1,
      number: 5,
      name: "Entertainment",
      description:
          "THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live"),
  Field(
      id: 1,
      number: 5,
      name: "Computer",
      description:
          "THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live"),
  Field(
      id: 1,
      name: "Economy",
      description:
          "THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live"),
  Field(
      id: 1,
      name: "Philosofy",
      description:
          "THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live"),
  Field(
      id: 1,
      name: "Beauty",
      description:
          "THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live"),
  Field(
      id: 1,
      name: "Politics",
      description:
          "THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live"),
  Field(
      id: 1,
      name: "Food",
      description:
          "THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live"),
  Field(
      id: 1,
      name: "Science",
      description:
          "THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live"),
  Field(
      id: 1,
      name: "Astronomy",
      description:
          "THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live"),
  Field(
      id: 1,
      name: "Biology",
      description:
          "THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live it and it can even move your tears,THat s the best book I heard ever you can live"),
];
List<Book> booksdemolist = [
  Book(
      image: "assets/image1.jpg",
      price: 12.0,
      exprice: 09.00,
      title: "Holiday Logs",
      author: "Athour Philipp",
      rate: 1.5,
      audiointroduction:
          "Does school prepare children for the real world? udy hard and get good grades and you will find a high-paying job with great benefits,my parents used to say. Their goal in life was to provide a college education for my older sister and me, so that we would have the greatest chance for success in life. When T finally earned my diploma in 1976-graduating with honors, and near the top of my class, in accounting from Florida State University-my parents had realized their goal. It was the crowning achievement of their lives. In accordance witounting firm, and I looked forward to a long career and retirement at an early age. My husband, Michael, followed a similar path. We both came from hard-working families, of modest means but with strong work ethics. Michael also graduated with honors, but he did it twice: first as an engineer and then from law school. He was quickly recruited by a prestigious Washington, D.C., law firm that specialized in patent law, and his future seemed bright, career path well-defined and early retirement guaranteed e-reading.club",
      listened: false),
  Book(
      image: "assets/image3.jpg",
      price: 12.0,
      exprice: 09.00,
      title: "Holiday Logs",
      author: "Athour Philipp",
      rate: 1.5,
      purchasedate: "Feb 12/2019",
      audiointroduction:
          "Does school prepare children for the real world? udy hard and get good grades and you will find a high-paying job with great benefits,my parents used to say. Their goal in life was to provide a college education for my older sister and me, so that we would have the greatest chance for success in life. When T finally earned my diploma in 1976-graduating with honors, and near the top of my class, in accounting from Florida State University-my parents had realized their goal. It was the crowning achievement of their lives. In accordance witounting firm, and I looked forward to a long career and retirement at an early age. My husband, Michael, followed a similar path. We both came from hard-working families, of modest means but with strong work ethics. Michael also graduated with honors, but he did it twice: first as an engineer and then from law school. He was quickly recruited by a prestigious Washington, D.C., law firm that specialized in patent law, and his future seemed bright, career path well-defined and early retirement guaranteed e-reading.club",
      recommendation:
          "Does school prepare children for the real world? Study hard and get good grades and you will find a high-paying job with great benefitsy parents used to say. Their goal in life was to provide a college education for my older sister and me, so that we would have the greatest chance for success in life. When T finally earned my diploma in 1976-graduating with honors, and near the top of my class, in accounting from Florida State University-my parents had realized their goal. It was the crowning achievement of their lives. In accordance with the  I was hired by a accounting firm, and I looked forward to a long career and retirement at an early age. My husband, Michael, followed a similar path. We both came from hard-working families, of modest means but with strong work ethics. Michael also graduated with honors, but he did it twice: first as an engineer and then from law school. He was quickly recruited by a prestigious Washington, D.C., law firm that specialized in patent law, and his future seemed bright,",
      bookintroduction:
          "Does school prepare children for the real world? Study hard and get good grades and you will find a high-paying job with great benefits, my parents used to say. Their goal in life was to provide a college education for my older sister and me, so that we would have the greatest chance for success in life. When T finally earned my diploma in 1976-graduating with honors, and near the top of my class, in accounting from Florida State University-my parents had realized their goal. It was the crowning achievement of their lives. In accordance with the  I was hired by a  accounting firm, and I looked forward to a long career and retirement at an early age. My husband, Michael, followed a similar path. We both came from hard-working families, of modest means but with strong work ethics. Michael also graduated with honors, but he did it twice: first as an engineer and then from law school. He was quickly recruited by a prestigious Washington, D.C., law firm that specialized in patent law, and his future seemed bright, career path well-defined and early retirement guaranteed e-reading.club",
      listened: true),
  Book(
      image: "assets/image2.jpg",
      price: 0.0,
      exprice: 09.00,
      title: "Holiday Logs",
      author: "Athour Philipp",
      rate: 1.5,
      audiointroduction:
          "Does school prepare children for the real world? udy hard and get good grades and you will find a high-paying job with great benefits,my parents used to say. Their goal in life was to provide a college education for my older sister and me, so that we would have the greatest chance for success in life. When T finally earned my diploma in 1976-graduating with honors, and near the top of my class, in accounting from Florida State University-my parents had realized their goal. It was the crowning achievement of their lives. In accordance witounting firm, and I looked forward to a long career and retirement at an early age. My husband, Michael, followed a similar path. We both came from hard-working families, of modest means but with strong work ethics. Michael also graduated with honors, but he did it twice: first as an engineer and then from law school. He was quickly recruited by a prestigious Washington, D.C., law firm that specialized in patent law, and his future seemed bright, career path well-defined and early retirement guaranteed e-reading.club",
      recommendation:
          "Does school prepare children for the real world? Study hard and get good grades and you will find a high-paying job with great benefitsy parents used to say. Their goal in life was to provide a college education for my older sister and me, so that we would have the greatest chance for success in life. When T finally earned my diploma in 1976-graduating with honors, and near the top of my class, in accounting from Florida State University-my parents had realized their goal. It was the crowning achievement of their lives. In accordance with the  I was hired by a accounting firm, and I looked forward to a long career and retirement at an early age. My husband, Michael, followed a similar path. We both came from hard-working families, of modest means but with strong work ethics. Michael also graduated with honors, but he did it twice: first as an engineer and then from law school. He was quickly recruited by a prestigious Washington, D.C., law firm that specialized in patent law, and his future seemed bright,",
      listened: true),
  Book(
      image: "assets/image4.jpg",
      price: 12.0,
      exprice: 09.00,
      title: "Holiday Logs",
      author: "Athour Philipp",
      rate: 1.5,
      audiointroduction:
          "Does school prepare children for the real world? udy hard and get good grades and you will find a high-paying job with great benefits,my parents used to say. Their goal in life was to provide a college education for my older sister and me, so that we would have the greatest chance for success in life. When T finally earned my diploma in 1976-graduating with honors, and near the top of my class, in accounting from Florida State University-my parents had realized their goal. It was the crowning achievement of their lives. In accordance witounting firm, and I looked forward to a long career and retirement at an early age. My husband, Michael, followed a similar path. We both came from hard-working families, of modest means but with strong work ethics. Michael also graduated with honors, but he did it twice: first as an engineer and then from law school. He was quickly recruited by a prestigious Washington, D.C., law firm that specialized in patent law, and his future seemed bright, career path well-defined and early retirement guaranteed e-reading.club",
      listened: false),
  Book(
      image: "assets/image5.jpg",
      price: 12.0,
      exprice: 09.00,
      title: "Holiday Logs",
      author: "Athour Philipp",
      rate: 1.5,
      purchasedate: "Feb 12/2019",
      audiointroduction:
          "Does school prepare children for the real world? udy hard and get good grades and you will find a high-paying job with great benefits,my parents used to say. Their goal in life was to provide a college education for my older sister and me, so that we would have the greatest chance for success in life. When T finally earned my diploma in 1976-graduating with honors, and near the top of my class, in accounting from Florida State University-my parents had realized their goal. It was the crowning achievement of their lives. In accordance witounting firm, and I looked forward to a long career and retirement at an early age. My husband, Michael, followed a similar path. We both came from hard-working families, of modest means but with strong work ethics. Michael also graduated with honors, but he did it twice: first as an engineer and then from law school. He was quickly recruited by a prestigious Washington, D.C., law firm that specialized in patent law, and his future seemed bright, career path well-defined and early retirement guaranteed e-reading.club",
      recommendation:
          "Does school prepare children for the real world? Study hard and get good grades and you will find a high-paying job with great benefitsy parents used to say. Their goal in life was to provide a college education for my older sister and me, so that we would have the greatest chance for success in life. When T finally earned my diploma in 1976-graduating with honors, and near the top of my class, in accounting from Florida State University-my parents had realized their goal. It was the crowning achievement of their lives. In accordance with the  I was hired by a accounting firm, and I looked forward to a long career and retirement at an early age. My husband, Michael, followed a similar path. We both came from hard-working families, of modest means but with strong work ethics. Michael also graduated with honors, but he did it twice: first as an engineer and then from law school. He was quickly recruited by a prestigious Washington, D.C., law firm that specialized in patent law, and his future seemed bright,",
      bookintroduction:
          "Does school prepare children for the real world? Study hard and get good grades and you will find a high-paying job with great benefits, my parents used to say. Their goal in life was to provide a college education for my older sister and me, so that we would have the greatest chance for success in life. When T finally earned my diploma in 1976-graduating with honors, and near the top of my class, in accounting from Florida State University-my parents had realized their goal. It was the crowning achievement of their lives. In accordance with the  I was hired by a  accounting firm, and I looked forward to a long career and retirement at an early age. My husband, Michael, followed a similar path. We both came from hard-working families, of modest means but with strong work ethics. Michael also graduated with honors, but he did it twice: first as an engineer and then from law school. He was quickly recruited by a prestigious Washington, D.C., law firm that specialized in patent law, and his future seemed bright, career path well-defined and early retirement guaranteed e-reading.club",
      listened: false),
  Book(
      image: "assets/image6.jpg",
      price: 0.0,
      exprice: 09.00,
      title: "Holiday Logs",
      author: "Athour Philipp",
      rate: 1.5,
      audiointroduction:
          "Does school prepare children for the real world? udy hard and get good grades and you will find a high-paying job with great benefits,my parents used to say. Their goal in life was to provide a college education for my older sister and me, so that we would have the greatest chance for success in life. When T finally earned my diploma in 1976-graduating with honors, and near the top of my class, in accounting from Florida State University-my parents had realized their goal. It was the crowning achievement of their lives. In accordance witounting firm, and I looked forward to a long career and retirement at an early age. My husband, Michael, followed a similar path. We both came from hard-working families, of modest means but with strong work ethics. Michael also graduated with honors, but he did it twice: first as an engineer and then from law school. He was quickly recruited by a prestigious Washington, D.C., law firm that specialized in patent law, and his future seemed bright, career path well-defined and early retirement guaranteed e-reading.club",
      recommendation:
          "Does school prepare children for the real world? Study hard and get good grades and you will find a high-paying job with great benefitsy parents used to say. Their goal in life was to provide a college education for my older sister and me, so that we would have the greatest chance for success in life. When T finally earned my diploma in 1976-graduating with honors, and near the top of my class, in accounting from Florida State University-my parents had realized their goal. It was the crowning achievement of their lives. In accordance with the  I was hired by a accounting firm, and I looked forward to a long career and retirement at an early age. My husband, Michael, followed a similar path. We both came from hard-working families, of modest means but with strong work ethics. Michael also graduated with honors, but he did it twice: first as an engineer and then from law school. He was quickly recruited by a prestigious Washington, D.C., law firm that specialized in patent law, and his future seemed bright,",
      listened: false),
];
List<Book> purchaseddemolist = [
  Book(
    image: "assets/image4.jpg",
    price: 12.0,
    exprice: 09.00,
    title: "Holiday Logs",
    purchasedate: "Feb 10/2019",
  ),
  Book(image: "assets/image4.jpg", price: 12.0, exprice: 09.00, title: "Holiday Logs", purchasedate: "Jan 15/2018"),
  Book(image: "assets/image5.jpg", price: 12.0, exprice: 09.00, title: "Holiday Logs", purchasedate: "Sep 05/2017"),
  Book(image: "assets/image1.jpg", price: 12.0, exprice: 09.00, title: "Holiday Logs", purchasedate: "Feb 10/2019"),
  Book(image: "assets/image2.jpg", price: 12.0, exprice: 09.00, title: "Holiday Logs", purchasedate: "Jan 15/2018"),
  Book(image: "assets/image3.jpg", price: 12.0, exprice: 09.00, title: "Holiday Logs", purchasedate: "Sep 05/2017"),
  Book(image: "assets/image1.jpg", price: 12.0, exprice: 09.00, title: "Holiday Logs", purchasedate: "Feb 10/2019"),
  Book(image: "assets/image2.jpg", price: 12.0, exprice: 09.00, title: "Holiday Logs", purchasedate: "Jan 15/2018"),
  Book(image: "assets/image1.jpg", price: 12.0, exprice: 09.00, title: "Holiday Logs", purchasedate: "Sep 05/2017"),
  Book(image: "assets/image1.jpg", price: 12.0, exprice: 09.00, title: "Holiday Logs", purchasedate: "Feb 10/2019"),
  Book(image: "assets/image2.jpg", price: 12.0, exprice: 09.00, title: "Holiday Logs", purchasedate: "Jan 15/2018"),
  Book(image: "assets/image1.jpg", price: 12.0, exprice: 09.00, title: "Holiday Logs", purchasedate: "Sep 05/2017"),
];
List<Book> _featured = [
  Book(
      image: "assets/image4.jpg",
      price: 12.0,
      exprice: 09.00,
      title: "My Morning Sleep",
      author: "Philipp Anthropy",
      rate: 3),
  Book(
      image: "assets/image5.jpg",
      price: 12.0,
      exprice: 09.00,
      title: "Holiday Logs",
      author: "Philipp Anthropy",
      rate: 3.5),
  Book(
      image: "assets/image2.jpg",
      price: 12.0,
      exprice: 09.00,
      title: "Holiday Logs",
      author: "Philipp Anthropy",
      rate: 1),
  Book(
      image: "assets/image1.jpg",
      price: 12.0,
      exprice: 09.00,
      title: "Holiday Logs",
      author: "Philipp Anthropy",
      rate: 1),
  Book(
      image: "assets/image3.jpg",
      price: 12.0,
      exprice: 09.00,
      title: "Holiday Logs",
      author: "Philipp Anthropy",
      rate: 1),
];
List<Book> _mostlistened = [
  Book(
      image: "assets/image4.jpg",
      price: 12.0,
      exprice: 09.00,
      title: "My Morning Sleep",
      author: "Philipp Anthropy",
      rate: 3,
      dure: "12:23:22",
      description: "open source run-time environment for executing Javascript code on the server side."),
  Book(
      image: "assets/image5.jpg",
      exprice: 09.00,
      title: "Holiday Logs",
      author: "Philipp Anthropy",
      rate: 3.5,
      dure: "12:23:22",
      description: "open source run-time environment for executing Javascript code on the server side. "),
  Book(
      image: "assets/image4.jpg",
      price: 0,
      exprice: 09.00,
      title: "Holiday Logs",
      author: "Philipp Anthropy",
      rate: 1,
      dure: "12:23:22",
      description: "open source run-time environment for executing Javascript code on the server side."),
];

class value {
  List<Comment>? comments;
  List<Chapter>? chapters;
  List<Field>? fields;
  List<Book>? books;
  List<Book>? books_feaured;
  List<Book>? purchased;
  List<Book>? listened;

  User? userr;
  value() {
    this.comments = commentsdemolist;
    this.chapters = chapterdemolist;
    this.fields = fieldsdemolist;
    this.books = booksdemolist;
    this.books_feaured = _featured;
    this.purchased = purchaseddemolist;
    this.userr = user;
    this.listened = _mostlistened;
  }
  List<Comment>? get commentss {
    return comments;
  }

  List<Chapter>? get chapterss {
    return chapters;
  }

  List<Field>? get fieldss {
    return fields;
  }

  List<Book>? get bookss {
    return books;
  }

  List<Book>? get featuredd {
    return books_feaured;
  }

  List<Book>? get purchasedd {
    return purchased;
  }

  List<Book>? get listenedd {
    return listened;
  }

  User? get usser {
    return this.userr;
  }
}
