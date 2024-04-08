import 'package:flutter/material.dart';
import 'package:zefyrka/zefyrka.dart';

import 'scaffold.dart';

class ScrollableLayout extends StatefulWidget {
  final String? storie;

  const ScrollableLayout({Key? key, this.storie}) : super(key: key);
  @override
  _ScrollableLayoutState createState() => _ScrollableLayoutState();
}

class _ScrollableLayoutState extends State<ScrollableLayout> {
  final FocusNode _focusNode = FocusNode();

  final _scrollController = ScrollController();

  @override
  build(BuildContext context) {
    return 
    DemoScaffold(
      storie: widget.storie.toString(),
      builder: _buildContent, 
    );
  }

  Widget _buildContent(BuildContext context, ZefyrController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: ListView(
          controller: _scrollController,
          children: [
            Divider(),
            ZefyrEditor(
              controller: controller,
              focusNode: _focusNode,
              scrollController: _scrollController,
              scrollable: false,
              autofocus: true,
              padding: EdgeInsets.symmetric(horizontal: 8),
            ),
            Divider()
          ],
        ),
      ),
    );
  }

}
