import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:klikfilm_dart_resources/klikfilm_dart_resources.dart';

final generalInformationFutureProvider = FutureProviderFamily((ref, GeneralInformationType arg) async {
  final result = await ref.read(generalInformationProvider(arg));
  return result.data as GeneralInformationDataModel;
});
