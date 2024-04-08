import 'package:awesome_select/awesome_select.dart';
import 'package:ebooks/blocs/categories_provider.dart';
import 'package:ebooks/blocs/crud_bloc.dart';
import 'package:ebooks/blocs/crud_provider.dart';
import 'package:ebooks/elements/TopBarWidget.dart';
import 'package:ebooks/models/category.dart';
import 'package:ebooks/screens/accueil.dart';
import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

class StorieFormPartTwo extends StatefulWidget {
  final CrudBloc? crudBloc;
  StorieFormPartTwo(this.crudBloc);

  @override
  _StorieFormPartTwoState createState() => _StorieFormPartTwoState(crudBloc);
}

class _StorieFormPartTwoState extends State<StorieFormPartTwo>
    with SingleTickerProviderStateMixin {
  int enabledfield = 0;
  String? _cat = '';
  List<String>? tags = [];
  CrudBloc? crudBloc;

  _StorieFormPartTwoState(this.crudBloc);

  @override
  void initState() {
    //tags = crudBloc.getTagList.last;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = CategoriesProvider.of(context);
    bloc.loadCategories();

    return Scaffold(
        body: Column(
      children: <Widget>[
        TopBarWidget(
          title: '',
          hasBackButton: true,
          transparent: true,
        ),
        StreamBuilder<List<String>>(
            stream: crudBloc!.getTagList,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text("carregando");
              }
              tags = snapshot.data;
              return Container(
                padding: const EdgeInsets.all(12.0),
                child: TextFieldTags(
                  initialTags: snapshot.data,
                  tagsStyler: TagsStyler(
                    showHashtag: true,
                    tagMargin: const EdgeInsets.only(right: 4.0),
                    tagCancelIcon:
                        Icon(Icons.cancel, size: 15.0, color: Colors.black),
                    tagCancelIconPadding: EdgeInsets.only(left: 4.0, top: 2.0),
                    tagPadding: EdgeInsets.only(
                        top: 2.0, bottom: 4.0, left: 8.0, right: 4.0),
                    tagDecoration: BoxDecoration(
                      color: Colors.blue[300],
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    // BoxDecoration(
                    //   color: Colors.white,
                    //   border: Border.all(
                    //     color: Colors.grey.shade300,
                    //   ),
                    //   borderRadius: const BorderRadius.all(
                    //     Radius.circular(20.0),
                    //   ),
                    // ),
                    tagTextStyle: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.black),
                  ),
                  textFieldStyler: TextFieldStyler(
                    hintText: "Tags",
                    isDense: false,
                    textFieldFocusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3.0),
                    ),
                    textFieldBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3.0),
                    ),
                  ),
                  onDelete: (tag) {
                    print('onDelete: $tag');
                    tags?.remove(tag);
                    crudBloc!.setTagList(tags!);
                  },
                  onTag: (tag) {
                    print('onTag: $tag');
                    tags?.add(tag);
                    crudBloc!.setTagList(tags!);
                  },
                  validator: (String tag) {
                    print('validator: $tag');
                    if (tag.length > 10) {
                      return "hey that is too much";
                    }
                    return null;
                  },
                ),
              );
            }),
        const Divider(indent: 20),
        Text(
          'Genero',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        StreamBuilder<List<Category>>(
            stream: bloc.categories,
            builder: (context, AsyncSnapshot<List<Category>> snapshot) {
              if (!snapshot.hasData) {
                return Text('Cargando');
              }
              return StreamBuilder<String>(
                  stream: crudBloc!.getSelectedCag,
                  builder: (context, snapshot2) {
                    if (!snapshot2.hasData) {
                      return Text('Cargando');
                    }
                    return SmartSelect<String?>.single(
                        title: 'Categorias',
                        selectedValue: snapshot2.data,
                        choiceItems: snapshot.data!
                            .map(
                              (e) => S2Choice<String>(
                                value: e.name.toString(),
                                title: e.name,
                              ),
                            )
                            .toList(),
                        onChange: (selected) => {
                              crudBloc!
                                  .setSelectedCat(selected.value.toString()),
                              setState(() => _cat = selected.value),
                            });
                  });
            }),
        SizedBox(
          height: 60,
        ),
        FloatingActionButton.extended(
          onPressed: () {
            crudBloc!.insertStory();
            Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
          },
          icon: Icon(Icons.account_circle),
          label: Text("Publicar"),
        ),
      ],
    ));
  }
}
