part of validators.comparison;

class LessThanOrEqualValidator extends ConstraintValidator {
  final num value;

  LessThanOrEqualValidator({
    @required this.value,
  })  : assert(value != null),
        super([value]);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return value <= this.value;
  }

  @override
  Function message = (num value, Object validatedValue) =>
      '$validatedValue should be less than or equal to $value';
}
