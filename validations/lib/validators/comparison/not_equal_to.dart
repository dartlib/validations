part of validators.comparison;

class NotEqualToValidator extends ConstraintValidator {
  final dynamic value;

  NotEqualToValidator({
    @required this.value,
  })  : assert(value != null),
        super([value]);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return value != this.value;
  }

  @override
  Function message = (num value, Object validatedValue) =>
      '$validatedValue should not be equal to $value';
}
