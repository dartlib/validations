part of validators.comparison;

class GreaterThanValidator extends ConstraintValidator {
  final num value;

  GreaterThanValidator({
    @required this.value,
  })  : assert(value != null),
        super([value]);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return value > this.value as bool;
  }

  @override
  Function message = (num value, Object validatedValue) =>
      '$validatedValue should be greater than $value';
}
