// ignore_for_file: public_member_api_docs, sort_constructors_first
class InputValidator {
  final bool? isRequired;
  final bool? isEmail;
  final bool? isInteger;
  final bool? isDouble;
  final double? min;
  final double? max;
  final int? minLength;
  final int? maxLength;

  InputValidator({
    this.isRequired,
    this.isEmail,
    this.isInteger,
    this.isDouble,
    this.min,
    this.max,
    this.minLength,
    this.maxLength,
  });

  String? call(String? value) {
    //todo
  }

  InputValidator copyWith({
    bool? isRequired,
    bool? isEmail,
    bool? isInteger,
    bool? isDouble,
    double? min,
    double? max,
    int? minLength,
    int? maxLength,
  }) {
    return InputValidator(
      isRequired: isRequired ?? this.isRequired,
      isEmail: isEmail ?? this.isEmail,
      isInteger: isInteger ?? this.isInteger,
      isDouble: isDouble ?? this.isDouble,
      min: min ?? this.min,
      max: max ?? this.max,
      minLength: minLength ?? this.minLength,
      maxLength: maxLength ?? this.maxLength,
    );
  }
}
