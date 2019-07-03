import '../../validations.dart';
import '../constraint_validator.dart';
import '../validator_context.dart';

class SizeValidator extends ConstraintValidator<Size> {
  final double max;
  final double min;

  SizeValidator({
    this.max,
    this.min,
  });

  @override
  bool isValid(dynamic value, ValidatorContext context) {
    return min < value && value < max;
  }

  @override
  Function message = (dynamic value, double max, double min) =>
      '$value is not between $min and $max';
}
