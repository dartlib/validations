part of validators.basic;

class TypeValidator<T> extends ConstraintValidator {
  TypeValidator() : super([T]);

  @override
  bool isValid(dynamic value, ValueContext context) {
    return value is T;
  }

  @override
  Function message = (Type type, Object validatedValue) =>
      'Value is not a ${type.runtimeType}';
}
