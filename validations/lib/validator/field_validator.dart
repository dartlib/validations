part of validator;

class FieldValidator<T> {
  final String name;
  final List<ConstraintValidator> validators;
  const FieldValidator({
    this.name,
    this.validators,
  });
  bool checkType(Object value) {
    return value is T;
  }
}
