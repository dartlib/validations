import '../../validations.dart';
import '../constraint_validator.dart';
import '../validator_context.dart';

class MaxValidator extends ConstraintValidator<Max> {
  final double value;

  MaxValidator({
    this.value,
  });

  @override
  bool isValid(dynamic value, ValidatorContext context) {
    return this.value < value;
  }

  @override
  Function message =
      (dynamic value, double max) => '$value should not be more than $max';
}
