
import 'package:ebooks/render_storie/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:zefyrka/zefyrka.dart';



class ScrollableLayout extends StatefulWidget {
  final String? storie;
  ScrollableLayout(this.storie);

  @override
  _ScrollableLayoutState createState() => _ScrollableLayoutState();
}

class _ScrollableLayoutState extends State<ScrollableLayout> {
  final FocusNode _focusNode = FocusNode();

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DemoScaffold(
      storie: widget.storie,
      builder: _buildContent,
    );
  }

  Widget _buildContent(BuildContext context, ZefyrController controller
  //, TextEditingController titleController
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black26,
        ),
        child: ListView(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            ZefyrEditor(
              controller: controller,
              focusNode: _focusNode,
              scrollController: _scrollController,
              scrollable: false,
              showCursor: false,
              autofocus: true,
              readOnly: true,
              padding: EdgeInsets.symmetric(horizontal: 8),
            ),
          ],
        ),
      ),
    );
  }

}
