import 'dart:convert';
import 'package:ebooks/screens/crud/storie_form_part_two.dart';
import 'package:flutter/material.dart';
import 'package:zefyrka/zefyrka.dart';

import 'scaffold.dart';

class DecoratedFieldDemo extends StatefulWidget {
  @override
  _DecoratedFieldDemoState createState() => _DecoratedFieldDemoState();
}

class _DecoratedFieldDemoState extends State<DecoratedFieldDemo> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      documentFilename: 'decorated_field.note',
      builder: _buildContent,
      showToolbar: false,
      actions: [
        // TextButton(
        //   onPressed: () => _saveToStream,
        //   child: Text('Siguiente'),
        // )
      ],
    );
  }

  // void _saveToStream(
  //     ZefyrController controller, TextEditingController titleController) async {
  //   print(titleController.text);
  //   print(jsonEncode(controller.document));

  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (BuildContext context) =>
  //           // SettingsProvider(
  //           //   settings: _settings,
  //           //   child:
  //           StorieFormPartTwo(),
  //       // ),
  //     ),
  //   );
  // }

  Widget _buildContent(BuildContext context, ZefyrController controller,
      TextEditingController titleController) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          // Row(children: [
          //   Align(
          //     alignment: Alignment.center,
          //     child:
          //         // Container(
          //         //   height: 30,
          //         //   width: 50,
          //         // child:
          //         TextButton(
          //       onPressed: () =>
          //           null, //_saveToStream(controller, titleController),
          //       child: Text('Siguiente'),
          //     ),
          //   ),
          //   //fit: FlexFit.loose,
          //   // )
          // ]),
          Align(
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Titulo',
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            alignment: Alignment.center,
          ),
//          TextField(),
          SizedBox(
            height: 20,
          ),
          ZefyrField(
            controller: controller,
            focusNode: _focusNode,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 8.0),
              //   labelText: 'Description',
              hintText: 'Pulsa aqui para escribir tu historia',
            ),
            toolbar: ZefyrToolbar.basic(controller: controller),
            // minHeight: 80.0,
            // maxHeight: 160.0,
          ),
          // TextField(
          //   decoration: InputDecoration(labelText: 'Final thoughts'),
          //   maxLines: 3,
          // ),
        ],
      ),
    );
  }
}
