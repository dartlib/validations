part of validators.comparison;

class DivisibleByValidator extends ConstraintValidator {
  final num value;

  DivisibleByValidator({
    @required this.value,
  })  : assert(value != null),
        super([value]);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    if (!(value is num)) return false;

    return value % this.value == 0;
  }

  @override
  Function message = (num value, Object validatedValue) =>
      '$validatedValue should be divisible by $value';
}
