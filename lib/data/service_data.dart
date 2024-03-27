import 'package:wagon/enums/role.dart';
import 'package:wagon/enums/route.dart';
import 'package:wagon/enums/service_state.dart';
import 'package:wagon/models/service.dart';
import 'package:wagon/models/user.dart';
import 'package:wagon/models/vehicle.dart';

List<Service> allServices = [
  Service(
    id: '1',
    hour: DateTime.now(),
    waitingTime: DateTime.now(),
    places: 10,
    state: ServiceState.active,
    route: Route.route1,
    driver: User(id: '1', role: Role.driver),
    vehicle: Vehicle(id: '1'),
  ),
  Service(
    id: '2',
    hour: DateTime.now(),
    waitingTime: DateTime.now(),
    places: 10,
    state: ServiceState.finished,
    route: Route.route1,
    driver: User(id: '2', role: Role.driver),
    vehicle: Vehicle(id: '1'),
  ),
  Service(
    id: '3',
    hour: DateTime.now(),
    waitingTime: DateTime.now(),
    places: 10,
    state: ServiceState.active,
    route: Route.route2,
    driver: User(id: '1', role: Role.driver),
    vehicle: Vehicle(id: '1'),
  ),
  Service(
    id: '4',
    hour: DateTime.now(),
    waitingTime: DateTime.now(),
    places: 10,
    state: ServiceState.inactive,
    route: Route.route1,
    driver: User(id: '2', role: Role.driver),
    vehicle: Vehicle(id: '1'),
  ),
  Service(
    id: '5',
    hour: DateTime.now(),
    waitingTime: DateTime.now(),
    places: 10,
    state: ServiceState.active,
    route: Route.route1,
    driver: User(id: '1', role: Role.driver),
    vehicle: Vehicle(id: '1'),
  ),
  Service(
    id: '6',
    hour: DateTime.now(),
    waitingTime: DateTime.now(),
    places: 10,
    state: ServiceState.active,
    route: Route.route2,
    driver: User(id: '2', role: Role.driver),
    vehicle: Vehicle(id: '1'),
  ),
  Service(
    id: '7',
    hour: DateTime.now(),
    waitingTime: DateTime.now(),
    places: 10,
    state: ServiceState.finished,
    route: Route.route1,
    driver: User(id: '2', role: Role.driver),
    vehicle: Vehicle(id: '1'),
  ),
  Service(
    id: '8',
    hour: DateTime.now(),
    waitingTime: DateTime.now(),
    places: 10,
    state: ServiceState.finished,
    route: Route.route2,
    driver: User(id: '1', role: Role.driver),
    vehicle: Vehicle(id: '1'),
  ),
  Service(
    id: '9',
    hour: DateTime.now(),
    waitingTime: DateTime.now(),
    places: 10,
    state: ServiceState.inactive,
    route: Route.route2,
    driver: User(id: '1', role: Role.driver),
    vehicle: Vehicle(id: '1'),
  )
];
