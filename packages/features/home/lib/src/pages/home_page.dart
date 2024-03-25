import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:utility/utility.dart';

import '../widgets/widgets.dart';

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
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          switch (state.status) {
            case ViewStatus.failure:
            case ViewStatus.loading:
              return const HomeLoading();
            case ViewStatus.success:
              return HomeSuccess(
                onScrollEndNotification: () =>
                    bloc.add(GetCharactersEvent(state.characters.next)),
                characters: state.charactersFiltered,
                loadingNewData: state.loadingNewData,
              );
            default:
              return const HomeLoading();
          }
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: _showFilterBottomSheet,
        child: const Icon(Icons.filter_alt),
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
