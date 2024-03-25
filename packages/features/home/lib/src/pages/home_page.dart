import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:home/src/widgets/filter_bottom_sheet.dart';
import 'package:home/src/widgets/home_loading.dart';
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
    bloc = context.read<HomeBloc>()..add(const GetCharactersEvent(null));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        actions: [
          IconButton(
              onPressed: (_showFilterBottomSheet),
              icon: const Icon(Icons.filter_alt))
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          switch (state.status) {
            case ViewStatus.failure:
            case ViewStatus.loading:
              return const HomeLoading();
            case ViewStatus.success:
              return Stack(
                children: [
                  NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      if (notification is ScrollEndNotification &&
                          notification.metrics.extentAfter == 0) {
                        // User has reached the end of the list
                        // Load more data
                        bloc.add(GetCharactersEvent(state.characters.next));
                      }
                      return false;
                    },
                    child: ListView.builder(
                      itemCount: state.charactersFiltered.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(state.charactersFiltered[index].name),
                        trailing:
                            Text(state.charactersFiltered[index].gender.name),
                        subtitle: Text(
                          state.charactersFiltered[index].films
                              .map((film) => film.title)
                              .join(', '),
                        ),
                      ),
                    ),
                  ),
                  if (state.loadingNewData)
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: LinearProgressIndicator(),
                    )
                ],
              );
            default:
              return const HomeLoading();
          }
        },
      ),
    );
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const FilterBottomSheet(),
    );
  }
}
