import 'package:flutter/material.dart';
import 'package:home/home.dart';
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
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            switch (state.status) {
              case ViewStatus.loading:
              case ViewStatus.failure:
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              case ViewStatus.success:
                return ListView.builder(
                  itemCount: state.characters.results.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      state.characters.results[index].name,
                    ),
                  ),
                );
            }
          },
        ));
  }
}
