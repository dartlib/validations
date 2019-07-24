part of validator;

abstract class ClassConstraintValidator<ValueType>
    extends ConstraintValidator<PropertyMap<ValueType>> {
  ClassConstraintValidator(List argumentValues) : super(argumentValues);

  /// For class level constraint validators the message
  /// function defaults to `null`;
  @override
  Function message;

  /// Tracks the fields affected by this class level validator.
  ///
  /// Is used when validating at the property level and determine
  /// whether any class level validations have to be taken into concern.
  ///
  /// If not the class level checks can be skipped.
  List<String> affectedFields;
}
