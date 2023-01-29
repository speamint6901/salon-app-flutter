class CustomValidator {
  String errorMessage = '';

  // 必須入力
  bool isValidRequiredText(String? value) {
    errorMessage = '必須項目です。';
    if (value == null) {
      return false;
    }
    return value.trim().isNotEmpty;
  }

  // 最大文字数チェック
  bool isValidTextLength(String? value, int length) {
    errorMessage = '最大${length}文字までです。';
    if (value!.length >= length) {
      return false;
    }
    return true;
  }

  // 文字数固定チェック
  bool isValidFixedLength(String? value, int length) {
    errorMessage = '${length}文字です';
    if (value!.length != length) {
      return false;
    }
    return true;
  }

  // 英数のみ
  bool isValidTextNum(String value) {
    errorMessage = '英数のみです。';
    const _regExpString = r'^[0-9a-zA-Z]$';
    return RegExp(_regExpString, caseSensitive: true).hasMatch(value);
  }

  // 数字のみ
  bool isValidNum(String value) {
    errorMessage = '数字のみです。';
    const _regExpString = r'(\d+)';
    return RegExp(_regExpString).hasMatch(value);
  }

  String getMessage({required String key}) => '${key}は${errorMessage}';
}
