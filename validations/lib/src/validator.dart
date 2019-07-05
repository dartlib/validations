import 'constraint_validator.dart';
import 'constraint_violation.dart';
import 'node.dart';
import 'validator_context.dart';

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
  Map<String, List<ConstraintValidator>> getConstraintValidators();
  Map<String, dynamic> props(T props);
  ValidationContext validationContext = ValidationContext();

  /*
  Set<ConstraintViolation> validate(T object, [ValueContext context]) {
    if (context == null) {
      context = createRootContext();
    }
  }
  */

  Set<ConstraintViolation> validate(T object, [ValueContext context]) {
    if (context == null) {
      context = _createRootValueContext(
        object.runtimeType.toString(),
        object,
      );
    }
    final violations = Set<ConstraintViolation>();

    final keys = getConstraintValidators().keys.iterator;

    while (keys.moveNext()) {
      final propertyViolations =
          validateProperty(object, keys.current, context);

      if (propertyViolations.isNotEmpty) {
        violations.addAll(propertyViolations);
      }
    }

    return violations;
  }

  ValueContext _createRootValueContext(String type, T value) {
    return ValueContext(
      node: Node(name: type),
      value: value,
    );
  }

  Set<ConstraintViolation> validateProperty(T object, String name,
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

      return validateValue(name, propertyValue, object, valueContext);
    }

    return Set<ConstraintViolation>();
  }

  Set<ConstraintViolation> validateValue(String name, Object value,
      [validatedObject, ValueContext valueContext]) {
    if (!this.getConstraintValidators().containsKey(name)) {
      throw 'No validator found for `$name`';
    }

    if (valueContext == null) {
      valueContext = _createRootValueContext(
        value.runtimeType.toString(),
        value,
      );
    }

    final validators = this.getConstraintValidators()[name].iterator;
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

    return validationContext.constraintViolations;
  }
}
