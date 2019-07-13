part of validators.comparison;

class NotIdenticalToValidator extends ConstraintValidator {
  final dynamic value;

  NotIdenticalToValidator({
    @required this.value,
  })  : assert(value != null),
        super([value]);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return !identical(value, this.value);
  }

  @override
  Function message = (num value, Object validatedValue) =>
      '$validatedValue should not be identical to $value';
}
