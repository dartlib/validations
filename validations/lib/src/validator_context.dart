import 'package:meta/meta.dart';

import '../validations.dart';
import 'node.dart';

class ValueContext {
  Node node;
  Object value;
  ValueContext({
    @required this.node,
    @required this.value,
  });
}

class ConstraintViolationCreationContext {}

class ConstraintDescriptor {}

// Seems like this is all optional
class ValidatorContext {
  // Below are all optional normally the methods of the ValidatorFactory are used
  // messageInterpolator() - nope
  // traversableResolver() - nope optional
  // constraintValidatorFactory() - nope optional
  // parameterNameProvider() - nope optional
  // clockProvider()
  // addValueExtractor()
  // getValidator

}

class ValidationContext {
  bool failFast = false;

  final Set<ConstraintViolation> constraintViolations = Set();

  void addConstraintFailure(
    ValueContext valueContext,
    ConstraintViolationCreationContext constraintViolationCreationContext,
    ConstraintDescriptor descriptor,
  ) {}
}
