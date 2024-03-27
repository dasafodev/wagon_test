import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:wagon/enums/filter.dart';
import 'package:wagon/models/service_filter.dart';
import 'package:wagon/providers/filter.dart';
import 'package:wagon/providers/services.dart';
import 'package:wagon/widgets/detail_bottom_sheet.dart';
import 'package:wagon/widgets/search_app_bar.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final services = ref.watch(filteredServicesProvider);

    return Scaffold(
        appBar: SearchAppBar(
          onChanged: (String value, String filter) {
            ref.read(todoListFilter.notifier).state =
                ServiceFilter(Filter.fromString(filter), value);
          },
        ),
        body: ListView.builder(
          itemCount: services.length,
          itemBuilder: (context, index) {
            final service = services[index];
            return ListTile(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => DetailBottomSheet(
                    service: service,
                  ),
                );
              },
              leading: Icon(Icons.directions_bus, color: service.state.color),
              title: Text(service.route.name),
              trailing: Text(service.driver?.name ?? ''),
              subtitle: Text(service.hour.toMoment().calendar()),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => DetailBottomSheet(),
            );
          },
          child: Icon(Icons.add),
        ));
  }
}
