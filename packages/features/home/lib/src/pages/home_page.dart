import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:home/src/widgets/home_loading.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:utility/utility.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeBloc bloc;

  @override
  void initState() {
    bloc = context.read<HomeBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Scrollbar(
        child: CustomScrollView(
          slivers: [
            PagedSliverList<String?, Character>(
              pagingController: bloc.controller,
              builderDelegate: PagedChildBuilderDelegate(
                firstPageProgressIndicatorBuilder: (context) =>
                    const HomeLoading(),
                newPageProgressIndicatorBuilder: (context) =>
                    const HomeLoading(),
                itemBuilder: (context, item, index) => ListTile(
                  title: Text(item.name),
                  trailing: Text(item.gender.name),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...item.films
                          .map((film) => Text(
                                film.title,
                              ))
                          .toList()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
