import '../validator/constraint_validator.dart';
import '../validator/node.dart';
import 'constraint_violation.dart';
import 'validation_context.dart';
import 'value_context.dart';

/// Extend this class to create a Validator for a [Type]
///
/// Example:
///
///     class User {
///       @Alphanumeric
///       @NotNull
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
  Map<String, List<ConstraintValidator>> _constraintValidators;
  Map<String, List<ConstraintValidator>> getConstraintValidators();
  Map<String, dynamic> props(T props);
  ValidationContext validationContext = ValidationContext();

  Validator() {
    _constraintValidators = getConstraintValidators();
  }

  Set<ConstraintViolation> validate(T object, [ValueContext context]) {
    if (context == null) {
      context = _createRootValueContext(
        object.runtimeType.toString(),
        object,
      );
    }
    final violations = Set<ConstraintViolation>();

    final keys = _constraintValidators.keys.iterator;

    while (keys.moveNext()) {
      final propertyViolations =
          _validateProperty(object, keys.current, context);

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
  /// Otherwise returns [null].
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
    if (context == null) {
      context = _createRootValueContext(
        object.runtimeType.toString(),
        object,
      );
    }

    final properties = props(object);

    if (properties.containsKey(name)) {
      final propertyValue = properties[name];

      final valueNode = Node(name: name);

      context.node.append(valueNode);

      // Could be reduced to only ValueContext as a node. simpler.
      final valueContext = ValueContext(
        node: valueNode,
        value: propertyValue,
      );

      return _validateValue(name, propertyValue, object, valueContext);
    }

    return Set<ConstraintViolation>();
  }

  Set<ConstraintViolation> _validateValue(String name, Object value,
      [validatedObject, ValueContext valueContext]) {
    if (!this._constraintValidators.containsKey(name)) {
      throw 'No validator found for `$name`';
    }

    if (valueContext == null) {
      valueContext = _createRootValueContext(
        value.runtimeType.toString(),
        value,
      );
    }

    final validators = this._constraintValidators[name].iterator;
    final violations = Set<ConstraintViolation>();

    while (validators.moveNext()) {
      final validator = validators.current;

      if (!validator.isValid(value, valueContext)) {
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
            ),
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
