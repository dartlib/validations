import '../../validations.dart';
import '../constraint_validator.dart';
import '../validator_context.dart';

class DecimalMaxValidator extends ConstraintValidator<DecimalMax> {
  final bool inclusive;

  DecimalMaxValidator({this.inclusive});

  @override
  bool isValid(dynamic value, ValidatorContext context) {
    return value <= params.value;
  }
}
