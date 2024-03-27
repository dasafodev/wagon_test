import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wagon/data/vehicle_data.dart';
import 'package:wagon/models/vehicle.dart';

part 'vehicles.g.dart';

@riverpod
List<Vehicle> vehicles(VehiclesRef ref) {
  return vehiclesData.entries.map((e) => e.value).toList();
}
