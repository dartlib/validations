part of validator;

typedef ValidationMethod = Set<ConstraintViolation> Function();

enum ValidationMode {
  full,
  property,
  value,
}

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
  ClassValidator _classValidator;
  List<FieldValidator> _fieldValidators;
  List<FieldValidator> getFieldValidators() => [];
  ClassValidator getClassValidator() => null;
  PropertyMap<T> props(T props);
  ValidationContext validationContext = ValidationContext();
  ValidationMode mode;

  Validator() {
    _classValidator = getClassValidator();
    _fieldValidators = getFieldValidators();
    _fieldValidatorMap = Map.fromIterable(
      _fieldValidators,
      key: (v) => v.name as String,
      value: (v) => v as FieldValidator,
    );
  }

  Set<ConstraintViolation> validate(T object, [ValueContext context]) {
    context ??= _createRootValueContext(object);

    mode = ValidationMode.full;

    return _runAndReset(() => _validate(props(object), context));
  }

  Set<ConstraintViolation> validateProperty(T object, String name) {
    final context = _createRootValueContext(object);

    mode = ValidationMode.property;

    return _runAndReset(() => _validateProperty(props(object), name, context));
  }

  Set<ConstraintViolation> validateValue(String name, Object value) {
    final context = _createRootValueContext(null);

    mode = ValidationMode.value;

    return _runAndReset(
      () => _validateValue(name, value, null, context),
    );
  }

  /// Does a simple error check.
  ///
  /// Returns the first error if there are any [ConstraintViolation]s.
  ///
  /// Otherwise returns null.
  ///
  String errorCheck(String name, Object value) {
    final context = _createRootValueContext(null);

    final violations =
        _runAndReset(() => _validateValue(name, value, null, context));

    if (violations.isNotEmpty) {
      return violations.first.message;
    }

    return null;
  }

  /// Error check in case there are class level annotations referencing
  /// the field.
  ///
  /// In contrast to [errorCheck] this method requires an [object]
  /// to be passed in order to perform the class level validation.
  ///
  /// Returns the first error if there are any [ConstraintViolation]s.
  ///
  /// Otherwise returns null.
  ///
  String crossErrorCheck(T object, String name, Object value) {
    final properties = props(object).add(name, value);

    final context = _createRootValueContext(object);

    final violations =
        _runAndReset(() => _validateValue(name, value, properties, context));

    if (violations.isNotEmpty) {
      return violations.first.message;
    }

    return null;
  }

  Set<ConstraintViolation> _validate(
    PropertyMap<T> props,
    ValueContext context,
  ) {
    final violations = <ConstraintViolation>{};

    for (var fieldValidator in _fieldValidators) {
      final propertyViolations =
          _validateProperty(props, fieldValidator.name, context);

      if (propertyViolations.isNotEmpty) {
        violations.addAll(propertyViolations);
      }
    }

    if (_classValidator != null) {
      final classViolations = _applyValidators(
        _classValidator.getType(),
        props,
        _classValidator.validators,
        props,
        context,
      );

      if (classViolations.isNotEmpty) {
        violations.addAll(classViolations);
      }
    }

    return violations;
  }

  Set<ConstraintViolation> _validateProperty(
    PropertyMap<T> properties,
    String name,
    ValueContext context,
  ) {
    if (properties.containsKey(name)) {
      final propertyValue = properties[name];

      final valueNode = Node(name: name);

      context.node.append(valueNode);

      final valueContext = ValueContext(
        node: valueNode,
        baseNode: context.node,
        value: propertyValue,
        validatedObject: context.validatedObject,
        validator: this,
      );

      return _validateValue(
        name,
        propertyValue,
        properties,
        valueContext,
      );
    }

    return <ConstraintViolation>{};
  }

  Set<ConstraintViolation> _validateValue(
    String name,
    Object value,
    PropertyMap<T> properties,
    ValueContext valueContext,
  ) {
    if (!_fieldValidatorMap.containsKey(name)) {
      throw Exception('No validator found for `$name`');
    }

    final fieldValidator = _fieldValidatorMap[name];
    final violations = <ConstraintViolation>{};

    if (fieldValidator.validateClass && mode != ValidationMode.full) {
      final props = this.props(valueContext.validatedObject as T);

      final validators =
          List<ClassConstraintValidator>.from(_classValidator.validators)
            ..retainWhere((validator) {
              return validator.affectedFields.contains(name);
            });

      // Populate baseNode with it's children as we are not in full mode.
      for (var propertyName in properties.keys) {
        final valueNode = Node(name: propertyName);

        valueContext.baseNode.append(valueNode);
      }

      final classViolations = _applyValidators(
        _classValidator.getType(),
        props,
        validators,
        props,
        valueContext,
      )..retainWhere(
          // Filter out the model level violation message (if any)
          (violation) => violation.propertyPath == valueContext.node.path);

      violations.addAll(classViolations);
    }

    final validators = fieldValidator.validators;

    violations.addAll(
      _applyValidators(
        name,
        value,
        validators,
        properties,
        valueContext,
      ),
    );

    return violations;
  }

  Set<ConstraintViolation> _applyValidators(
    String name,
    Object value,
    List<ConstraintValidator> validators,
    validatedObject,
    ValueContext valueContext,
  ) {
    final violations = <ConstraintViolation>{};

    for (var validator in validators) {
      if (validator.allowNull && value == null) continue;

      if (!validator.validate(value, valueContext)) {
        if (valueContext.violations.isEmpty) {
          throw Exception(
            'Validation failed but the violations list is empty for ${validator.runtimeType}.',
          );
        }

        violations.addAll(valueContext.violations);
      }
    }

    // track all violations
    validationContext.constraintViolations.addAll(violations);

    return Set.from(validationContext.constraintViolations);
  }

  Set<ConstraintViolation> _runAndReset(ValidationMethod func) {
    final violations = func();

    assert(validationContext.constraintViolations != violations);

    validationContext.reset();

    mode = null;

    return violations;
  }

  ValueContext _createRootValueContext(Object value) {
    final baseNode = Node(
      name: value.runtimeType.toString(),
    );
    final context = ValueContext(
      node: baseNode,
      value: value,
      baseNode: baseNode,
      validatedObject: value,
      validator: this,
    );

    return context;
  }
}
