import 'package:validator/src/validator_context.dart';

import 'constraint_validator.dart';
import 'constraint_violation.dart';

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
  Map<String, List<ConstraintValidator>> validators;
  Map<String, dynamic> props(T props);

  Set<ConstraintViolation<T>> validate(T object) {
    final violations = Set<ConstraintViolation>();

    final keys = validators.keys.iterator;

    while (keys.moveNext()) {
      final propertyViolations = validateProperty(object, keys.current);

      if (propertyViolations.isNotEmpty) {
        violations.addAll(propertyViolations);
      }
    }

    return violations;
  }

  Set<ConstraintViolation<T>> validateProperty(T object, String name) {
    final properties = props(object);

    if (properties.containsKey(name)) {
      final propertyValue = properties[name];

      return validateValue(name, propertyValue, object);
    }

    return Set<ConstraintViolation<T>>();
  }

  Set<ConstraintViolation> validateValue(String name, Object value,
      [validatedObject]) {
    final context = ValidatorContext();
    final validators = this.validators[name].iterator;
    final violations = Set<ConstraintViolation>();

    while (validators.moveNext()) {
      final validator = validators.current;

      if (!validator.isValid(value, context)) {
        violations.add(
          ConstraintViolation(
            validatedObject: validatedObject,
            invalidValue: value,
            message: validator.message,
          ),
        );
      }
    }

    return violations;
  }
}
