import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wagon/enums/filter.dart';
import 'package:wagon/models/service_filter.dart';

final todoListFilter = StateProvider((_) => ServiceFilter(Filter.all, ''));
