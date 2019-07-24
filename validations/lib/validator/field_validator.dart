part of validator;

class FieldValidator<T> {
  final String name;
  final List<ConstraintValidator> validators;
  final bool validateClass;
  const FieldValidator({
    this.name,
    this.validators,
    this.validateClass = false,
  });
  bool checkType(Object value) {
    return value is T;
  }
}
