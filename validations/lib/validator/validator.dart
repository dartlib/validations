part of validator;

/// This is the base validator class.
///
/// Extend this class to create a Validator for your model.
///
/// Based on the annotations which are defined in your model a validator
/// class is generated.
///
/// The generic [T] argument determines for which model type the generated
/// validator will validate.
///
/// To trigger generation of the validator make sure you annotate it with
/// a [@GenValidator] annotation.
///
/// Example:
///
///     class User {
///       @alphanumeric
///       @notNull
///       @Min(value: 2)
///       @Max(value: 255)
///       String name;
///
///       @Max(value: 150)
///       @Min(value: 18)
///       int age;
///     }
///
///     @GenValidator()
///     class UserValidator extends Validator<User> with _$UserValidator {}
///
abstract class Validator<T> {
  Map<String, FieldValidator> _fieldValidatorMap;
  List<FieldValidator> _fieldValidators;
  List<FieldValidator> getFieldValidators();
  Map<String, dynamic> props(T props);
  ValidationContext validationContext = ValidationContext();

  Validator() {
    _fieldValidators = getFieldValidators();
    _fieldValidatorMap = Map.fromIterable(
      _fieldValidators,
      key: (v) => v.name as String,
      value: (v) => v as FieldValidator,
    );
  }

  Set<ConstraintViolation> validate(T object, [ValueContext context]) {
    context ??= _createRootValueContext(
      object.runtimeType.toString(),
      object,
    );
    final violations = <ConstraintViolation>{};

    for (var fieldValidator in _fieldValidators) {
      final propertyViolations =
          _validateProperty(object, fieldValidator.name, context);

      if (propertyViolations.isNotEmpty) {
        violations.addAll(propertyViolations);
      }
    }

    assert(validationContext.constraintViolations != violations);

    validationContext.reset();

    return violations;
  }

  Set<ConstraintViolation> validateProperty(T object, String name) {
    final violations = _validateProperty(object, name);

    assert(validationContext.constraintViolations != violations);

    validationContext.reset();

    return violations;
  }

  Set<ConstraintViolation> validateValue(String name, Object value) {
    final violations = _validateValue(name, value);

    assert(validationContext.constraintViolations != violations);

    validationContext.reset();

    return violations;
  }

  /// Does a simple error check.
  ///
  /// Returns the first error if there are any [ConstraintViolation]s.
  ///
  /// Otherwise returns null.
  ///
  String errorCheck(String name, Object value) {
    final violations = _validateValue(name, value);

    assert(validationContext.constraintViolations != violations);

    validationContext.reset();

    if (violations.isNotEmpty) {
      return violations.first.message;
    }

    return null;
  }

  Set<ConstraintViolation> _validateProperty(T object, String name,
      [ValueContext context]) {
    context ??= _createRootValueContext(
      object.runtimeType.toString(),
      object,
    );

    final properties = props(object);

    if (properties.containsKey(name)) {
      final propertyValue = properties[name];

      final valueNode = Node(name: name);

      context.node.append(valueNode);

      final valueContext = ValueContext(
        node: valueNode,
        value: propertyValue,
      );

      return _validateValue(name, propertyValue, object, valueContext);
    }

    return <ConstraintViolation>{};
  }

  Set<ConstraintViolation> _validateValue(String name, Object value,
      [validatedObject, ValueContext valueContext]) {
    if (!_fieldValidatorMap.containsKey(name)) {
      throw Exception('No validator found for `$name`');
    }

    valueContext ??= _createRootValueContext(
      value.runtimeType.toString(),
      value,
    );

    final validators = _fieldValidatorMap[name].validators.iterator;
    final violations = <ConstraintViolation>{};

    while (validators.moveNext()) {
      final validator = validators.current;

      if (validator.allowNull && value == null) continue;

      if (!validator.validate(value, valueContext)) {
        final arguments = List.from(validator.argumentValues)..add(value);
        violations.add(
          ConstraintViolation(
            validatedObject: validatedObject,
            propertyPath: valueContext?.node?.path,
            invalidValue: value,
            name: name,
            message: Function.apply(
              validator.message,
              arguments,
            ) as String,
          ),
        );
      }
    }

    // track all violations
    validationContext.constraintViolations.addAll(violations);

    return Set.from(validationContext.constraintViolations);
  }

  ValueContext _createRootValueContext(String type, Object value) {
    return ValueContext(
      node: Node(name: type),
      value: value,
    );
  }
}
