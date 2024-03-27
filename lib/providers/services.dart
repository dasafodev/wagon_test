import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wagon/enums/filter.dart';
import 'package:wagon/enums/service_state.dart';
import 'package:wagon/models/service.dart';
import 'package:wagon/models/service_filter.dart';
import 'package:wagon/models/user.dart';
import 'package:wagon/models/vehicle.dart';
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

  void addService({
    required User driver,
    required Vehicle vehicle,
    required DateTime hour,
  }) {
    final newService = Service(
      id: (state.length + 1).toString(),
      route: state.first.route,
      driver: driver,
      hour: hour,
      vehicle: vehicle,
      state: ServiceState.active,
      places: 10,
      waitingTime: DateTime.now(),
    );
    state = [...state, newService];
  }

  void updateService(Service service) {
    state = [
      for (final s in state)
        if (s.id == service.id) service else s
    ];
  }
}

@riverpod
List<Service> filteredServices(FilteredServicesRef ref) {
  final List<Service> services = ref.watch(servicesProvider);
  final ServiceFilter filter = ref.watch(todoListFilter);
  if (filter.value.isEmpty) {
    return services;
  }

  switch (filter.filter) {
    case Filter.all:
      return services
          .where((service) =>
              _filterByDriver(service, filter.value) ||
              _filterByRoute(service, filter.value))
          .toList();
    case Filter.date:
      return [];
    case Filter.driver:
      return services
          .where((service) => _filterByDriver(service, filter.value))
          .toList();
    case Filter.route:
      return services
          .where((service) => _filterByRoute(service, filter.value))
          .toList();
  }
}

bool _filterByDriver(Service service, String value) {
  return service.driver != null &&
      service.driver!.name.toLowerCase().contains(value.toLowerCase());
}

bool _filterByRoute(Service service, String value) {
  return service.route.name.toLowerCase().contains(value.toLowerCase());
}
