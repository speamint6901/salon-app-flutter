import 'package:flutter_riverpod/flutter_riverpod.dart';

final userNameProvider = StateProvider.autoDispose((ref) => "");
final salonNameProvider = StateProvider.autoDispose((ref) => "");
final prefProvider = StateProvider.autoDispose((ref) => "");
final cityNameProvider = StateProvider.autoDispose((ref) => "");
final address1Provider = StateProvider.autoDispose((ref) => "");
final address2Provider = StateProvider.autoDispose((ref) => "");
final postalCodeProvider = StateProvider.autoDispose((ref) => "");
final categoriesProvider = StateProvider.autoDispose((ref) => []);
final descriptionProvider = StateProvider.autoDispose((ref) => "");
