part of validators.comparison;

class GreaterThanOrEqualValidator extends ConstraintValidator {
  final dynamic value;

  GreaterThanOrEqualValidator({
    @required this.value,
  })  : assert(value != null),
        super([value]);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    try {
      return value >= this.value as bool;
    } catch (_) {
      return false;
    }
  }

  @override
  Function message = (num value, Object validatedValue) =>
      '$validatedValue should be greater than or equal to $value';
}
