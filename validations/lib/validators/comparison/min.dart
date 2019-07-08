part of validators.comparison;

class MinValidator extends ConstraintValidator {
  final num value;

  MinValidator({
    @required this.value,
  })  : assert(value != null),
        super([value]);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    if (!(value is num)) return false;

    return value >= this.value;
  }

  @override
  Function message = (num value, Object validatedValue) =>
      '$validatedValue should not be less than $value';
}
