typedef StringValidationCallback = String? Function(String? value);
typedef ValidationCallback<T> = String? Function(T value);
// C# Action<T>
typedef Action<T> = Function(T builder);

class ValidationBuilder {
  ValidationBuilder({this.requiredOption = true, this.requiredMessage});

  final List<StringValidationCallback> validations = [];
  final bool requiredOption;
  final String? requiredMessage;

  /// Clears validation list and adds required validation if
  /// [optional] is false
  ValidationBuilder reset() {
    validations.clear();
    return this;
  }

  /// Adds new item to [validations] list, returns this instance
  ValidationBuilder add(StringValidationCallback validator) {
    validations.add(validator);
    return this;
  }

  /// Tests [value] against defined [validations]
  String? test(String? value) {
    if (value == null && requiredOption == true) {
      return _requiredMessage(requiredMessage);
    } else if (value == null && requiredOption == false) {
      return null;
    }

    for (var validate in validations) {
      final result = validate(value);
      if (result != null) {
        return result;
      }
    }
    return null;
  }

  /// Returns a validator function for FormInput
  StringValidationCallback build() => test;

  static final RegExp _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-\_]+(\.[a-zA-Z]+)*$");
  static final RegExp _nonDigitsExp = RegExp(r'[^\d]');
  static final RegExp _digitsExp = RegExp(r'^[0-9]');
  static final RegExp _anyLetter = RegExp(r'[A-Za-z]');
  static final RegExp _phoneRegExp = RegExp(r'^010[0-9]{8}$');
  static final RegExp _resNumRegExp = RegExp(r'^[0-9]{13}$');

  static final RegExp _ipv4RegExp = RegExp(
      r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$');
  static final RegExp _ipv6RegExp = RegExp(
      r'^(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))$');
  static final RegExp _urlRegExp = RegExp(
      r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)');

  String _requiredMessage(message) => message ?? "필수 입력값입니다.";

  String _resNumMessage(message) => message ?? "13자리의 숫자만 입력가능합니다.";

  String _minLengthMessage(minLength, message) =>
      message ?? "최소 ${minLength}자리의 문자만 입력가능합니다.";

  String _maxLengthMessage(maxLength, message) =>
      message ?? "최대 ${maxLength}자리의 문자만 입력가능합니다.";

  String _digitMessage(message) => message ?? "숫자만 입력가능합니다.";

  String _emailMessage(message) => message ?? "올바르지 않은 형식의 이메일 주소입니다.";

  String _phoneNumMessage(message) => message ?? "올바르지 않은 형식의 휴대전화 번호입니다.";

  /// Value length must be greater than or equal to [minLength]
  ValidationBuilder minLength(int minLength, [String? message]) {
    return add((v) {
      return v!.length < minLength
          ? _minLengthMessage(minLength, message)
          : null;
    });
  }

  /// Value length must be less than or equal to [maxLength]
  ValidationBuilder maxLength(int maxLength, [String? message]) {
    return add((v) {
      return v!.length > maxLength
          ? _maxLengthMessage(maxLength, message)
          : null;
    });
  }

  /// Value must match [regExp]
  ValidationBuilder regExp(RegExp regExp, String message) =>
      add((v) => regExp.hasMatch(v!) ? null : message);

  /// Value must be a well formatted email
  ValidationBuilder email([String? message]) =>
      add((v) => _emailRegExp.hasMatch(v!) ? null : _emailMessage(message));

  // needed for short circuiting the full validation

  /// Value must be a well formatted phone number
  ValidationBuilder phone([String? message]) =>
      add((v) => !_anyLetter.hasMatch(v!) &&
              _phoneRegExp.hasMatch(v.replaceAll(_nonDigitsExp, ''))
          ? null
          : _phoneNumMessage(message));

  ValidationBuilder resNumber([String? message]) =>
      add((v) => !_anyLetter.hasMatch(v!) &&
              _resNumRegExp.hasMatch(v.replaceAll(_nonDigitsExp, ''))
          ? null
          : _resNumMessage(message));

  /// Value must be a well formatted IPv4 address
  ValidationBuilder ip([String? message]) =>
      add((v) => _ipv4RegExp.hasMatch(v!) ? null : message);

  /// Value must be a well formatted IPv6 address
  ValidationBuilder ipv6([String? message]) =>
      add((v) => _ipv6RegExp.hasMatch(v!) ? null : message);

  /// Value must be a well formatted URL address
  ValidationBuilder url([String? message]) =>
      add((v) => _urlRegExp.hasMatch(v!) ? null : message);
}
