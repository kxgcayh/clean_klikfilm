import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

final categoriesFutureProvider = FutureProvider((ref) async {
  final result = await ref.read(listHomeCategoryProvider);
  return result.data;
});
