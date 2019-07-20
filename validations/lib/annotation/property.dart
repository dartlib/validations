part of annotation;

@immutable
class _Property {
  const _Property();
}

/// Used to mark the value of a parameter in a class level annotation
/// as being a property of the validated class.
///
/// Because class level annotations will refer to properties
/// of the validated model, there needs to be a way to hint
/// the validator these properties will be accessed.
///
/// `@property` ensures these properties will show up in
/// the generated props() method.
///
/// Example:
///
///    @immutable
///    @Target({ElementType.CLASS})
///    class FieldMatch extends ValidatorAnnotation {
///      @property
///      final String baseField;
///      @property
///      final String matchField;
///      const FieldMatch({
///        this.baseField,
///        this.matchField,
///        String message,
///        List<String> groups,
///      }) : super(message, groups);
///   }
///
///  In this case the *values* of `baseField` and `matchField` will refer to
///  properties within the validated class.
///
///  Without the `@property` annotation the parameters are just strings and
///  it cannot be easily inferred they are meant to be references to
///  class properties.
///
/// Once the parameters are properly annotated with `@property`,
/// the properties can be accessed from your custom validator class:
///
///  Example:
///
///    @override
///    bool isValid(ValueType value, ValueContext context) {
///        final props = context.validator.props(value);
///
///        final baseValue = props[baseField];
///        final matchValue = props[matchField];
///
///        return baseValue == matchValue || matchValue == '' || matchValue == null;
///    }
const property = _Property();
