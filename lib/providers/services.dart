import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wagon/enums/filter.dart';
import 'package:wagon/enums/route.dart';
import 'package:wagon/models/service.dart';
import 'package:wagon/providers/filter.dart';
import 'package:wagon/repository/service.dart';

part 'services.g.dart';

@riverpod
class Services extends _$Services {
  final ServiceRepository _serviceRepository = ServiceRepository();
  @override
  List<Service> build() {
    return _serviceRepository.fetchServices();
  }
}

@riverpod
List<Service> filteredServices(FilteredServicesRef ref, String value) {
  final List<Service> services = ref.watch(servicesProvider);
  final Filter filter = ref.watch(filterProvider);

  switch (filter) {
    case Filter.all:
      return services;
    case Filter.date:
      return [];
    case Filter.driver:
      return services
          .where((service) =>
              service.driver != null && service.driver?.id == value)
          .toList();
    case Filter.route:
      return services
          .where((service) =>
              service.route ==
              Route.values.firstWhere(
                  (route) => route.toString().split('.').last == value))
          .toList();
  }
}
