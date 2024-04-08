import 'dart:convert';
import 'dart:html';

import 'package:ebooks/models/storie_model.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zefyrka/zefyrka.dart';

import 'settings.dart';

typedef DemoContentBuilder = Widget Function(
    BuildContext context, ZefyrController controller);

// Common scaffold for all examples.
class DemoScaffold extends StatefulWidget {
  /// Filename of the document to load into the editor.
  //final String documentFilename;
  final DemoContentBuilder builder;
  final String? storie;

  const DemoScaffold({
    Key? key,
    required this.builder,
    required this.storie
  }) : super(key: key);

  @override
  _DemoScaffoldState createState() => _DemoScaffoldState();
}

class _DemoScaffoldState extends State<DemoScaffold> {
 // final _scaffoldKey = GlobalKey<ScaffoldState>();
  ZefyrController? _controller;
  bool _loading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_controller == null && !_loading) {
      _loading = true;
      _loadFromPath();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _loadFromPath() async {
    setState(() {
      _controller = ZefyrController(
        NotusDocument.fromJson(
          jsonDecode(widget.storie.toString())));
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
          ? Center(child: Text('Loading...'))
          : widget.builder(context, _controller!);
  }
}
