import 'package:wagon/data/service_data.dart';
import 'package:wagon/models/service.dart';

class ServiceRepository {
  List<Service> fetchServices() {
    return allServices;
  }
}
