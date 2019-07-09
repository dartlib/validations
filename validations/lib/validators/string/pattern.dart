part of validators.string;

class PatternValidator extends ConstraintValidator {
  final String regexp;
  PatternValidator({
    this.regexp,
  }) : super([regexp]);
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    if (!(value is String)) return false;

    return RegExp(this.regexp).hasMatch(value);
  }

  @override
  Function message = (String regexp, Object validatedValue) =>
      '$validatedValue does not match $regexp';
}
