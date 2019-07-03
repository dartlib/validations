import '../../validations.dart';
import '../constraint_validator.dart';
import '../validator_context.dart';

class MinValidator extends ConstraintValidator<Min> {
  final double value;

  MinValidator({
    this.value,
  });

  @override
  bool isValid(dynamic value, ValidatorContext context) {
    return this.value < value;
  }

  @override
  Function message =
      (dynamic value, double min) => '$value should not be less than $min';
}
