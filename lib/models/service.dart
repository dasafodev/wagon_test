import 'package:wagon/enums/route.dart';
import 'package:wagon/enums/service_state.dart';
import 'package:wagon/models/user.dart';
import 'package:wagon/models/vehicle.dart';

class Service {
  String id;
  DateTime hour;
  DateTime waitingTime;
  int places;
  ServiceState state;
  Route route;
  User? driver;
  Vehicle? vehicle;

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
}
