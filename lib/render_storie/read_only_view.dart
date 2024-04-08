import 'package:ebooks/models/storie_model.dart';
import 'package:ebooks/render_storie/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:zefyrka/zefyrka.dart';

class ReadOnlyView extends StatefulWidget {
  final String? storie;
  ReadOnlyView(this.storie);

  @override
  _ReadOnlyViewState createState() => _ReadOnlyViewState();
}

class _ReadOnlyViewState extends State<ReadOnlyView> {
  final FocusNode _focusNode = FocusNode();

  bool _edit = false;

  @override
  Widget build(BuildContext context) {
    return 
    DemoScaffold(
      storie: widget.storie,
      builder: _buildContent
    );
  }

  Widget _buildContent(BuildContext context, ZefyrController controller) {
    return Container(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
          ZefyrEditor(
            controller: controller,
            focusNode: _focusNode,
            autofocus: true,
            expands: true,
            readOnly: !_edit,
            showCursor: _edit,
            padding: EdgeInsets.symmetric(horizontal: 8),
          ),
      ),
    );
  }

}
