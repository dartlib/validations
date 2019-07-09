part of validators.comparison;

class IdenticalToValidator extends ConstraintValidator {
  final num value;

  IdenticalToValidator({
    @required this.value,
  })  : assert(value != null),
        super([value]);

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return identical(value, this.value);
  }

  @override
  Function message = (num value, Object validatedValue) =>
      '$validatedValue should be identical to $value';
}
