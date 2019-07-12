part of validator;

class ValidationContext {
  bool failFast = false;

  Set<ConstraintViolation> constraintViolations = <ConstraintViolation>{};

  void reset() {
    constraintViolations = <ConstraintViolation>{};
  }
}
