part of validator;

/// All validator classes must either extend this class or the
/// [ConstraintValidatorContainer] class.
///
/// All constraint validators will by default allow `null` values to be valid.
///
/// In case a validator does want to check `null` values within the [isValid]
/// method, the extending class can set the [allowNull] property to `false`.
///
/// A constraint validator must populate [argumentValues] correctly.
///
/// The [argumentValues] will be used as input to the [message] function.
///
/// The [argumentValues] can be populated directly by calling the super method.
///
/// Or if [initialize] is overridden from within that method.
///
/// [initialize] is called before each [isValid] call and can be used to initialize
/// any properties which are not easily initializable from the constructor.
///
///
abstract class ConstraintValidator<ValueType> {
  List argumentValues = [];
  List defaultArgumentValues = [];

  /// `null` is allowed by default for every [ConstraintValidator].
  ///
  /// Set this to `false` to handle `null` values yourself.
  bool allowNull = true;

  ConstraintValidator([
    List argumentValues,
  ]) {
    if (argumentValues != null) {
      this.argumentValues = argumentValues;
      defaultArgumentValues = List.of(argumentValues);
    }
  }
  // Called each time before an isValid check.
  void initialize() {}

  void resetArgumentValues() {
    argumentValues = List.of(defaultArgumentValues);
  }

  bool validate(ValueType value, [ValueContext context]) {
    initialize();

    if (allowNull && value == null) return true;

    // in case a constraint validator is called directly without context.
    context ??= ValueContext(
      node: null,
      value: value,
      baseNode: null,
      validatedObject: null,
      validator: null,
    );

    final valid = isValid(value, context);

    if (!valid) {
      if (this is! ClassConstraintValidator && message != null) {
        // builds the default error message, if message is not null.
        final arguments = List.from(argumentValues)..add(value);

        context.violations.add(
          ConstraintViolation(
            validatedObject: context.validatedObject,
            propertyPath: context.node?.path,
            invalidValue: value,
            // name: name,
            name: context?.node?.name,
            message: Function.apply(
              message,
              arguments,
            ) as String,
          ),
        );
      }
    }

    // clear any argument values set during initialize.
    resetArgumentValues();

    return valid;
  }

  bool isValid(ValueType value, ValueContext context);

  Function get message;
}
