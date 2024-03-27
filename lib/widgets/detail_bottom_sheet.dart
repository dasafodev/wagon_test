import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wagon/models/service.dart';
import 'package:wagon/models/user.dart';
import 'package:wagon/models/vehicle.dart';
import 'package:wagon/providers/services.dart';
import 'package:wagon/providers/users.dart';
import 'package:wagon/providers/vehicles.dart';
import 'package:wagon/widgets/service_date.dart';

class DetailBottomSheet extends ConsumerWidget {
  const DetailBottomSheet({
    this.service,
    super.key,
  });

  final Service? service;

  bool get isEditing => service != null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drivers = ref.watch(usersProvider);
    final vehicles = ref.watch(vehiclesProvider);
    Vehicle newVehicle = vehicles.firstWhere(
        (e) => e.id == service?.vehicle?.id,
        orElse: () => vehicles.first);
    User newDriver = drivers.firstWhere((e) => e.id == service?.driver?.id,
        orElse: () => drivers.first);

    DateTime newHour = service?.hour ?? DateTime.now();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Text(
                isEditing ? 'Modify service' : 'Add new service',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Spacer(),
              Chip(
                label: Text(service?.state.name ?? 'New'),
                backgroundColor: service?.state.color,
                shape:
                    StadiumBorder(side: BorderSide(color: Colors.transparent)),
              ),
            ],
          ),
          DropdownButtonFormField<String>(
            value: service?.driver?.id,
            onChanged: (String? value) {
              newDriver = drivers.firstWhere((e) => e.id == value);
            },
            items: drivers
                .map((e) => DropdownMenuItem(
                      value: e.id,
                      child: Text(e.name),
                    ))
                .toList(),
            decoration: InputDecoration(labelText: 'Driver'),
          ),
          DropdownButtonFormField<String>(
            value: service?.vehicle?.id,
            onChanged: (String? value) {
              newVehicle = vehicles.firstWhere((e) => e.id == value);
            },
            items: vehicles
                .map((e) => DropdownMenuItem(
                      value: e.id,
                      child: Text(e.plate ?? ''),
                    ))
                .toList(),
            decoration: InputDecoration(labelText: 'Vehicle'),
          ),
          SizedBox(height: 16.0),
          ServiceDate(
            service: service,
            onChanged: (DateTime newDate) {
              newHour = newDate;
            },
          ),
          SizedBox(height: 16.0),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: ElevatedButton(
              onPressed: () {
                if (service != null) {
                  ref
                      .read(servicesProvider.notifier)
                      .updateService(service!.copyWith(
                        vehicle: newVehicle,
                        driver: newDriver,
                        hour: newHour,
                      ));
                } else {
                  ref.read(servicesProvider.notifier).addService(
                        vehicle: newVehicle,
                        driver: newDriver,
                        hour: newHour,
                      );
                }
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          )
        ],
      ),
    );
  }
}
