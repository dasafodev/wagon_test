import 'package:wagon/enums/route.dart';
import 'package:wagon/enums/service_state.dart';
import 'package:wagon/models/user.dart';
import 'package:wagon/models/vehicle.dart';

class Service {
  final String id;
  final DateTime hour;
  final DateTime waitingTime;
  final int places;
  final ServiceState state;
  final Route route;
  final User? driver;
  final Vehicle? vehicle;

  Service({
    required this.id,
    required this.hour,
    required this.waitingTime,
    required this.places,
    required this.state,
    required this.route,
    this.driver,
    this.vehicle,
  });

  Service copyWith({
    String? id,
    DateTime? hour,
    DateTime? waitingTime,
    int? places,
    ServiceState? state,
    Route? route,
    User? driver,
    Vehicle? vehicle,
  }) {
    return Service(
      id: id ?? this.id,
      hour: hour ?? this.hour,
      waitingTime: waitingTime ?? this.waitingTime,
      places: places ?? this.places,
      state: state ?? this.state,
      route: route ?? this.route,
      driver: driver ?? this.driver,
      vehicle: vehicle ?? this.vehicle,
    );
  }
}
