import 'dart:convert';

import 'package:ebooks/blocs/categories_provider.dart';
import 'package:ebooks/blocs/crud_bloc.dart';
import 'package:ebooks/blocs/crud_provider.dart';
import 'package:ebooks/commons/platform_exception_alert_dialog.dart';
import 'package:ebooks/screens/crud/storie_form_part_two.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:zefyrka/zefyrka.dart';

import 'settings.dart';

typedef DemoContentBuilder = Widget Function(BuildContext context,
    ZefyrController controller, TextEditingController titleController);

// Common scaffold for all examples.
class DemoScaffold extends StatefulWidget {
  /// Filename of the document to load into the editor.
  final String documentFilename;
  final DemoContentBuilder builder;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final bool showToolbar;
  final CrudBloc? crudBloc;

  const DemoScaffold(
      {Key? key,
      required this.documentFilename,
      required this.builder,
      this.actions,
      this.showToolbar = true,
      this.floatingActionButton,
      this.crudBloc})
      : super(key: key);

  @override
  _DemoScaffoldState createState() => _DemoScaffoldState();
}

class _DemoScaffoldState extends State<DemoScaffold> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  ZefyrController? _controller;
  TextEditingController? titleController;

  bool _loading = false;
  bool _canSave = true;

  //late CrudBloc crudBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_controller == null && !_loading) {
      _loading = true;
      final settings = Settings.of(context)!;
      if (settings.assetsPath!.isEmpty) {
        _loadFromAssets();
      } else {
        _loadFromPath(settings.assetsPath);
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    titleController?.dispose();
    super.dispose();
  }

  Future<void> _loadFromAssets() async {
    try {
      final result =
          await rootBundle.loadString('assets/${widget.documentFilename}');
      final doc = NotusDocument.fromJson(jsonDecode(result));
      setState(() {
        _controller = ZefyrController(doc);
        titleController = new TextEditingController();
        _loading = false;
      });
    } catch (error) {
      final doc = NotusDocument()..insert(0, '');
      setState(() {
        _controller = ZefyrController(doc);
        titleController = new TextEditingController();
        _loading = false;
      });
    }
  }

  Future<void> _loadFromPath(String? assetsPath) async {
    final fs = LocalFileSystem();
    final file =
        fs.directory(assetsPath).childFile('${widget.documentFilename}');
    if (await file.exists()) {
      final data = await file.readAsString();
      final doc = NotusDocument.fromJson(jsonDecode(data));
      setState(() {
        titleController = new TextEditingController();
        _controller = ZefyrController(doc);
        _loading = false;
        _canSave = true;
      });
    } else {
      final doc = NotusDocument()..insert(0, 'Empty asset');
      setState(() {
        titleController = new TextEditingController();
        _controller = ZefyrController(doc);
        _loading = false;
        _canSave = true;
      });
    }
  }

  Future<dynamic> _save() async {
    // final settings = Settings.of(context)!;
    // final fs = LocalFileSystem();
    // final file = fs
    //     .directory(settings.assetsPath)
    //     .childFile('${widget.documentFilename}');
    String titleStorie = titleController!.text;
    String storieBody = jsonEncode(_controller!.document);

    //print('json ${_controller!.document.toJson()[0].insert}');

    print('storieBody $storieBody');
    print("titleController.text");
    print(titleController!.text);

    if (titleStorie.isEmpty || _controller!.document.toJson()[0].length <= 1)
      return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error'),
          content: const Text(
              'El Titulo y cuerpo da la historia no pueden ser vacios'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );

    final crudBloc = CrudProvider.of(context);
    FormStorie? formStorie = crudBloc.currentFormStorie;
    formStorie.title = titleStorie;

    formStorie.body = storieBody;
    print('formStorie.title ${formStorie.title}');
    print('formStorie.body ${formStorie.body}');
    crudBloc.setFormStorie(formStorie);
    // await file.writeAsString(data);
    // ScaffoldMessenger.of(_scaffoldKey.currentContext!)
    //     .showSnackBar(SnackBar(content: Text('Saved.')));
    //
    //
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            // SettingsProvider(
            //   settings: _settings,
            //   child:
            CategoriesProvider(child: StorieFormPartTwo(crudBloc)),
        // ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // widget.crudBloc = CrudProvider.of(context);
    final actions = widget.actions ?? <Widget>[];
    // actions.add(TextButton(
    //   onPressed: () => _saveToStream,
    //   child: Text('Siguiente'),
    // ));
    // if (_canSave) {
    //   print("actions.add");
    //   actions.add(IconButton(
    //     onPressed: _save,
    //     icon: Icon(
    //       Icons.arrow_forward,
    //       color: Colors.grey.shade800,
    //       size: 18,
    //     ),
    //   ));
    // }
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        centerTitle: false,
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.grey.shade800,
            size: 18,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: _loading || widget.showToolbar == false
            ? null
            : ZefyrToolbar.basic(controller: _controller!),
        actions: [
          IconButton(
            onPressed: _save,
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.grey.shade800,
              size: 18,
            ),
          )
        ],
      ),
      floatingActionButton: widget.floatingActionButton,
      body: _loading
          ? Center(child: Text('Loading...'))
          : widget.builder(context, _controller!, titleController!),
    );
  }
}
