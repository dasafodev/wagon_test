import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wagon/providers/services.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final services = ref.watch(servicesProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: ListView.builder(
          itemCount: services.length,
          itemBuilder: (context, index) {
            final service = services[index];
            return ListTile(
              title: Text(service.route.name),
              subtitle: Text(service.driver?.name ?? ''),
              trailing: Text(service.state.toString()),
            );
          },
        ));
  }
}
