import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wagon/enums/filter.dart';

part 'filter.g.dart';

@riverpod
Filter filter(FilterRef ref) => Filter.all;
