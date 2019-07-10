part of validators.comparison;

class GreaterThanOrEqualValidator extends ConstraintValidator {
  final num value;

  GreaterThanOrEqualValidator({
    @required this.value,
  })  : assert(value != null),
        super([value]);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    if (value is! num) return false;

    return value >= this.value;
  }

  @override
  Function message = (num value, Object validatedValue) =>
      '$validatedValue should be greater than or equal to $value';
}
