import 'package:wagon/enums/role.dart';

class User {
  final String id;
  final String name;
  final Role role;

  User({required this.id, required this.role, required this.name});
}
