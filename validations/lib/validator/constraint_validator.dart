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

  /// `null` is allowed by default for every [ConstraintValidator].
  ///
  /// Set this to `false` to handle `null` values yourself.
  bool allowNull = true;

  ConstraintValidator([
    List argumentValues,
  ]) {
    if (argumentValues != null) {
      this.argumentValues = argumentValues;
    }
  }
  // Called each time before an isValid check.
  void initialize() {}

  bool validate(ValueType value, [ValueContext context]) {
    initialize();

    if (allowNull && value == null) return true;

    return isValid(value, context);
  }

  bool isValid(ValueType value, ValueContext context);

  Function get message;
}
