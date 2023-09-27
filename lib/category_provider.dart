import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tryapp/category_model.dart';
import 'package:tryapp/network.dart';

final categoryProvider = FutureProvider<List<CategoryModel>>((ref) async {
  return ref.watch(provider).getCategorywithProduct();
});
