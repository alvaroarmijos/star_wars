import 'package:catalog/catalog.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:utility/utility.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filters',
                style: textTheme.titleMedium,
              ),
              IconButton(
                onPressed: () => Navigator.maybePop(context),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          ...Gender.values.map(
            (gender) => BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return RadioListTile<Gender?>(
                  title: Text(gender.name),
                  value: gender,
                  groupValue: state.filter,
                  onChanged: (Gender? value) {
                    context.read<HomeBloc>().add(AddFilterEvent(value));
                    Navigator.maybePop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
