import 'package:ebooks/blocs/categories_bloc.dart';
import 'package:ebooks/blocs/categories_provider.dart';
import 'package:flutter/material.dart';

class Refresh extends StatelessWidget {
  final Widget? child;
  final CategoriesBloc? bloc;
  Refresh({this.child, this.bloc});

  Widget build(context) {
    // final bloc = CategoriesProvider.of(context);

    return RefreshIndicator(
      child: child!,
      onRefresh: () async {
        // await bloc.clearCache();
        //await bloc.setStorieList(<StorieModel>[]);
        //await bloc.clearCache();
        await bloc!.setPageNumber(0);
        await bloc!.setHasMore(true);
        //await bloc.clearCache();
        // bloc.setStorieList(null);
        await bloc!.loadMore();
      },
    );
  }
}
