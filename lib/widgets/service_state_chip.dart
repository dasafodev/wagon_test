import 'package:flutter/material.dart';
import 'package:wagon/enums/service_state.dart';
import 'package:wagon/models/service.dart';

class ServiceStateChip extends StatefulWidget {
  const ServiceStateChip({
    super.key,
    required this.service,
    this.onSelected,
  });

  final Service? service;
  final Function(ServiceState)? onSelected;

  @override
  State<ServiceStateChip> createState() => _ServiceStateChipState();
}

class _ServiceStateChipState extends State<ServiceStateChip> {
  ServiceState? serviceState;

  @override
  void initState() {
    serviceState = widget.service?.state;
    super.initState();
  }

  void toggleState() {
    setState(() {
      serviceState = serviceState == ServiceState.active
          ? ServiceState.inactive
          : ServiceState.active;
      widget.onSelected?.call(serviceState!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      onSelected: (_) => toggleState(),
      label: Text(serviceState?.name ?? 'New'),
      backgroundColor: serviceState?.color,
      shape: StadiumBorder(side: BorderSide(color: Colors.transparent)),
    );
  }
}
