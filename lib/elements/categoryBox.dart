import 'package:ebooks/blocs/categories_provider.dart';
import 'package:ebooks/models/category.dart';
import 'package:ebooks/screens/selected_library.dart';
import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({
    Key? key,
    required Category category,
  })  : category = category,
        super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final bloc = CategoriesProvider.of(context);
    var sizeW = MediaQuery.of(context).size.width;
    var sizeCard = sizeW - 150;
    return InkWell(
        child: categoryItem(context, sizeCard),
        //categoryCard(context, sizeCard),
        onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => SelectedLibrary(category.name, bloc)))
            });
  }

  Widget categoryItem(BuildContext context, double sizeCard) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      height: 70,
      width: sizeCard,
      decoration: BoxDecoration(
          image: DecorationImage(
              alignment: Alignment.topRight,
              image: AssetImage("assets/image1.jpg"),
              fit: BoxFit.fitHeight),
          color: Theme.of(context).backgroundColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
                offset: Offset(0, 3.0),
                blurRadius: 10.0,
                color: Theme.of(context).hintColor.withOpacity(0.09)),
          ],
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Row(
        children: [
          Text(
            this.category.name!,
            maxLines: 2,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget categoryCard(BuildContext context, double sizeCard) {
    return Card(
      color: Theme.of(context).backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              this.category.name!,
              maxLines: 2,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          // new Spacer(),
          Container(
            width: 50,
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topRight,
                    image: AssetImage("assets/image1.jpg"),
                    fit: BoxFit.fitHeight),
                color: Theme.of(context).primaryColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      offset: Offset(0, 3.0),
                      blurRadius: 10.0,
                      color: Theme.of(context).hintColor.withOpacity(0.09)),
                ],
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5))),
          )
        ],
      ),
    );
  }
}
