import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wagon/data/users_data.dart';
import 'package:wagon/models/user.dart';

part 'users.g.dart';

@riverpod
List<User> users(UsersRef ref) {
  return usersData.entries.map((e) => e.value).toList();
}
