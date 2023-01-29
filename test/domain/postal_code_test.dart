import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:udemy_salon/domain/postal_codes/postal_code.dart';

void main() {
  String jsonData = '''
    {
  "code": "1000014",
  "data": [
    {
      "prefcode": "13",
      "ja": {
        "prefecture": "東京都",
        "address1": "千代田区",
        "address2": "永田町",
        "address3": "",
        "address4": ""
      },
      "en": {
        "prefecture": "Tokyo",
        "address1": "Chiyoda-ku",
        "address2": "Nagatacho",
        "address3": "",
        "address4": ""
      }
    }
  ]
} 
  ''';
  test('fromJson', () async {
    var data = json.decode(jsonData);
    PostalCode result = PostalCode.fromJson(data);
    expect(result.code, '1000014');
    expect(result.data[0].prefcode, '13');
  });
}
