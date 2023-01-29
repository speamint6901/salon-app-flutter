import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:udemy_salon/domain/postal_codes/postal_code.dart';
import 'package:udemy_salon/providers/salon_form_provider.dart';

// 郵便番号検索API
AutoDisposeFutureProvider<PostalCode> postCodeToAddressProvider =
    FutureProvider.autoDispose((ref) async {
  // riverpodから取得
  final postalcode = ref.watch(postalCodeProvider);

  final upper = postalcode.substring(0, 3);
  final lower = postalcode.substring(3);

  final apiURL =
      'https://madefor.github.io/postal-code-api/api/v1/$upper/$lower.json';

  final apiURI = Uri.parse(apiURL);
  http.Response response = await http.get(apiURI);

  if (response.statusCode != 200) {
    throw Exception('通信に失敗しました。');
  }

  var jsonData = json.decode(response.body);
  return PostalCode.fromJson(jsonData);
});
