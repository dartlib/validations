import 'constraint_violation.dart';

class ValidationContext {
  bool failFast = false;

  Set<ConstraintViolation> constraintViolations = Set();

  void reset() {
    constraintViolations = Set();
  }
}
