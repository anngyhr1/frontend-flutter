import 'package:ebooks/blocs/categories_provider.dart';
import 'package:ebooks/models/category.dart';
import 'package:ebooks/screens/bookdetail.dart';
import 'package:ebooks/screens/categories_chips/content.dart';
// import 'package:chips_choice/chips_choice.dart';
import 'package:ebooks/screens/selected_library.dart';
import 'package:flutter/material.dart';

class CategoriesChips extends StatefulWidget {
  @required
  final List<Category>? options;
  const CategoriesChips({Key? key, this.options}) : super(key: key);
  @override
  _CategoriesChipsState createState() => _CategoriesChipsState();
}

class _CategoriesChipsState extends State<CategoriesChips> {
  // single choice value
  int tag = 1;

  // multiple choice value
  List<String> tags = [];

  @override
  Widget build(BuildContext context) {
    final bloc = CategoriesProvider.of(context);
    return
        // Scaffold(
        //   appBar: AppBar(
        //     title: const Text('Flutter ChipsChoice'),
        //     actions: <Widget>[
        //       IconButton(
        //         icon: const Icon(Icons.help_outline),
        //         onPressed: () => null, //_about(context),
        //       )
        //     ],
        //   ),
        //   body:
        Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Expanded(
            child: ListView(
              addAutomaticKeepAlives: true,
              children: <Widget>[
                // Content(
                //   title: 'Categorias',
                //   child: ChipsChoice<int>.single(
                //     runSpacing: 10,
                //     value: tag,
                //     onChanged: (val) => {
                //       setState(() => tag = val),
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (_) => SelectedLibrary(
                //                   widget.options[val].name, bloc))),
                //       // print("val pressed ${widget.options[val].name}"),
                //     },
                //     choiceItems: C2Choice.listFrom<int, Category>(
                //       source: widget.options,
                //       value: (i, v) => i,
                //       label: (i, v) => v.name,
                //       //tooltip: (i, v) => v,
                //     ),
                //     choiceStyle: C2ChoiceStyle(
                //       borderRadius: const BorderRadius.all(Radius.circular(15)),
                //       showCheckmark: false,
                //     ),
                //     wrapped: true,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
    // );
  }
}
