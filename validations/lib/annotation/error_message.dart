part of annotation;

@immutable
class _ErrorMessage {
  final String message;
  const _ErrorMessage([this.message]);
}

/// Used to mark a [errorMessage] field in a class level annotation
///
///  @immutable
///  @Target({ElementType.CLASS})
///  class FieldMatch extends ValidatorClassAnnotation {
///    @property
///    final String baseField;
///    @property
///    final String matchField;
///    @ErrorMessage('matchField');
///    final String baseFieldMessage;
///    @errorMessage
///    final String matchFieldMessage;
///    const FieldMatch({
///      this.baseField,
///      this.matchField,
///      this.baseFieldMessage,
///      this.matchFieldMessage,
///      String message, // default class level error message.
///      List<String> groups,
///    }) : super(message, groups);
///  }
///  @FieldMatch(
///    baseField: 'password',
///    matchField: 'passwordConfirm,
///    message: .... // for model validation one message seems ok
///                  // however per field it makes no sense.
///    baseFieldMessage: ... // can be set to '' if desired
///                          //
///    matchFieldMessage: ...
///  )
///  class ....
///
/// Generates as:
///
///  fieldMatchBaseFieldMessage(baseField, matchField, value, validatedObject) {
///     return '';
///  }
///
///  fieldMatchMatchFieldMessage(baseField, matchField, value, validatedObject) {
///     return '';
///  }
///
/// It's up to the constraint validator to assign these error messages.
/// The default errorMessage `message` will always be added to the violations.
/// It's property path will equal the location of the model itself.
///
///
const errorMessage = _ErrorMessage();
